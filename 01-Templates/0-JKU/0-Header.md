---
<%*
const sem = tp.user.get_lva().curr_sem_key();
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
<%*
if(typ == "VL" || typ == "KV") {
	tR += "release: false\n";
	tR += `title: ${tp.file.title}\n`;
} else if (typ == "UE") {
	tR += "due:\n";
}
-%>
---

