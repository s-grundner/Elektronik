async function ws23(tp) {
	const lva = ["Mathematik 1", "Einf. ET", "Softwareentwicklung 1", "Physik für TechnikerInnen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	switch (paste_lva) {
		case value:
			
			break;
	
		default:
			break;
	}
	return paste_lva;
}

async function ss24(tp) {
	const lva = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen"];
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}

function get_ue(tp) {
	return { ws23, ss24 }
}

module_exports = get_ue