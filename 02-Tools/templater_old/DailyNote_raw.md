<%*
const today = tp.date.now("YYYY-MM-DD");
const week = tp.date.now("GGGG-[W]WW");
const yesterday = tp.date.now("YYYY-MM-DD", -1);  
const tomorrow = tp.date.now("YYYY-MM-DD", 1);  
const titleDate = tp.date.now("dddd, MMMM D, YYYY");  
-%>
---
banner: "00-Assets/banner/Forest_Steph_Johnstone.jpg"
tags:
 - DailyNotes
 - BacLog
created: <% today %>
week: <% week %>
exercise_hours: 
thesis_hours:
---

<center> <h1> <% titleDate %> </h1> </center>

⬅️ [Gestern](<% yesterday %>.md) | [Morgen](<% tomorrow %>.md) ➡️

<% tp.web.daily_quote() %>

---

## Tasks

### Todo

```tasks
not done
(path includes DailyNotes) AND NOT (path includes Rubbish)
short mode
limit 100
```

### Heute Erledigt

```tasks
done
(path includes DailyNotes) AND NOT (path includes Rubbish)
short mode
done <% today %>
```

## 📅 Kalender
