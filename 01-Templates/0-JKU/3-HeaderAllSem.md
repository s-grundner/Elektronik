---
<%*
let sem = await tp.user.get_lva().sug_sem(tp);
let lva = await tp.user.get_lva().sug_lva(tp, sem);
let typ = await tp.user.get_lva().sug_type(tp);
-%>
tags: 
aliases: 
subject:
  - <% typ %>
  - <% lva %>
semester: <% sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
<%* if(typ == "VL" || typ == "KV") tR += "release: false\n" _%>  
<%* if(typ == "VL" || typ == "KV") tR += "title: " + tp.file.title + "\n"_%>
---
