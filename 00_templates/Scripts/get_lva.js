async function my_function(msg) {
	await tp.system.prompt;
	return `Message from my script: ${msg}`;
}
module.exports = my_function;

async function get_lva() {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
	tR += paste_type;
}

async function from(semester) {
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
	let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
	tR += paste_lva;
}

function dsds() {
	return { from, type }
}