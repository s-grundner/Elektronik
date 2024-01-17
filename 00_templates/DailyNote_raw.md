---
tags: DailyNotes
created: 2023-10-16 08:37
banner: "/assets/banner/Forest_Steph_Johnstone.jpg"
---

# <% moment( ) %>

  ⬅️ [[<% fileDate = moment(tp.file.title, 'YYYY-MM-DD-dddd').subtract(1, 'd').format('YYYY-MM-DD-dddd') %>|Gestern]] | [[<% fileDate = moment(tp.file.title, 'YYYY-MM-DD-dddd').add(1, 'd').format('YYYY-MM-DD-dddd') %>|Morgen]] ➡️

 ---

 # 📝 Notes

## 🎒Uni

---

# 📅 Kalender

---

> [!SUMMARY] 😎 Erstellte Notizen
>
> ```dataview
> List FROM "" WHERE file.cday = date("<%tp.date.now("YYYY-MM-DD")%>") AND contains(file.name, ".excalidraw") = false SORT file.ctime asc
> ```

> [!SUMMARY] ✒️ Bearbeitete Notizen
>
> ```dataview
> List FROM "" WHERE file.mday = date("<%tp.date.now("YYYY-MM-DD")%>") AND contains(file.name, ".excalidraw") = false SORT file.mtime asc
> ```