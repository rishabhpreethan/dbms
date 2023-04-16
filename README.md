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
<br>


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
<br>


### Steps to execute SQL commands
* use the psycopg2.connect() method with the required arhuments to connect postgreSQl. it would return a connection object if the connection established successfully.
* create a cursor object using the cursor() method of connection object
* the execute() methods run the SQL commands and return the result
* use cursor.feetchall() or fetchone() or fetchmany() to read query result
* use commit() to make the changes in database persistent or use rollback() to revert the database changes
* use cursor.close() and connection.close() method to close the cursor and postgreSQL connection
<img src="/images/create.png?raw=true" width="800" height="400">
<br>


### Executing INSERT statement from python
<img src="/images/insert.png?raw=true" width="800" height="400">
<br>


### Executing DELETE statement from python
<img src="/images/delete.png?raw=true" width="800" height="400">
<br>   


### Executing UPDATE statement from python
<img src="/images/update.png?raw=true" width="800" height="400">
<br>


### Executing SELECT statement from python
<img src="/images/select.png?raw=true" width="800" height="400">
<br>


### Web and internet dev using python
##### python offers several frameworks such as bottle.py, Flask, CherryPy, Pyramid, Django and web2py for web dev
* Python offers many choices for web dev
    * frameworks such as Django and Pyramid
    * micro frameworks such as Flask and Bottle
    * advanced content management systems such as Plone and django CMS
* Pythons standard library supports many internet protocols
    * HTML and XML
    * JSON
    * E-mail processing
    * Support for FTP, IMAP and other internet protocols
    * easy to use socket interface
* The package index has more libraries
    * Requests : a powerful HTTP client library
    * Beautiful Soup : an HTML parser that can handle all sorts of HTML
    * Feedparser : for parsing RSS/Atom feeds
    * Paramiko : implementing the SSH2 protocol
    * Twisted Python : a framework for sychronous network programming
<br>


### Python : Flask
* code segment in python
```python
from flask import Flask, render_template, request
import psycopg2

app = Flask(
    __name__,
    template_folder = 'templates'
)
# functions to be added here for different actions
if __name__ == '__main__':
    # run the flask app
    app.run(
        host = '127.0.0.1',
        debug = True,
        port = 5000
    )
```
<br>

* source code for index.html
```html
<html>
    <head>
        <title>Candidate email database</title>
    </head>
    <body>
        <h2>Candidate email database</h2>
        <a href="/add">Add email</a><br><br>
        <a href="/viewall">View email</a>
    </body>
</html>
```
<br>

* source code for rendering index.html and add.html pages
```python
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/add")
def add():
    return render_template("add.html")
```
<br>

<img src="/images/render.png?raw=true" width="800" height="400">
<br>

* source code for add.html
```html
<html>
    <head>
        <title>add email</title>
    </head>
    <body>
        <h2>Email Information</h2>
        <form action="/savedetails" method="post">
            <table>
                <tr><td>CNO</td><td><input type="text" name="cno" required></td></tr>
                <tr><td>Name</td><td><input type="text" name="name" required></td></tr>
                <tr><td>Email</td><td><input type="text" name="email" required></td></tr>
                <tr><td><input type="submit" value="Submit"></td></tr>
            </table>
        </form>
    </body>
</html>
```
<br>

* savedetails() function for add.html (in python):
```python
@app.route("/savedetails",methods=["POST"])
def savedetails():
    cno = request.form["cno"]
    name = request.form["name"]
    email = request.form["email"]
    conn = None
    try:
        conn = psycopg2.connect(database="mydb", user="myuser", password = "mypass", host = "127.0.0.1", port = "5432")
        cur = conn.cursor()
        cur.execute("insert into candidate values(%s, %s, %s)",(cno,name,email))
        conn.commit()
        cur.close()
    except(Exception, psycopg2.DatabaseError) as error:
        render_template("fail.html")
    finally:
        if conn is not None:
            conn.close()
    return render_template("success.html")
```
<br>

