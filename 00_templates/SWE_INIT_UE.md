# Übung <%tp.frontmatter.assignment_num%>

Name: <%tp.frontmatter.firstname%> <%tp.frontmatter.surname%>

Matr. Nr.: <%tp.frontmatter.matr_nr%>

<%*  
for (let index = 1; index < parseInt(tp.frontmatter.exercise_count)+1; index++) {  
  await tp.file.create_new("# Aufgabe" + index,"UE" + tp.frontmatter.assignment_num + "/Aufgabe" + index);  
}  
%>

---

