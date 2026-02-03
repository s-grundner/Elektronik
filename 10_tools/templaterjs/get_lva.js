async function sug_lva(tp, sem) {
    try {
        const filePath = `10_tools/templaterjs/lva_lists/${sem}.md`;
        console.log(filePath);
        const tFile = tp.app.vault.getFileByPath(filePath);
        const fileContent = await tp.app.vault.read(tFile);
        const suggestions = fileContent.split(/\r?\n/).filter(Boolean);
        let lva = await tp.system.suggester(suggestions, suggestions, true, "LVA Name");
        return lva;
    } catch (err) {
        console.log(err);
        return "Error fetching LVA - check console";
    }
}

async function sug_category(tp) {
    const suggestions = ["Pflicht", "Wahl", "Frei"];
    let type = await tp.system.suggester(suggestions, suggestions, true, "Kategorie");
    return type;
}

async function sug_type(tp) {
    const suggestions = ["VL", "UE", "KV", "PR"];
    let type = await tp.system.suggester(suggestions, suggestions, true, "LVA Type");
    return type;
}

async function sug_sem(tp) {
    const suggestions = ["WS23", "SS24", "WS24", "SS25", "WS25", "SS26", "WS26", "SS27", "WS27", "SS28"];
    let sem = await tp.system.suggester(suggestions, suggestions, true, "Semester");
    return sem;
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

function sem_to_program(sem) {
    switch (sem) {
        case "WS23":
        case "SS24":
        case "WS24":
        case "SS25":
        case "WS25":
        case "SS26":
            return "Bachelor";
        default:
            return "Master";
    }
}

function note_name(name, type) {
    return `{NOTES} ${name} ${type}`;
}

function note_url(name, type) {
    return `${note_name(name, type).replace(/ /g, "%20")}.md`;
}

function note_link(name, type) {
    return `[${type_string(type)}](${note_url(name, type)})`;
}

function get_lva() {
    return { sug_type, sug_category, sug_lva, sug_sem, type_string, type_other, note_name, note_link, note_url, sem_to_program }
}

module.exports = get_lva
