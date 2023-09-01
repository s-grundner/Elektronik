# <%tp.file.folder(true).charAt(0).toUpperCase() + tp.file.folder(true).slice(1)%>

```dataview
TABLE tags
FROM "<%tp.file.folder(true)%>" AND #MOC
```
<%tp.file.rename("README")%>  
<%tp.file.cursor(8)%>