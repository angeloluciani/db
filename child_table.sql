#DR_REVIEW_USER_FK2 is the Foreign Key name and EDR is the owner name. So you can run the following query to get the table name on which the foreign key is applied.
select table_name from all_constraints where owner = 'EDR' and constraint_name = 'DR_REVIEW_USER_FK2';
