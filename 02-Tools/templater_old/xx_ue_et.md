<%*
let nr = await tp.system.prompt("Übungsnummer","",true) 
let topic = await tp.system.prompt("Thema","[Ordnername]",true)
let folder = "UE"+ nr + "_" + topic
tp.file.rename("UE" + nr)
_%>

# UE<%* tR += nr %> - <%* tR += topic %>

⬅️ <a href="./UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="./UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 [Aufgabensammlung](2024S-Elektrotechnik-UE.pdf)
✅ [Lösung](Abgabe/<%* tR += folder %>.pdf)

---
