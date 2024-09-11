async function type(tp) {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
	return paste_type;
}

async function ws1(tp) { // WS23
	const lva = ["Mathematik 1", "Einführung Elektrotechnik", "Softwareentwicklung 1", "Technische Informatik", "Physik 1 für TechnikerInnen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss2(tp) { // SS24
	const lva = ["Mathematik 2", "Elektrotechnik", "Algorithmen und Datenstrukturen", "Softwareentwicklung 2", "Hardwaredesign", "Networked Embedded Systems", "Studienbezogene Praxiserfahrung", "Genderstudies"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws3(tp) { // WS24
	const lva = ["Mathematik 3", "Einführung Elektronik", "EMV und SI", "Signale und Systeme", "Hardwaredesign", "Systems Programming", "HF-Systemtechnik 1"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss4(tp) { // SS25
	const lva = ["Technische Elektronik", "Elektrische Maschinen und Antriebselektronik", "Elektrische Messtechnik und Sensorik", "Regelungstechnik", "Signalverarbeitung"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ws5(tp) { // WS25
	const lva = ["Wahrscheinlichkeitstheorie und stochastische Prozesse", "Analoge Schaltungstechnik", "Elektrische Messtechnik und Sensorik", "Übertragungstechnik", "Networked Embedded Systems"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss6(tp) { // SS26
	const lva = ["Theoretische Elektrotechnik", "Machine Learning and Pattern Classification", "Rechnerarchitektur"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

function get_lva() {
	return { type, ws1, ss2, ws3, ss4, ws5, ss6 }
}

module.exports = get_lva
