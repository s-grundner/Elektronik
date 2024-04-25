<%*
let nr = await tp.system.prompt("Übungsnummer","",true) 
let topic = await tp.system.prompt("Thema","[Ordnername]",true)
let folder = "UE"+ nr + "_" + topic
%>

# UE<%* tR += nr%>

⬅️ <a href="UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 [Angabe](<%* tR += folder%>/Angabe/Übung<%* tR += nr%>.pdf)
✅ [Lösung](<%* tR += folder%>/Abgabe/UE<%* tR += nr%>_k12136610.pdf)

---

<%tp.file.cursor(20)%>