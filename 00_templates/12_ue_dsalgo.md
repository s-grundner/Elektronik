<%* let nr = await tp.system.prompt("Übungsnummer","",true) %>
<%* let topic = await tp.system.prompt("Thema","[Ordnername]",true)%>

# UE<%* tR += nr%>

⬅️ <a href="UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 [Angabe]("UE<%* tR += nr%>_<%* tR += Thema%>/Angabe/")
✅ [Lösung]("")

---

<%tp.file.cursor(20)%>