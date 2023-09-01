# HTL

```dataview
TABLE subject, teacher
WHERE file.name = "{MOT}"
```


```dataview
LIST
WHERE typeof(subject) = "array" AND contains(subject, "fsst")
```