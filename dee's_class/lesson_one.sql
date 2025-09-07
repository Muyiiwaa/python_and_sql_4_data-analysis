-- HOW TO CREATE A DATABASE.
create database chicken_republic;

-- switch context to chicken republic database.
use chicken_republic;

-- create the database tables. (order, staff, branch).
create table branch(
branch_id int,
branch_name varchar(25) unique,
date_founded date not null,

primary key(branch_id));

-- create table staff.
create table staff(
staff_id int,
full_name varchar(50) not null,
gender enum('male', 'female', 'others') not null,
branch_id int not null,

primary key(staff_id),
foreign key (branch_id) references branch (branch_id));

create table orders(
orderid int auto_increment,
branch_id int not null,
staff_id int not null,
amount decimal not null,

primary key(orderid),
foreign key (branch_id) references branch (branch_id),
foreign key (staff_id) references staff (staff_id)
);