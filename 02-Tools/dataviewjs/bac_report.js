const pages = dv
    .pages("#BacLog")
    .filter(p => !p.file.folder.includes("Rubbish"));

function htmlProg(quota, base) {
    let value = quota / base * 100;
    return `<progress max=100 value="${value.toFixed(0)}"></progress>`;
}

async function nameTable() {
    const hours = {
        MAX: 240,
        total: pages.map(p => p.thesis_hours).sum()
    }
    dv.table(
        ["Name", "Thesis", "Total Hours"],
        [[
            "Simon Grundner\nk12136610",
            "Complex-Valued Bias Compensated-LMS",
            `${htmlProg(hours.total, hours.MAX)}\n${hours.total}h / ${hours.MAX}h`
        ]]
    );
}

async function timeTable() {
    
    const weeklyHours = pages.filter(p => p.week === input.week)
        .filter(p => p.thesis_hours)
        .map(p => p.thesis_hours)
        .sum();

    dv.table(
        ["Hours this week"],
        [[
            `${weeklyHours}h`
        ]]
    );
}

if (input) {
    timeTable();
} else {
    nameTable();
}
