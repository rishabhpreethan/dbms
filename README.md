# NOTES
<br>


* Table : classroom

| building | roomnumber | capacity |
| -------- | ---------- | -------- |
| Packard  | 101        | 500      |
| Painter  | 514        | 10       |
| Taylor   | 3128       | 70       |
| Watson   | 100        | 30       |
| Watson   | 120        | 50       |

<br>

### Select distinct:
* If there are elements that are repeated then it is selected only once
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


### Cartesian Product:
```
select name, budget from student, department where student.dept_name = department.dept_name and budget 100000;
```

* O/P :

| name | budget |
| Brandt | 50000.00 |
| Peltier | 70000.00 |
| Levy | 70000.00 |
| Sanchez | 80000.00 |
| Snow | 70000.00 |
| Aoi | 85000.00 |
| Bourikas | 85000.00 |
| Tanaka | 200.00 |


### Rename as operation:
```
select S.name as studentname, budget as deptbudget from student budget as S, department as D D where S.dept_name = D.dept_name and budget < 100000;
```

* O/P :

| studentname | deptbudget |
| Brandt | 50000.00 |
| Peltier | 70000.00 |
| Levy | 70000.00 |
| Sanchez | 80000.00 |
| Snow | 70000.00 |
| Aoi | 85000.00 |
| Bourikas | 85000.00 |
| Tanaka | 90000.00 |

### 