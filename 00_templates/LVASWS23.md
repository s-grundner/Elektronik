<%* const type = ["VL", "UE", "KV", "PR"]
let paste_type = await tp.system.suggester(type, type, true, "LVA Type")_%>
<%* const subs = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen", "Hardwareentwurf mit VHDL", "Networked Embedded Systems"]
let paste_lva = await tp.system.suggester(subs, subs, true, "LVA Name") _%>