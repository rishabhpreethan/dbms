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


### Cartesian Product :
```
select name, budget from student, department where student.dept_name = department.dept_name and budget 100000;
```

* O/P :

| name | budget |
| --- | --- |
| Brandt | 50000.00 |
| Peltier | 70000.00 |
| Levy | 70000.00 |
| Sanchez | 80000.00 |
| Snow | 70000.00 |
| Aoi | 85000.00 |
| Bourikas | 85000.00 |
| Tanaka | 200.00 |


### Rename as operation :
```
select S.name as studentname, budget as deptbudget from student budget as S, department as D D where S.dept_name = D.dept_name and budget < 100000;
```

* O/P :

| studentname | deptbudget |
| --- | --- |
| Brandt | 50000.00 |
| Peltier | 70000.00 |
| Levy | 70000.00 |
| Sanchez | 80000.00 |
| Snow | 70000.00 |
| Aoi | 85000.00 |
| Bourikas | 85000.00 |
| Tanaka | 90000.00 |

### AND and OR :
```
select name from instructor 1, department D where D.dept_name = 1.dept_name and (I.dept_name = 'Finance' or building in ('Watson', 'Taylor'));
```

* Instructor :

| ID | name | dept_name | salary |
| --- | --- | --- | --- |
| 10101 | Srinivasan | Comp. Sci. | 65000
| 12121 | Wu | Finance | 90000 |
| 15151 | Mozart | Music | 40000 |
| 22222 | Einstein | Physics | 95000 |
| 32343 | El Said | History | 60000 |
| 33456 | Gold | Physics | 87000 |
| 45565 | Katz | Comp. Sci. | 75000 |
| 58583 | Califieri | History | 62000 |
| 76543 | Singh | Finance | 80000 |
| 76766 | Crick | Biology | 72000 |
| 83821 | Brandt | Comp. Sci. | 92000 |
| 98345 | Kim | Elec. Eng. | 80000 |

* Department :

| dept.name | building | budget |
| --- | --- | --- |
| Biology | Watson | 90000 |
| Comp. Sci. | Taylor | 100000 |
| Elec. Eng. | Taylor | 85000 |
| Finance. | Painter | 120000 |
| History | Painter | 50000 |
| Music | Packard | 80000 |
| Physics | Watson | 70000 |

* O/P :

| name |
| --- |
| Srinivasan |
| Wu |
| Singh |
| Crick |
| Brandt |
| Kim |