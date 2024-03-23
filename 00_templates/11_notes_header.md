---
tags: NOTES
subject:
  - <% tp.user.get_lva().ss24(tp) %>
semester:
  - SS24
  - B2
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
---

# <% tp.frontmatter.subject[0] %>

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
