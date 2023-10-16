---
assignment_num: <%await tp.system.prompt("Übungs Nummer", "00", false)%>
exercise_count: <% await tp.system.prompt("Anzahl an Aufgaben", false)%>
matr_nr: k12136610  
vorname: simon  
nachname: grundner
---

<%await tp.file.include(tp.file.find_tfile("./SWE_INIT_UE"))%>