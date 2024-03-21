# Vector-insde-IRIS
This is an attempt to run a vector search demo comletely in IRIS    
There are no external tools an all you need is a Terminal / console   
and the managment portal
Special thanks to [Alvin Ryanputra](https://community.intersystems.com/user/alvin-ryanputra)
as his package [iris-vector-search](https://openexchange.intersystems.com/package/iris-vector-search)   
was inspiration and source fot test data.   
My package is based on IRIS 2024.1 release and requires attention to your processor.   

I attempted to write the demo in pure ObjectScript only the calcualtion of 
the description vector is done in embedded Python.
Calculatiion of a vection with 384 dimension over 2247 records takes time.
My Docker containe took 01:53:14 to geerate it.  
So I adjuted that step to be reentrant to allow pausing generation.
Every 50 records you get an offer to have a stop.

Any suggestion for enhacements are very welcome,

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
### Installation
Clone/git pull the repo into any local directory
```
$ git clone https://github.com/rcemper/Vector-inside-IRIS.git
```
To build and start the container run:
```
$ docker compose up -d && docker compose logs -f
```
To open IRIS Terminal do:
```
$ docker-compose exec iris iris session iris
USER>
```
or using **WebTerminal**
```
http://localhost:42773/terminal/
```
To access IRIS System Management Portal
```
http://localhost:42773/csp/sys/UtilHome.csp
```
### How to use it
From terminal just start   
```
USER>do ^A.DemoV

     Test Vector Search
=============================
     1 - Initialize Tables
     2 - Generate Data
     3 - VECTOR_COSINE
     4 - VECTOR_DOT_PRODUCT
     5 - Create Scotch
     6 - Load Scotch.csv
     7 - generate VECTORs
     8 - VECTOR search
Select Function or * to exit : 8

     Default search:
Let's look for a scotch that costs less than $100,
 and has an earthy and creamy taste
     change price limit [100]: 50
     change phrase [earthy and creamy taste]: earthy

calculating search vector

     Total below $50: 222

ID      price   name
1990    40      Wemyss Vintage Malts 'The Peat Chimney,' 8 year old, 40%
1785    39      The Famous Jubilee, 40%
1868    40      Tomatin, 15 year old, 43%
2038    45      Glen Grant, 10 year old, 43%
1733    29      Isle of Skye, 8 year old, 43%

5 Rows(s) Affected
```
You see basic functionalities of Vectors in steps 1..4   
Step 5..8 is the search example    
6 import of test data is straight Objeect Script    
SQL LOAD DATA was far to sensible for irregularities in the input CSV  

I suggest to follow the examplea also in MGMT portal to see how Vectors operate

 