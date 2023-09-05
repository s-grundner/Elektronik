---
tags: []
aliases: []
subject: ["<% tp.system.suggester(
	["Softwareentwicklung1", "Mathematik1"]%>"]         
source: ["<% tp.system.prompt("Lehrperson(en)", "") %>"]
inst: [<%tp.system.suggester(["HTBLuVA Salzburg", "Institut für Systemsoftware", "Institut für Industriemathematik"], "HTL", "Systemsoftware")%>]
semester: <% tp.system.prompt("Semester", "") %>
created: <% tp.file.creation_date("Do MMMM YYYY") %>
---

# <%tp.file.title%>

<%tp.file.cursor(11)%>