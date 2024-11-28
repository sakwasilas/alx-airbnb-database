3 RD NORMAL FORM 
## 1st Normal Form (1NF)
. Ensure all attributes are atomic (indivisible).


. Eliminate repeating groups.

## 2nd Normal Form (2NF)
. Must satisfy 1NF.

. Eliminate partial dependencies: all non-key attributes must depend on the entire primary key, not part of it

## 3rd Normal Form (3NF)
. Must satisfy 2NF

. Eliminate transitive dependencies: non-key attributes must depend only on the primary key

## user table

.user(user_id, first_name, email) the table satify third normal form
