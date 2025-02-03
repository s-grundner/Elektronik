// -----------------------
// Study Dashboard Script
// -----------------------

const filt = "#BACHELOR AND -#PLANNING";

// Overall Progress Variables

let pages = dv.pages(filt).filter(p => !p.file.folder.includes("Rubbish"));
let maxECTS = dv.current().ects;

let all = {
	pECTS: pages.map(p => p.ects).sum(),
	cECTS: pages.filter(p => p.done).map(p => p.ects).sum(),
	gpa: pages.filter(p => p.grade).map(p => p.grade).avg()
}

// Semester Grouping

let sem = pages
	.groupBy(p => p.semester, (a, b) => {
		let numA = parseInt(a.match(/\d+/));
		let numB = parseInt(b.match(/\d+/));
		return numB - numA || b.includes("WS") - a.includes("WS");
	})
	.map(g => ({
		sem: (g.key.includes("WS") ? "⛄🔹 " : "🌞🔸 ") + g.key.match(/\d+/),
		ects: g.rows.map(p => p.ects).sum(),
		done: g.rows.filter(p => p.done).map(p => p.ects).sum(),
		gpa: g.rows.filter(p => p.grade).map(p => p.grade).avg()
	}));


// Switch for different modes  

switch (input.mode) {
	case "Studienfortschritt":
		await studyProgress();
		break;
	case "Semesterfortschritt":
		await semesterProgress();
		break;
	case "Lehrveranstaltungen":
		await courses();
		break;
	case "Prüfungen":
		await exams();
		break;
	default:
		break;
}

// ---


async function studyProgress() {
	let pRatio = pECTS / totalECTS * 100;
	let cRatio = cECTS / totalECTS * 100;

	await dv.table(["Planned Credits", "Planned Progress⌛", "Completed Credits", "True Progress⌛", "GPA🐢"],
		[[
			all.pECTS + " / " + maxECTS, htmlProg(pRatio),
			all.cECTS + " / " + maxECTS, htmlProg(cRatio),
			all.gpa.toFixed(3)
		]]);
}

async function semesterProgress() {
	dv.execute(
		`TABLE
		default(sum(filter(rows, (r) => r.done).ects), 0) + " / " + sum(rows.ects) AS "Semester Credits",
		"<progress max=100 value=" + round(100 * default(sum(filter(rows, (r) => r.done).ects), 0) / sum(rows.ects)) + ">"
			AS "Progress⌛",
		round(average(nonnull(rows.grade)), 3) AS "Success⭐"
		FROM #BACHELOR AND -#PLANNING
		WHERE !contains(file.folder, "Rubbish")
		GROUP BY choice(contains(semester, "WS"),
			"⛄🔹 " + substring(semester, 2, 4),
			"🌞🔸 " + substring(semester, 2, 4)
		) AS "Semester📆"
		SORT number(string(number(rows.semester))) + choice(contains(rows.semester, "WS"), 0.5, 0) DESC`
	);

}

async function courses() {
	// Todo: convert this to actual dv.table
	dv.execute(
		`TABLE
			link(rows.file.link, replace(rows.file.name, "{NOTES}", "")) AS "LVA📖",
			rows.ects AS "Credits 💸",
			map(rows, (r) => choice(r.done,"✅" + " **[ " + default(r.grade, "mEt.") + " ]**", "❌")) AS "Completed 🥳"
		FROM #BACHELOR AND -#PLANNING

		FLATTEN
			choice(date(today).month >= 9 OR date(today).month <= 3,
				"WS" + (date(today).year % 100 - choice(date(today).month <= 3, 1, 0)),
				"SS" + (date(today).year % 100))
			AS currentSemester

		WHERE !contains(file.folder, "Rubbish")
		AND (this.show_all_semesters OR semester = currentSemester)

		GROUP BY choice(contains(semester, "WS"),
			"⛄🔹 " + substring(semester, 2, 4),
			"🌞🔸 " + substring(semester, 2, 4))
		AS "📆"

		SORT number(string(number(rows.semester))) + choice(contains(rows.semester, "WS"), 0.5, 0) DESC`
	);
}

async function exams() {
	dv.execute(
		`TABLE WITHOUT ID
			link(file.name, join(subject)) AS "Prüfungstermin Ausstehend",
			join(professor, ",") AS "Professor",
			choice(contains(semester, "WS"),
				"⛄🔹 " + substring(semester, 2, 4),
				"🌞🔸 " + substring(semester, 2, 4))
			AS "📆"   
		FROM #BACHELOR AND -#PLANNING
		FLATTEN exam AS singleExam
		WHERE singleExam = "TBD" AND !contains(file.folder, "Rubbish")`
	);
	dv.execute(
		`TABLE WITHOUT ID
			link(file.name, join(subject)) AS "Prüfungstermin Ausstehend",
			join(professor, ",") AS "Professor",
			choice(contains(semester, "WS"),
				"⛄🔹 " + substring(semester, 2, 4),
				"🌞🔸 " + substring(semester, 2, 4))
			AS "📆"   
		FROM #BACHELOR AND -#PLANNING
		FLATTEN exam AS singleExam
		WHERE singleExam = "TBD" AND !contains(file.folder, "Rubbish")`
	)
}

function htmlProg(value) {
	return `<progress max=100 value="${value.toFixed(0)}"></progress>`;
}