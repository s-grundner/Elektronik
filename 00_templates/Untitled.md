---
assignment_num: <%await tp.system.prompt("Übungs Nummer", "00", false)%>
exercise_count: <%await tp.system.prompt("Anzahl an Aufgaben", false)%>
matr_nr: k12136610
vorname: simon
nachname: grundner
---

<%await tp.file.rename(tp.frontmatter.matr_nr + "_UE" + tp.frontmatter.assignment_num)%>  

<%*  
for (let index = 0; index < tp.frontmatter.exercise_count; index++) {  
  tp.file.create_new("UE" + tp.frontmatter.assignment_num + "/Aufgabe" + index,);  
}  
%>