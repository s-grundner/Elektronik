<%*
let week = tp.date.now("GGGG-[W]WW");
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

