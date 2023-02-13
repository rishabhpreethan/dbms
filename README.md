# NOTES
<br>

### Select distinct:
* If there are elements that are repeated then it is selected only once
<br>

* Table

| building | roomnumber | capacity |
| -------- | ---------- | -------- |
| Packard  | 101        | 500      |
| Painter  | 514        | 10       |
| Taylor   | 3128       | 70       |
| Watson   | 100        | 30       |
| Watson   | 120        | 50       |

<br>

```
select distinct building from classroom where capacity < 100;
```
* O/P

| building |
| --- |
| Painter |
| Taylor |
| Watson |