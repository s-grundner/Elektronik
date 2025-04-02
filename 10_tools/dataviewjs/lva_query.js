await generateTable(input.subjectFilter, input.subjectType);

async function generateTable(subjectFilter, subjectType) {

  let pgs = dv.pages()
    .filter(p => p.subject && p.subject.includes(subjectFilter))
    .filter(p => p.subject && p.subject.includes(subjectType))
    .filter(p => !p.file.name.includes("jku_header"))
    .filter(p => !p.file.name.includes("{NOTES}"))
    .filter(p => !p.file.folder.includes("Rubbish"));

  switch (subjectType) {
    case "UE":
      return await generateUETable(pgs);
    default:
      return await generateDefaultTable(pgs);
  }
}

async function generateUETable(pgs) {
  dv.table(["File", "Keywords🗝️", "Files", "Abgabe 📅"], pgs
    .sort(p => {
      let match = p.file.name.match(/\d+/);
      return match ? parseInt(match) : p.file.name;
    }, 'asc')
    .map(p => [
      p.file.link,
      p.keywords,
      Array.isArray(p.files) ? p.files.join("<br>") : p.files,
      p.due
    ])
  );
}

async function generateDefaultTable(pgs) {
  dv.table(["File", "Keywords🗝️", "Zuletzt Geändert✏️"], pgs
    .sort(p => p.file.mday, 'desc')
    .map(p => [
      p.file.link,
      p.keywords,
      p.file.mday
    ])
  );
}
