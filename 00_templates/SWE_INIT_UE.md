<%*  
for (let index = 0; index < tp.frontmatter.exercise_count; index++) {  
  await tp.file.create_new("","UE" + tp.frontmatter.assignment_num + "/Aufgabe" + index,);  
}
tp.file.rename("UE" + tp.frontmatter.assignment_num);
%>