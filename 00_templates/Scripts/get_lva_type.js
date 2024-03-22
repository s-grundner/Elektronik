function get_lva_type() {
	const type = ["VL", "UE", "KV", "PR"];
	let paste_type = tp.system.suggester(type, type, true, "LVA Type");
	return paste_type;
}
module.exports = get_lva_type;