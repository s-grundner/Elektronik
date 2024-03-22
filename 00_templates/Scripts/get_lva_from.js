function get_lva_from(semester) {
	let lva;
	switch (semester) {
		case "WS23":
			lva = ["Mathematik 1", "Einf. ET", "Softwareentwicklung 1", "Technisch Informatik", "Physik für TechnikerInnen"];
			break;
		case "SS24":
			lva = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen", "Hardwareentwurf mit VHDL", "Networked Embedded Systems"];
			break;
		default:
			lva = []
			break;
	}
	let paste_lva = tp.system.suggester(lva, lva, true, "LVA Name");
	return paste_lva;
}
module.exports = get_lva_from;