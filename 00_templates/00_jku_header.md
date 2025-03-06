<%* const sem = "SS25" _%>
<%* let lva = await tp.user.get_lva().sem(tp, sem) _%>
<%* let typ = await tp.user.get_lva().type(tp) _%>
 
---
<%* if(typ == "UE") tR += "banner:" _%>
tags: 
aliases: 
keywords: 
subject:
  - <%* tR += lva %>
  - <%* tR += lvt %>
semester: <%* tR += sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
draft: false
title: <%tp.file.title%>
<%* if(typ == "UE") tR += "due: " _%>
---
 
