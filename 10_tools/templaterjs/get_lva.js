
async function ws23(tp) { // WS23 - Bachelor 
    const lva = [
        "Mathematik 1",
        "Einführung Elektrotechnik",
        "Softwareentwicklung 1",
        "Technische Informatik",
        "Physik 1 für TechnikerInnen"];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ss24(tp) { // SS24 - Bachelor 
    const lva = [
        "Mathematik 2",
        "Elektrotechnik",
        "Algorithmen und Datenstrukturen",
        "Softwareentwicklung 2",
        "Hardwaredesign",
        "Networked Embedded Systems",
        "Studienbezogene Praxiserfahrung",
        "Genderstudies"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ws24(tp) { // WS24 - Bachelor 
    const lva = [
        "Mathematik 3",
        "Einführung Elektronik",
        "EMV und SI",
        "Signale und Systeme",
        "Hardwaredesign",
        "Systems Programming",
        "HF-Systemtechnik 1",
        "LaTeX 1"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ss25(tp) { // SS25 - Bachelor 
    const lva = [
        "Technische Elektronik",
        "Elektrische Maschinen und Antriebselektronik",
        "Elektrische Messtechnik und Sensorik",
        "Regelungstechnik",
        "Signalverarbeitung"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ws25(tp) { // WS25 - Bachelor 
    const lva = [
        "Wahrscheinlichkeitstheorie und stochastische Prozesse",
        "Analoge Schaltungstechnik",
        "Elektrische Messtechnik und Sensorik",
        "Übertragungstechnik",
        "Networked Embedded Systems",
        "Introduction to Linux",
        "Entwurf Integrierter Schaltungen",
        "Regelungstechnik"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ss26(tp) { // SS26 - Bachelor 
    const lva = [
        "Theoretische Elektrotechnik", 
        "Bachelorarbeit",
        "Machine Learning and Pattern Classification",
        "Rechnerarchitektur",
        "Embedded and Pervasive Systems"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

// ------------------------------------------------------------ 

async function ws26(tp) { // WS26 - Master
    const lva = [
        "Höhere Elektrodynamik",
        "Entwurf von komplexen Integrierten Schaltkreisen",
        "Optimum and Adaptive Signal Processing Systems"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ss27(tp) { // SS27 - Master 
    const lva = [
        "Hochfrequenztechnik 1",
        "Numerik und Optimierung",
        "Digitale Übertragungssysteme"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ws27(tp) { // WS27 - Master 
    const lva = [];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

async function ss28(tp) { // SS28 - Master 
    const lva = [
        "Masterarbeit",
        "Masterarbeitsseminar", 
        "Masterprüfung"
    ];
    let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
    return paste_lva;
}

// ------------------------------------------------------------ 

async function type(tp) {
    const type = ["VL", "UE", "KV", "PR"];
    let paste_type = await tp.system.suggester(type, type, true, "LVA Type");
    return paste_type;
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
        case "WS26":
            return ws26(tp);
        case "SS27":
            return ss27(tp);
        case "WS27":
            return ws27(tp);
        case "SS28":
            return ss28(tp);
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
function note_filename(name, type) {
    return `${note_name(name, type).replace(/ /g, "%20")}.md`;
}
function note_link(name, type) {
    return `[${type_string(type)}](${note_filename(name, type)})`;
}

function sem_type() {
    return ["WS23", "SS24", "WS24", "SS25", "WS25", "SS26", "WS26", "SS27", "WS27", "SS28"];
}

function get_lva() {
    return { type, type_string, type_other, note_name, note_link, note_filename, sem, sem_type, sem_to_program }
}

module.exports = get_lva
