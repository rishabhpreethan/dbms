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

<br>


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

<br>


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

<br>


### AND and OR :

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

```
select name from instructor 1, department D where D.dept_name = 1.dept_name and (I.dept_name = 'Finance' or building in ('Watson', 'Taylor'));
```

* O/P :

| name |
| --- |
| Srinivasan |
| Wu |
| Singh |
| Crick |
| Brandt |
| Kim |

<br>


### String operations :
* department :

| course id | title | deptname | credits |
| --- | --- | --- | --- |
| BIO-101 | Intro. to Biology | Biology | 4 |
| BIO-301 | Genetics | Biology | 4 |
| BIO-399 | Computational Biology | Biology | 3 |
| CS-101 | Intro. to Computer Science | Comp. Sci. | 4 |
| CS-190 | Game Design | Comp. Sci. | 4 |
| CS-315 | Robotics | Comp. Sci. | 3 |
| CS-319 | Image Processing | Comp. Sci. | 3 |
| CS-347 | Database System Concepts | Comp. Sci. | 3 |
| EE-181 | Intro. to Digital Systems | Elec. Eng. | 3 |
| FIN-201 | Investment Banking | Finance | 3 |
| HIS-351 | World History | History | 3 |
| MU-199 | Music Video Production | Music | 3 |
| PHY-101 | Physical Principles | Physics | 4 |

```
select title from course where course_id like '___-%';
```

* O/P :

| title |
| --- | 
| Intro. to Biology |
| Genetics |
| Computational Biology |
| Investment Banking |
| World History |
| Physical Principles |

<br>



### First normal form
* the domains of all attributes of R are atomic
> a domain is atomic if its elements are considered to be indivisible units
* examples of non atomic domains
    * set of names, composite attributes
    * identification numbers like CS101 can be broken into parts
* non atomic values complicate storage and encourage redundant storage of data
    * eg: set of accounts stored with each customer and set of owners stored with each account
    * <b>we assume all relations are in 1NF</b>
* best way to deal with it is decompostion
<br>


### Functional dependencies

| A | B |
| --- | --- |
| 1 | 4 |
| 1 | 5 |
| 3 | 7 |

* here A -> B does not hold, but B -> A holds
* but tuples like (2,4) or (3,5) or (4,7) cannot be added

##### Functional dependencies allow us to express constraints that cannot be expressed using superkeys:
>inst_dept(<u>ID</u>, name, salary, <u>dept_name</u>, building, budget)

* we expect these functional depencdencies to hold:
```dept_name -> building```
```dept_name -> budget```
```ID -> building```

* but would not expect the following to hold:
```dept_name -> salary```
* <b>Note: </b> a specific instance of a relation schema may satisfy a functional depedency even if the functional depedency does not hold on all legal instances
* eg:- a specific instance of instructor may by chance satisfy:
```name -> ID```

##### Trivial dependency:
* ```ID, name -> ID```
* ```name -> name```
> in general ```a -> b``` is trivial if b is a subset of a
<br>

##### Armstrong's Axioms
* Reflexivity: if b is a subset of a then ```a -> b```
* Augmentation: if ```a -> b``` then ```ca -> cb```
* Transitivity: if ```a -> b``` and ```b -> c``` then ```a -> c```
* additional derived rules:
    * union: if ```a -> b``` holds and ```a -> c``` holds then ```a -> bc``` holds
    * decomposition: if ```a -> bc``` holds then ```a ->b``` holds then ```a -> c``` holds
    * pseudotransitivity: if ```a -> b``` holds and ```cb -> d``` holds then ```ac -> d``` holds
<br>


### Algorithm to determine closure
```
while (changes to result)do
    for each ```b -> c``` in F do
        begin
            if ((b is a subset of result) then (result <- result U c))
        end 
```
<br>


### Extraneous attributes
* ```F = { A -> C, AB -> C}```
    * B is extraneous in ```AB -> C```
    * A+ = AC
    * the relation remains the same even after removing B
* ```F = {A -> C, AB -> CD}```
    * C is extraneous as A -> C
    * AB+ = ABCD
    * the relation remains the same even after removing C
<br>


### Equivalence of sets of functional dependencies
* F and G are two functional dependency sets
* F and G are equivalent if (F+ = G+) <=> (F+ -> G and G+ -> F)
<br>


### Lossless join decomposition
* conditions
    * R1 U R2 = R
    * R1 intersection R2 != null
    * R1 intersection R2 -> R2 or R1 intersection R2 -> R2

### MVC Architecture
<img src="/images/mvc.png?raw=true" width="800" height="400">
<br>


### Python modules for PostgreSQL
* psycopg2
* pg8000
* py-postgresql
* PyGreSQL
* ocpgdb
* bpgsql
* SQLAlchemy (needs any of the above to be installed separately)
<br>


### Steps to access PosgreSQL from python using psycopg
* create connection
* create cursor
* execute the query
* commit/rollback
* close the cursor
* close the connection
<img src="/images/psycopg.png?raw=true" width="800" height="400">
