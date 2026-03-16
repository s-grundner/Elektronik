<%*
let sem = await tp.user.get_lva().sug_sem(tp);
let lva = await tp.user.get_lva().sug_lva(tp, sem);
let typ = await tp.user.get_lva().sug_type(tp);
let ects = await tp.system.prompt("ECTS", "");
let category = await tp.user.get_lva().sug_category(tp);
-%>
---
tags:
  - <% tp.user.get_lva().sem_to_program(sem) %>
subject:
  - <% typ %>
  - <% lva %>
semester: <% sem %>
created: <% tp.file.creation_date("DD MMMM YYYY")%>
professor:
list: true
done:
ects: <% ects %>
grade:
type: <% category %>
---

# <% lva %>

<%* tp.file.rename(tp.user.get_lva().note_name(lva, typ)) _%> 

<%* if(typ == "VL" || typ == "UE") { 
    let other = typ == "VL" ? "UE" : "VL";
    let lnk = tp.user.get_lva().note_link(lva, other);
    tR += `Zur ${lnk}📓 ➡️`;
}%>

## <% tp.user.get_lva().type_string(typ) %>

```dataviewjs
if(dv.current().list) {
    await dv.view("01-Tools/dataviewjs/lva_query", {
	    subjectFilter: dv.current().subject[1],
	    subjectType: dv.current().subject[0]
	});
} else {
	dv.paragraph("> [!hint] Enable `list` in frontmatter to view LVA related notes")
}
```