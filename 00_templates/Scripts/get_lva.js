async function type(tp) {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
	return paste_type;
}

async function ws23(tp) { // WS23
	const lva = ["Mathematik 1", "Einführung Elektrotechnik", "Softwareentwicklung 1", "Technische Informatik", "Physik 1 für TechnikerInnen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss24(tp) { // SS24
	const lva = ["Mathematik 2", "Elektrotechnik", "Algorithmen und Datenstrukturen", "Softwareentwicklung 2", "Hardwaredesign", "Networked Embedded Systems", "Studienbezogene Praxiserfahrung", "Genderstudies"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws24(tp) { // WS24
	const lva = ["Mathematik 3", "Einführung Elektronik", "EMV und SI", "Signale und Systeme", "Hardwaredesign", "Systems Programming", "HF-Systemtechnik 1"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss25(tp) { // SS25
	const lva = ["Technische Elektronik", "Elektrische Maschinen und Antriebselektronik", "Elektrische Messtechnik und Sensorik", "Regelungstechnik", "Signalverarbeitung", "Halbleiterschaltungstechnik", "Computergestützter Entwurf analoger Schaltungen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws25(tp) { // WS25
	const lva = ["Wahrscheinlichkeitstheorie und stochastische Prozesse", "Analoge Schaltungstechnik", "Elektrische Messtechnik und Sensorik", "Übertragungstechnik", "Networked Embedded Systems"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss26(tp) { // SS26
	const lva = ["Theoretische Elektrotechnik", "Machine Learning and Pattern Classification", "Rechnerarchitektur", "HLST"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

function get_lva() {
	return { type, ws23, ss24, ws24, ss25, ws25, ss26 }
}

module.exports = get_lva
