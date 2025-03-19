<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
nr = nr.toString().padStart(2, '0')
tp.file.rename("UE" + nr)

let mainpage = tp.user.get_lva().note_filename(tp.frontmatter["subject"], "UE")
let next = (parseInt(nr) - 1).toString().padStart(2, '0')
let prev = (parseInt(nr) + 1).toString().padStart(2, '0')
_%>

# UE<%* tR += nr%>

⬅️ <a href="./UE<%* tR += next %>.md" class="internal-link">letzte Übung</a> | [📓](<%*tR += mainpage%>) | <a href="./UE<%* tR += prev %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 (files:: [Angabe](./Angaben/UE<%* tR += nr%>.pdf))
✅ (files:: [Lösung](./Abgaben/UE<%* tR += nr%>-k12136610.pdf))

---

## Aufgaben

> [!info] Aufgaben<%tp.file.cursor()%>
