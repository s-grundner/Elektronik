<%* let lva = await tp.user.get_lva().ss24(tp) _%>

---
tags: NOTES
subject:
  - <%* tR += lva %>
semester: SS24
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
done:
ects:
---

# <%* tR += lva %>

<%* tp.file.rename("{NOTES} ".concat(lva)) _%> 

## Vorlesung

```dataview
TABLE keywords AS "Keywords🗝️", file.mday AS "Zuletzt Geändert✏️"
WHERE contains(subject, "<%* tR += lva _%>")
AND (contains(subject, "VL") OR contains(subject, "KV"))
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT file.mday DESC
```

## Übung

```dataview
TABLE keywords AS "Keywords🗝️", due AS "Abgabe 📅"
WHERE contains(subject, "<%* tR += lva _%>")
AND contains(subject, "UE") 
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT number(file.name) ASC
```