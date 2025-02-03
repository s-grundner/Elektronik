<%* const sem = "WS24" _%>

---
tags: 
aliases: 
keywords: 
subject:
  - <%* tR += await tp.user.get_lva().sem(tp, sem) %>
  - <%* tR += await tp.user.get_lva().type(tp) %>
semester: <%* tR += sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
---
 
