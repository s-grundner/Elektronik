<%* let lva = await tp.user.get_lva().ws23(tp) _%>

---
tags: NOTES
subject:
  - <%* tR += lva %>
semester:
  - SS24
  - B2
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
---

# <%* tR += lva %>

<%* tp.file.rename("{NOTES} ".concat(lva)) _%> 

## Vorlesung

```dataview
TABLE keywords, file.cday AS "creation date"
WHERE contains(subject, "<%* tR += lva _%>")
AND (contains(subject, "VL") OR contains(subject, "KV"))
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT file.cday ASC
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

## Sonstiges

```dataview
TABLE keywords, subject, file.cday AS "creation date"
WHERE contains(subject, "<%* tR += lva _%>")
AND !(contains(subject, "UE") OR contains(subject, "VL"))
AND !contains(file.name, "jku_header")
AND !contains(file.name, "{NOTES}")
AND !contains(file.folder, "Rubbish")
SORT file.cday ASC
```