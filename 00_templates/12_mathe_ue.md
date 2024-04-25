<%* let nr = await tp.system.prompt("Übungsnummer","",true)_%>

# UE<%* tR += nr%>

⬅️ <a href="UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

🔎 [Aufgaben Sammlung](Aufgabensammlung_6.0.pdf)
📝 [Angabe](./Angaben/Uebungsblatt<%* tR += nr%>.pdf)
✅ [Lösung](./Loesungen/UE<%* tR += nr%>-k12136610.pdf)

---


<%*
async function ws23(tp) {
  const lva = ["Mathematik 1", "Einf. ET", "Softwareentwicklung 1", "Physik für TechnikerInnen"];

  let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");

  return paste_lva;
}

  

async function ss24(tp) {
  const lva = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen"];
  let paste_lva = await tp.system.suggester(lva, lva, true, "LVA Name");
  switch (paste_lva) {
    case lva[0]:
      break;
    default:
      break;
  }

  return paste_lva;
}

  

function get_ue(tp, yyyy) {
  tR += "ASDHJKSHFSDHFSDHJF";
  switch (yyyy) {
    case 2023:
      return ws23(tp)
    case 2024:
      return ss24(tp);
    default:
      break;
  }
}

  

module.exports = get_ue
_%>