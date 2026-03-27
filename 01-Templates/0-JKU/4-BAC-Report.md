<%*
let week = tp.date.now("GGGG-[W]WW");
tp.file.rename(week);
-%>
---
tags:
 - BacReport
week: <% week %>
---


# Weekly Thesis Report - <% week %>

```dataviewjs
await dv.view("02-Tools/dataviewjs/bac_report");
```

## Progress


## Questions

--- 

> [!question] Thesis Status: https://www.overleaf.com/read/hxhpsyjjkmxx#822cdd 

--- 

## Contribution Graph

```heatmap-tracker
heatmapTitle: Contribution Graph
heatmapSubtitle: Bachelors Thesis
property: thesis_hours
year: 2026
separateMonths: false
showCurrentDayBorder: true
disableFileCreation: true
excludeFalsy: true
colorScheme:
  paletteName: default
path: xDailyNotes
ui:
  hideTabs: true
  hideYear: true
  hideSubtitle: true
  hideTitle: true
  showWeekNums: true
```

