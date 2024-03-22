<%* const subs = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen", "Hardwareentwurf mit VHDL", "Networked Embedded Systems"]
let lva = await tp.system.suggester(subs, subs, true, "LVA") -%>
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
