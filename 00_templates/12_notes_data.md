# <%tp.frontmatter.subject[0]%>

<%tp.file.cursor(11)%>
<%tp.file.rename("{NOTES} " + tp.frontmatter.subject[0])%> 


```dataview
TABLE keywords, file.cday AS "creation date"
WHERE contains(subject, "<%tp.frontmatter.subject%>") AND !contains(file.name, "jku_header") AND !contains(file.name, "{NOTES}")
SORT file.cday ASC
```