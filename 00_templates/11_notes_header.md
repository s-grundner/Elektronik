<%* const semtype = ["WS23", "SS24", "WS24", "SS25", "WS25", "SS26"] _%>
<%* let sem = await tp.system.suggester(semtype, semtype, true, "Semester")_%>
<%* let lva = await tp.user.get_lva().sem(tp, sem) _%>
<%* let typ = await tp.user.get_lva().type(tp) _%>
<%* let ects = await tp.system.prompt("ECTS", "") _%>

---
banner: /assets/banner/JKU-Banner.jpg
banner_y: 0.5
banner_x: 0.5
tags:
  - BACHELOR
subject:
  - <%* tR += lva %>
  - <%* tR += typ %>
semester: <%* tR += sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
done:
ects: <%* tR += ects %>
grade:
---

# <center> <%* tR += lva %> </center>

> [!info] **Klausuren** ✒️
> - (exam:: )

<%* tp.file.rename(tp.user.get_lva().note_name(lva, typ)) _%> 

<%* if(typ == "VL" || typ == "UE") { 
    let other = typ == "VL" ? "UE" : "VL";
    let lnk = tp.user.get_lva().note_link(lva, other);
    tR += `Zur ${lnk}📓 ➡️`;
}%>

## <%* tR += tp.user.get_lva().type_string(typ) %>

```dataviewjs
await dv.view("10_tools/dataviewjs/lva_query", {subjectFilter: "<%* tR += lva %>", subjectType: "<%* tR += typ %>"});
```