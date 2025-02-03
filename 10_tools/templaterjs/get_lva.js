async function type(tp) {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
	return paste_type;
}

async function ws23(tp) { // WS23
	const lva = ["Mathematik 1", "Einführung Elektrotechnik", "Softwareentwicklung 1",
		"Technische Informatik", "Physik 1 für TechnikerInnen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss24(tp) { // SS24
	const lva = ["Mathematik 2", "Elektrotechnik", "Algorithmen und Datenstrukturen",
		"Softwareentwicklung 2", "Hardwaredesign", "Networked Embedded Systems",
		"Studienbezogene Praxiserfahrung", "Genderstudies"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws24(tp) { // WS24
	const lva = [
		"Mathematik 3", "Einführung Elektronik", "EMV und SI", "Signale und Systeme",
		"Hardwaredesign", "Systems Programming", "HF-Systemtechnik 1", "LaTeX 1"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss25(tp) { // SS25
	const lva = ["Technische Elektronik", "Elektrische Maschinen und Antriebselektronik",
		"Elektrische Messtechnik und Sensorik", "Regelungstechnik", "Signalverarbeitung",
		"Halbleiterschaltungstechnik", "Computergestützter Entwurf analoger Schaltungen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws25(tp) { // WS25
	const lva = ["Wahrscheinlichkeitstheorie und stochastische Prozesse",
		"Analoge Schaltungstechnik", "Elektrische Messtechnik und Sensorik",
		"Übertragungstechnik", "Networked Embedded Systems", "Introduction to Linux",
		"Entwurf Integrierter Schaltungen "];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss26(tp) { // SS26
	const lva = ["Theoretische Elektrotechnik",
		"Machine Learning and Pattern Classification",
		"Rechnerarchitektur", "Embedded and Pervasive Systems"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

function sem(tp, paste_sem) {
	switch (paste_sem) {
		case "WS23":
			return ws23(tp);
		case "SS24":
			return ss24(tp);
		case "WS24":
			return ws24(tp);
		case "SS25":
			return ss25(tp);
		case "WS25":
			return ws25(tp);
		case "SS26":
			return ss26(tp);
		default:
			return paste_sem;
	}
}

function type_string(type) {
	switch (type) {
		case "VL":
			return "Vorlesung";
		case "UE":
			return "Übung";
		case "KV":
			return "Kombinierte Lehrveranstaltung";
		case "PR":
			return "Praktikum";
		default:
			return type;
	}
}

function type_other(type) {
	switch (type) {
		case "VL":
			return "UE";
		case "UE":
			return "VL";
		default:
			return type;
	}
}

function note_name(name, type) {
	return `{NOTES} ${name} ${type}`;
}
function note_link(name, type) {
	let n = note_name(name, type).replace(/ /g, "%20");
	return `[${type_string(type)}](${n}.md)`;
}

function sem_type() {
	return ["WS23", "SS24", "WS24", "SS25", "WS25", "SS26"];
}

function get_lva() {
	return { type, type_string, type_other, note_name, note_link, sem }
}

module.exports = get_lva
