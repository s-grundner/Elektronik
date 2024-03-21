---
tags: NOTES
subject:
  - <% await tp.system.suggester(["Mathe 2", "ET", "SWE 2", "DS-Algo", "VHDL", "NES"], ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen", "Hardwareentwurf mit VHDL", "Networked Embedded Systems"])%>
semester:
  - SS24
  - B2
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
---

<%tp.config.%>

# <%tp.frontmatter.subject[0]%>

<%tp.file.cursor(11)%>
<%tp.file.rename("{NOTES} " + tp.frontmatter.subject[0])%> 


```dataview
TABLE keywords, file.cday AS "creation date"
WHERE contains(subject, "<%tp.frontmatter.subject%>") AND !contains(file.name, "jku_header") AND !contains(file.name, "{NOTES}")
SORT file.cday ASC
```