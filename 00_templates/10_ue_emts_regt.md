<%*
let nr = await tp.system.prompt("Übungsnummer","",true)
tp.file.rename("UE" + nr)
%>

# UE<%* tR += nr%>

⬅️ <a href="./UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | [📓]({NOTES}%20Elektrische%20Messtechnik%20und%20Sensorik%20UE.md) | <a href="./UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 (files:: [Angabe](./Angaben/UE<%* tR += nr%>.pdf))
✅ (files::[Lösung](./Abgaben/UE<%* tR += nr%>-k12136610.pdf))

---

## Aufgaben

> [!info] Aufgaben<%tp.file.cursor()%>