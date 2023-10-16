<%*  
for (let index = 1; index < tp.frontmatter.exercise_count+1; index++) {  
  await tp.file.create_new("# Aufgabe" + index,"UE" + tp.frontmatter.assignment_num + "/Aufgabe" + index);  
}  
%>