---
tags: ["Machine Learning"]
aliases: ["Classification"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 28th November 2022
---

# [[Machine Learning|ML]] Klassifizierung


```functionplot
---
title: 
xLabel: 
yLabel: 
bounds: [0,10,0,10]
disableZoom: true
grid: true
---
y=-x+5
(5;5)
```

```dataviewjs
//Some plotly examples require d3 library to work.
//Since it's large and used by few examples,
//I propose a workaround to import d3;
//You need to download dependency from https://d3js.org/d3.v7.min.js
//and place it in your vault.
let path = app.vault.adapter.basePath;//absolute path to your vault
var d3 = require(path+"\\utils\\d3.v7.min.js");

//Replace this block with any example from plotly.com
//NOTE: `Plotly.newPlot` won't work here, use `window.renderPlotly` instead
var data = [
{x:[1,1,2],y:[4,4,2,2,3,3,2,2,4,4]},
];
var layout = {};
var config = {};

window.renderPlotly(this.container, data, layout, config)
```

```plotly { "data": [{ "x":[0, 1, 2], "y":[0, 1, 0] }] } ```



# Tags
[[Machine Learning]]