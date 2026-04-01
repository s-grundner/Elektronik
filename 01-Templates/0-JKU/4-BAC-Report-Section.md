<%*
let week = tp.date.now("GGGG-[W]WW");
tp.file.rename(week);
-%>

## <% week %>

```dataviewjs
await dv.view("02-Tools/dataviewjs/bac_report", { week: "<% week %>" });
```

> [!info] Progress
> 
> ### Research
> 
> ### Exercise
> 

