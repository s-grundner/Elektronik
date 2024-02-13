---
banner: "https://minio.codingblocks.com/amoeba/f3d9219c-0692-46ab-bbd4-a16b997c7ecc.png"
tags:
  - Cpp
  - MOC  
aliases:
  - c++
  - "#Cpp"  
created: 19th August 2023  
---

# Map of Content - Cpp

## Topic

```dataview

LIST FROM #cpp
WHERE !contains(file.name, "Cpp_Ue_") AND !contains(file.name, "Cpp_Ex_")
SORT name

```

## Exercise

```dataview

LIST FROM #cpp
WHERE contains(file.name, "Cpp_Ue_") OR contains(file.name, "Cpp_Ex_")
SORT name

```