<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
tp.file.rename("UE" + nr)
%>

# UE<%* tR += nr%>

⬅️ <a href="./UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="./UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 (files::[Angabe](Angaben/Uebung<%* tR += nr%>.pdf))
✅ (files::[Lösung](Abgaben/UE<%* tR += nr%>-k12136610.pdf))

---

<%tp.file.cursor(20)%>