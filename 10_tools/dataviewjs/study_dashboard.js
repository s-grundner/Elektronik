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
typeSelection();

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
		`${all.ects} / ${maxECTS}`, htmlProg(all.ects, maxECTS),
		`${all.done} / ${maxECTS}`, htmlProg(all.done, maxECTS),
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
		htmlProg(g.done, g.ects),
		g.gpa ? g.gpa.toFixed(3) : "--"
	]));
}

function courses() {
	let lva = semGroups.map(g => {
		let sortedRows = g.rows.sort(r => r.file.name, (a, b) => a.localeCompare(b));
		return {
			key: g.key,
			lva: sortedRows.map(r => dv.fileLink(r.file.path, false, r.file.name.replace("{NOTES}", ""))),
			ects: sortedRows.map(r => r.ects),
			done: sortedRows.map(r => completeDecorator(r.done, r.grade))
		};
	});
	const tableHeader = ["📆", "LVA📖", "Credits 💸", "Completed 🥳"];
	dv.table(tableHeader, lva
		.filter(g => g.key === currSemKey() || dv.current().show_all_semesters)
		.map(g => [semEmojiDecorator(g.key), g.lva, g.ects, g.done])
	);
}

function typeSelection() {

	let maxCompulsory = dv.current().dashboard
		.flatMap(x => {
			if (x === "Bachelor") return 147;
			if (x === "Master") return 57;
		})
		.reduce((acc, x) => acc + x);

	let maxElective = dv.current().dashboard
		.flatMap(x => {
			if (x === "Bachelor") return 21;
			if (x === "Master") return 48;
		})
		.reduce((acc, x) => acc + x);

	let maxFreeElective = dv.current().dashboard
		.flatMap(x => {
			if (x === "Bachelor") return 12;
			if (x === "Master") return 15;
		})
		.reduce((acc, x) => acc + x);

	const tableHeader = [
		"Pflicht",
		"Wahlfach",
		"Freie Studienleistung",
	];
	// Group by type
	let selectedCompulsory = pages.filter(p => p.type === "Pflicht").map(p => p.ects).sum();
	let selectedElective = pages.filter(p => p.type === "Wahl").map(p => p.ects).sum();
	let selectedFreeElective = pages.filter(p => p.type === "Frei").map(p => p.ects).sum();
	
	dv.table(tableHeader, [[
		htmlProg(selectedCompulsory, maxCompulsory) + `\n ${selectedCompulsory} / ${maxCompulsory}`,
		htmlProg(selectedElective, maxElective) + `\n ${selectedElective} / ${maxElective}`,
		htmlProg(selectedFreeElective, maxFreeElective) + `\n ${selectedFreeElective} / ${maxFreeElective}`
	]]);
}
// --- Locale ---

function currSemKey() {
	let d = new Date();
	let m = d.getMonth();
	let y = d.getFullYear() % 100;
	return (m >= 7 || m <= 1) ? `WS${y - (m <= 2)}` : `SS${y}`;
}

// --- Comparators ---

function semComp(a, b) {
	let yearA = parseInt(a.match(/\d+/));
	let yearB = parseInt(b.match(/\d+/));
	return yearB - yearA || b.includes("WS") - a.includes("WS");
}

// --- Decorators ---

function htmlProg(quota, base) {
	let value = quota / base * 100;
	return `<progress max=100 value="${value.toFixed(0)}"></progress>`;
}

function centeredHeader(lvl, h) {
	return dv.header(lvl, `<center>${h}</center>`);
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

function completeDecorator(isDone, grade) {
	return isDone ? `✅ **[ ${grade || "mEt."} ]**` : "❌";
}
