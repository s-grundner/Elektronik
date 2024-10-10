<%* let lva = await tp.user.get_lva().ss25(tp) _%>

---
tags: NOTES
subject:
  - <%* tR += lva %>
semester: SS25
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
done:
ects:
---

# <%* tR += lva %>

<%* tp.file.rename("{NOTES} ".concat(lva)) _%> 

## Vorlesung

```dataview
TABLE keywords AS "Keywords🗝️", file.mday AS "Last Edited✏️"
WHERE contains(subject, "<%* tR += lva _%>")
AND (contains(subject, "VL") OR contains(subject, "KV"))
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT file.mday ASC
```

## Übung

```dataview
TABLE keywords, file.cday AS "creation date"
WHERE contains(subject, "<%* tR += lva _%>")
AND contains(subject, "UE") 
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT file.cday ASC
```