<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
tp.file.rename("UE" + nr
%>

# UE<%* tR += nr%>

⬅️ <a href="UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

🔎 [Aufgaben Sammlung](Aufgabensammlung.pdf)
📝 [Angabe](./Angaben/Uebungsblatt<%* tR += nr%>.pdf)
✅ [Lösung](./Loesungen/UE<%* tR += nr%>-k12136610.pdf)

---

<%tp.file.cursor(20)%>