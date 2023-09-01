# HTL

```dataview
TABLE subject, teacher
WHERE file.name / "{MOT}" != 0
```


```dataview
LIST
WHERE typeof(subject) = "array" AND contains(subject, "fsst")
```