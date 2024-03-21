---
tags: 
aliases: 
keywords: 
subject:
  - <%* const type = ["VL", "UE", "KV", "PR"]
    let paste_type = await tp.system.suggester(type, type, true, "LVA Type")
    tR += paste_type %>
  - <%* const subs = ["Mathematik 2", "Elektrotechnik", "Softwareentwicklung 2", "Algorithmen und Datenstrukturen", "Hardwareentwurf mit VHDL", "Networked Embedded Systems"]
    let paste_lva = await tp.system.suggester(subs, subs, true, "LVA Name") 
    tR += paste_lva %>
semester:
  - SS24
  - B2
created: <% tp.file.creation_date("Do MMMM YYYY")%>
professor:
---
 

# <%tp.file.title%>

<%tp.file.cursor(11)%>