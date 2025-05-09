---
tags: DailyNotes
created: 2023-10-16 08:37
banner: "/assets/banner/Forest_Steph_Johnstone.jpg"
---

<center> <h1> <% moment(tp.file.title,'YYYY-MM-DD').format("dddd, MMMM DD, YYYY") %> </h1> </center>
<center> ⬅️ <a href="<% fileDate = moment(tp.file.title, 'YYYY-MM-DD-dddd').subtract(1, 'd').format('YYYY-MM-DD-dddd') %>.md" class="internal-link">Gestern</a> | <a href="<% fileDate = moment(tp.file.title, 'YYYY-MM-DD-dddd').add(1, 'd').format('YYYY-MM-DD-dddd') %>.md" class="internal-link">Morgen</a> ➡️ </center>

---

# 📝 Notes

## 🎒Uni

---

# 📅 Kalender

## Todo

```tasks
not done
(path includes DailyNotes) AND NOT (path includes Rubbish)
short mode
limit 100
```

---

> [!SUMMARY] 😎 Erstellte Notizen
>
> ```dataview
> List FROM "" WHERE file.cday = date("<%moment(tp.file.title,'YYYY-MM-DD').format("YYYY-MM-DD")%>") AND !contains(file.name, ".excalidraw") SORT file.ctime asc
> ```

> [!SUMMARY] ✒️ Bearbeitete Notizen
>
> ```dataview
> List FROM "" WHERE file.mday = date("<%moment(tp.file.title,'YYYY-MM-DD').format("YYYY-MM-DD")%>") AND !contains(file.name, ".excalidraw") SORT file.mtime asc
> ```