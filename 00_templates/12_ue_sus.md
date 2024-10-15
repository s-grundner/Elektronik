<%*
const themes = ["Verschiebung und Skalierung", "Linearität und Zeitinvarianz", "Faltung", "Fourierreihen", "Fouriertransformation", "Laplacetransformation", "Lineare Zustandsraumdarstellung", "Bode-Diagramm", "z-Transformation", "Test Beispiele"];
let theme = await tp.system.suggester(themes, themes, true, "Thema");
tp.file.rename(theme)
%>

# <%* tR += theme%>

⬅️ <a href=".md" class="internal-link">letzte Übung</a> | <a href=".md" class="internal-link">nächste Übung</a> ➡️ 


---

📝 [Übungsskriptum](../UESuS1_Skriptum.pdf)

---

<%tp.file.cursor(20)%>