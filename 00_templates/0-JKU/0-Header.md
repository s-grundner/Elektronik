<%* const sem = "SS25" _%>
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
<%* if(typ == "VL" || typ == "KV") tR += "release: false\n" _%>  
<%* if(typ == "VL" || typ == "KV") tR += "title: " + tp.file.title + "\n"_%>
<%* if(typ == "UE") tR += "due:\n" _%>
---