<img src="/images/out.png?raw=true" width="800" height="400">



* viewall() function for viewall.html (in python)
```python
@app.route("/viewall")
def viewall():
    conn=None
    try:
        conn = psycopg2.connect(database="mydb", user="myuser", password = "mypass", host = "127.0.0.1", port = "5432")
        cur = conn.cursor()
        cur.execute("select cno,name,email from candidate")
        results = cur.fetchall()
        cur.close()
    except(Exception, psycopg2.DatabaseError) as error:
        render_template("fail.html")
    finally:
        conn.close()
    return render_template("viewall.html",rows = results)
```
<br>


* source code for viewall.html
```html
<html>
    <head>
        <title>Email List</title>
    </head>
    <body>
        <h3>Email List</h3>
        <table border=5>
            <tr>
                <th>CNO</td><th>Name</td><th>Email</td>
            </tr>
            {% for row in rows}
                <tr>
                    <td>{{row[0]}}</td> <td>{{row[1]}}</td> <td>{{row[2]}}</td>
                </tr>
            {% endfor %}
        </table>
        <a href="/"> go home</a>
    </body>
</html>
```
<br>
<img src="/images/fin.png?raw=true" width="800" height="400">
<br>


### Architecture of Mobile App
* tiers
    * presentation
    * business
    * data
* data layer is often split between
    * local data
    * remote data
* needs customization for platform
    * Android
    * iOS
    * Windows
<img src="/images/mobapparch.png?raw=true" width="800" height="400">
<br>


### Backup and recovery
##### Backup
* A backup of a database is a representative copy of data containing all necessary contents of a database such as data files and control files
	* Unexpected database failures especially those due to factors beyond our control are unavoidable. Hence it is important to eep a backup of the entire database
	* There are 2 types of backup 
		* Physical backup: A copy of logical database files such as data, control files, log files and archived redo logs
		* Logical backup: A copy of logical data that is extracted from a database consisting of tables procedures, views, functions, etc..
<br>

##### Recovery
* It is the process of restoring the database to its latest knows consistent state after a system failure occurs
	* A database log records all transactions in a sequence.
	* A typical log files contains info about transactions about transactions to execute transaction states and modified values
<br>

##### Why is backup necessary
* Disaster recovery - Data loss can occur due to cvarious reasons like hardware failures, malware attacks environmental and physical factors or a simoke human error
* Client side changes 
	*  Clients may want to modify the existing application to serve their business's dynamic needs 
	*   Developers might need to restore a previous version of the database in order to address such requirements
* Auditing - From an auditing perspective you need to know what your data looked like at some point in the past
* Downtime - Without backup, system failures lead to data loss which in turn leads to application downtime
<br>

##### Types of backup strategies
###### Full Backup
* It backs everything up
* It is a complete copy, which stores all the objects of the database: tables procedures, functions, views, indexes etc.
* Full backup can restore all components of the database system as it was at the time of crash
> A full backup must be done at least once before any of the other type of backup
* The frequency of  afull backup depends on the type of application. Eg: A full backup is done on a daily basis for applications in which one or more of the following is/are true:
	* Either 24/7 availabilty is not a requirement or system availability is not affected as a conssequence of backups
	* A complete backup takes a minimum amount of media: backup isnt too large
	* Backup/system administrators may not be available on a daily basis, and therefore a priary goal is to reduce to a bare minimum the amount of media required to complete a restore
<br>


###### Incremental Backup
* It targets only thosae files or items that have changed since the last backup
* This often results in smaller backups and needs shorter duration to complete the backup process
* For instance, a 2TB database may only have a 5% change during the day. With incremental database backups the amount backed up is typically only a little more than the actual amount of changed data in the database
* For most organizations a full backup is done once a week and incremental backups are done for the rest of the time

| Fri | Sat| Sun | Mon | Tue | Wed | Thurs |
| --- | --- | --- | --- | --- | --- | --- |
| full | incremental | incremental | incremental | incremental | incremental | incremental |
> This ensures a min backup window during peak activity times with a longer backup window during non peak activity times
<br>


