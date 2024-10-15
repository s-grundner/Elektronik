<%*
const themes = ["Verschiebung und Skalierung", "Linearität und Zeitinvarianz", "Faltung", "Fourierreihen", "Fouriertransfomration"]
let theme = await tp.system.suggester(themes, themes, true, "Thema")
tp.file.rename(theme)
%>

# <%* tR += theme%>

⬅️ <a href="./UE<%* tR += (parseInt(nr) - 1) %>.md" class="internal-link">letzte Übung</a> | <a href="./UE<%* tR += (parseInt(nr) + 1) %>.md" class="internal-link">nächste Übung</a> ➡️ 

---

📝 [Angabe](Angaben/Uebung<%* tR += nr%>.pdf)
✅ [Lösung](Abgaben/UE<%* tR += nr%>-k12136610.pdf)

---

<%tp.file.cursor(20)%>