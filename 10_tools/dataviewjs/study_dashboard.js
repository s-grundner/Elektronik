// -----------------------
// Study Dashboard Script
// -----------------------

// --- Global Variables ---

let maxECTS = dv.current().dashboard
	.flatMap(x => {
		if (x === "Bachelor") return 180;
		if (x === "Master") return 120;
	})
	.reduce((acc, x) => acc + x);

let pagesTags = dv.current().dashboard
	.flatMap(x => "#".concat(x))
	.join(" OR ");

let pages = dv.pages(pagesTags)
	.filter(p => !p.file.folder.includes("Rubbish"))
	.filter(p => p.semester !== null);

let all = {
	ects: pages.map(p => p.ects).sum(),
	done: pages.filter(p => p.done).map(p => p.ects).sum(),
	gpa: weightetGPA(pages)
}

let semGroups = pages.groupBy(p => p.semester, (a, b) => semComp(a, b));

// --- View ---

centeredHeader(3, "🔸Studienfortschritt🔸");
studyProgress();
centeredHeader(3, "🔸Semesterfortschritt🔸");
semesterProgress();
dv.paragraph("---");
centeredHeader(2, "🔸Lehrveranstaltungen🔸");
courses();

// --- Functions

function weightetGPA(pgs) {
	let graded = pgs.filter(p => p.grade);
	let totWeighted = graded.map(p => p.grade * p.ects).sum();
	let totECTS = graded.map(p => p.ects).sum()
	return totECTS ? totWeighted / totECTS : 0;
}

function studyProgress() {
	const tableHeader = [
		"Planned Credits",
		"Planned Progress⌛",
		"Completed Credits",
		"True Progress⌛",
		"GPA🐢"
	];
	dv.table(tableHeader, [[
		`${all.ects} / ${maxECTS}`, htmlProg(all.ects / maxECTS * 100),
		`${all.done} / ${maxECTS}`, htmlProg(all.done / maxECTS * 100),
		all.gpa.toFixed(3)
	]]);
}

function semesterProgress() {
	let prg = semGroups.map(g => ({
		key: g.key,
		ects: g.rows.map(p => p.ects).sum(),
		done: g.rows.filter(p => p.done).map(p => p.ects).sum(),
		gpa: weightetGPA(g.rows),
	}));
	const tableHeader = [
		"Semester📆",
		"Semester Credits",
		"Progress⌛",
		"Success⭐"
	];
	dv.table(tableHeader, prg.map(g => [
		semPathDecorator(g.key),
		`${g.done} / ${g.ects}`,
		htmlProg(g.done / g.ects * 100), g.gpa ? g.gpa.toFixed(3) : "--"
	]));
}

function courses() {
	let lva = semGroups.map(g => {
		let sortedRows = g.rows.sort(r => r.file.name, (a, b) => a.localeCompare(b));
		return {
			key: g.key,
			lva: sortedRows.map(r => dv.fileLink(r.file.path, false, r.file.name.replace("{NOTES}", ""))),
			ects: sortedRows.map(r => r.ects),
			done: sortedRows.map(r => r.done ? `✅ **[ ${r.grade || "mEt."} ]**` : "❌")
		};
	});
	const tableHeader = ["📆", "LVA📖", "Credits 💸", "Completed 🥳"];
	dv.table(tableHeader, lva
		.filter(g => g.key === currSemKey() || dv.current().show_all_semesters)
		.map(g => [semEmojiDecorator(g.key), g.lva, g.ects, g.done])
	);
}

function htmlProg(value) {
	return `<progress max=100 value="${value.toFixed(0)}"></progress>`;
}

function centeredHeader(lvl, h) {
	return dv.header(lvl, `<center>${h}</center>`);
}

function currSemKey() {
	let d = new Date();
	let m = d.getMonth();
	let y = d.getFullYear() % 100;
	return (m >= 7 || m <= 1) ? `WS${y - (m <= 2)}` : `SS${y}`;
}

function semComp(a, b) {
	let yearA = parseInt(a.match(/\d+/));
	let yearB = parseInt(b.match(/\d+/));
	return yearB - yearA || b.includes("WS") - a.includes("WS");
}

function semEmojiDecorator(key) {
	return `${(key.includes("WS") ? "☃️🔹" : "🌞🔸")} ${key.match(/\d+/)}`;
}

function semPathDecorator(key) {
	let cmp = semComp(currSemKey(), key);
	if (cmp === 0) return `**${semEmojiDecorator(key)}** 📍`;
	if (cmp < 0) return `${semEmojiDecorator(key)}  :LiFootprints:`;
	return `${semEmojiDecorator(key)}`
}
