async function type(tp) {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
	return paste_type;
}

async function ws23(tp) {
	const lva = ["Mathematik 1", "Einführung Elektrotechnik", "Softwareentwicklung 1", "Technische Informatik", "Physik 1 für TechnikerInnen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

async function ss24(tp) {
	const lva = ["Mathematik 2", "Elektrotechnik", "Algorithmen und Datenstrukturen", "Softwareentwicklung 2", "Hardwaredesign", "Networked Embedded Systems"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

function get_lva() {
	return { type, ws23, ss24, ws25 }
}

module.exports = get_lva