###### Differential Backup
* It backs up all the changes that have occurred since the most recent full backup regardless of what backups have occurred in between
* This "rolls up" multiple changes into a single backup job which sets the basis for the next incremental backup
	* As a differential backup does not back up everything, this backup process usually runs quicker than a full backup
	* The longer the age of a differential backup, the larger teh size of its backup window
* To evaluate how differential backups might work within an environment:

| Fri | Sat| Sun | Mon | Tue | Wed | Thurs |
| --- | --- | --- | --- | --- | --- | --- |
| full | incremental | incremental | incremental | differential | incremental | incremental |

* The incremental backup on saturday backs up all files that have changed since the full backup on friday. likewise all changes since saturday and sunday is backed up on sunday and mondays incremental backup respectively
* On tuesday a differential backup is performed. This backs up all files that have changed since the full backup on friday. A recovery on Wednesday should only require data from the full and differential backups, <b>skipping the sat/sun/mon incremental backups</b>
<br>


### Hot Backup
* It refers to keeping a database up and running while the backup is performed concurrently
* In systems where high availability is a requirement hot backup is preferable wherever possible
<br>


### ACID properties
* Atomicity - all or nothing
* Consistency - preserves database integrity
* Isolation - execute as if they were run alone
* Durabilty - results are not lost by a failure
<br>
* concurrency control guarantees I, contributes to C
* application program guarantees C
* recovery subsystem guarantees A & D, contributes to C
<br>


### Recovery Algorithms
* consider transaction Ti that transfers $50 from account A to account B
    * 2 updates: subtract 50 from A and add 50 to B
* Transaction Ti requires updates to A and B to be output to the database
    * a failure may occur after one of these modifications have been made but before both of them are made
    * modifying the daatabase without ensuring that the transaction will commit may leave the database in an inconsistent state
    * not modifying the database may result in lost updates if failure occurs just after transaction commits
###### Recovery algorithms have 2 parts
* action taken during normal transaction processing to ensure enough information exists to recover from failures
* actions taken after a failure to recover the database contents to a state that ensures atmicity, consistency and durability
<br>


### Storage structure
* Volatile sotrage
	* does not survive system crashes
	* eg: main memory, cache memory 
* Non-volatile storage
	* survives system crashes
	* eg: disk, tape, flash memory, non-volatile(battery packed) Ram
	* but may still fail, losing data
* Stable storage
	* a mythical form of storage that survives all failures
	* approximated by maintaining multiple copies on disticnt non volatile media
<br>


### Stable storage implementation
* maintain multiple copies of each block on separate disks
    * copies can be at remote sites to protect against disasters such as fire or flooding
* failure during data trasnfer can still result in inconsistent copies. Block transfer can result in:
    * successful completion
    * partial failure: destination block has incorrect info
    * total failure: destination block was never updated
* protecting storage media from failure during data transfer
    * execute output operation as follows (assuming two copies of each block)
        * write the info onto the first physical blcok
        * when the first write is successful, write the same info into the second physical block
        * the output is completed only after the second write successfully completes
    * copies of a block may differ due to failure during output operation
    * to recover from failure
        * first find inconsistent blocks
            * expensive solution: compare the two copies of every disk blcok
            * better solution: 
                * record in-prgress disk writes on non volatile storage
                * use this info during recovery to find blocks that may be inconsistent and only compare copies of these
                * used in hardware RAID systems
        * if either copy of an inconsistent block is detected to have and error (bad checksum), overwrite it by the other copy
        * if both have no error but are different overwrite the second block by the first block
<br>


### Recovery and atomicity
* to ensure atomicity despite failutres we first output info describing the modifications to stable storage without modifying the database itself
* Log-based Recovery Mechanisms
    * we first present key concepts
    * and then present the actual recovery algorithm
* less used alternative: **Shadow paging**
<br>


