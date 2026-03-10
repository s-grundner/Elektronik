<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
tp.file.rename("UE" + nr)
%>

# UE<%* tR += nr%>

⬅️ <a href="./UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | [📓]({NOTES}%20Einführung%20Elektronik%20UE.md) | <a href="./UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 [Angabe](../../xEDU/B5_WS25/GHFT/UE/UE_Skriptum.pdf)
✅ (files::[Lösung](Abgaben/UE<%* tR += nr%>-k12136610.pdf))

---

## Aufgaben

> [!info] <%tp.file.cursor()%>
