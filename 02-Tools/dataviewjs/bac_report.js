
const pages = dv
    .pages("#BacLog")
    .filter(p => !p.file.folder.includes("Rubbish"));

const hours = {
    MAX: 240,
    total: pages.map(p => p.thesis_hours).sum(),
    weekly: pages.filter(p => p.week === dv.current().week)
        .filter(p => p.thesis_hours)
        .map(p => p.thesis_hours)
        .sum()
}

function htmlProg(quota, base) {
    let value = quota / base * 100;
    return `<progress max=100 value="${value.toFixed(0)}"></progress>`;
}

async function nameTable() {
    dv.table(
        ["Name", "Thesis"],
        [[
            "Simon Grundner, k12136610",
            "Complex-Valued Bias Compensated-LMS"
        ]]
    );
}

async function timeTable() {
    dv.table(
        ["Hours this week", "Total Hours"],
        [[
            `${hours.weekly}h`,
            `${htmlProg(hours.total, hours.MAX)} ${hours.total}h / ${hours.MAX}h`
        ]]
    );
}

nameTable();
timeTable();

