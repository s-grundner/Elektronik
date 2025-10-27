<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
nr = nr.toString().padStart(2, '0')
tp.file.rename("UE" + nr)

let type = tp.frontmatter.subject[0] 
let lva = tp.frontmatter.subject[1] 
let mainpage = tp.user.get_lva().note_url(lva, type)
let next = (parseInt(nr) - 1).toString().padStart(2, '0')
let prev = (parseInt(nr) + 1).toString().padStart(2, '0')
_%>

# UE<%* tR += nr%>

<%* tR += `⬅️ [letzte Übung](./UE${next}.md) | [📓](${mainpage}) | [nächste Übung](./UE${prev}.md) ➡️` %>

---

📝 (files:: [Angabe](Angaben/UE<%* tR += nr %>.pdf))
✅ (files:: [Lösung](Abgaben/UE<%* tR += nr %>-k12136610.pdf))

---

## Aufgaben

> [!info] `$=dv.current().keywords`
