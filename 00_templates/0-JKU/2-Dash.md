<%* const semtype = tp.user.get_lva().sem_type() _%>
<%* let sem = await tp.system.suggester(semtype, semtype, true, "Semester")_%>
<%* let lva = await tp.user.get_lva().sem(tp, sem) _%>
<%* let typ = await tp.user.get_lva().type(tp) _%>
<%* let ects = await tp.system.prompt("ECTS", "") _%>

---
banner: /assets/banner/JKU-Banner.jpg
banner_y: 0.5
banner_x: 0.5
tags:
  - <%* tR += tp.user.get_lva().sem_to_program(sem) %>
subject:
  - <%* tR += lva %>
  - <%* tR += typ %>
semester: <%* tR += sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
list: true
done:
ects: <%* tR += ects %>
grade:
---

# <%* tR += lva %>

> [!info] **Klausuren** ✒️
> 

<%* tp.file.rename(tp.user.get_lva().note_name(lva, typ)) _%> 

<%* if(typ == "VL" || typ == "UE") { 
    let other = typ == "VL" ? "UE" : "VL";
    let lnk = tp.user.get_lva().note_link(lva, other);
    tR += `Zur ${lnk}📓 ➡️`;
}%>

## <%* tR += tp.user.get_lva().type_string(typ) %>

```dataviewjs
if(dv.current().list) {
    await dv.view("10_tools/dataviewjs/lva_query", {subjectFilter: "<%* tR += lva %>", subjectType: "<%* tR += typ %>"});
} else {
	dv.paragraph("> [!hint] Enable list in frontmatter to view LVA related notes")
}
```