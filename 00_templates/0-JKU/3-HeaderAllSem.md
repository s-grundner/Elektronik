<%* allSem = ["WS23", "SS24", "WS24", "SS25"]_%>
<%* const sem = await tp.system.suggester(allSem, allSem, true) _%>
<%* let lva = await tp.user.get_lva().sem(tp, sem) _%>
<%* let typ = await tp.user.get_lva().type(tp) _%>
 
---
<%* if(typ == "UE") tR += "banner: \n" _%>
tags: 
aliases: 
keywords: 
subject:
  - <%* tR += typ %>
  - <%* tR += lva %>
semester: <%* tR += sem %>
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
<%* if(typ == "VL") tR += "release: false\n" _%>  
<%* if(typ == "VL") tR += "title: " + tp.file.title + "\n"_%>
<%* if(typ == "UE") tR += "due:\n" _%>
title: <% tp.file.title %>
---
