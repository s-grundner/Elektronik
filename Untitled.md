---
assignment_num: <%parseInt(tp.system.prompt("Übungs Nr", "00", false))%>
exercise_count: <%parseInt(tp.system.prompt("Anzahl an Aufgaben", false))%>
matr_nr: k12136610
vorname: simon
nachname: grundner
---

<%tp.file.rename(tp.frontmatter.matr_nr + "_UE" + tp.frontmatter.assignment_num)%>

<%tp.file%>