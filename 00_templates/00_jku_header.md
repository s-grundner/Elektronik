<%* const sem = "SS25" _%>

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
draft: false
title: <%tp.file.title%>
---
 
