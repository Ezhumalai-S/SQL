create database HMS;
use HMS;

#TABLE-1- Patient
#=================
create table Patient (
	patient_id int primary key auto_increment,
	patient_name varchar(50) not null,
	patient_age int not null,
	patient_gender varchar(50),
	patient_address varchar(50),
	patient_phone_number varchar(50) unique,
	patient_blood_type varchar(2) not null
);    
select*from patient;
#TABLE-2- Doctor
#================use HMS;

create table Doctor (
	doctor_id int primary key,
	name varchar(50),
	specialty varchar(11),
	consultation_fee int,
	years_of_experience int,
	working_hours varchar(8)
); 
select*from doctor;
#TABLE-3- Appoinment
#===================

create table Appoinment (
	appointment_id int,
	patient_id int,
    foreign key (patient_id) references patient(patient_id),
	doctor_id int,
    foreign key (doctor_id) references doctor(doctor_id),
	appointment_date date,
	appointment_time varchar(50)
); 

#TABLE-4- Patient_History
#========================

create table Patient_History(
Patient_Id int,
foreign key(Patient_Id) references Patient(Patient_Id),
Patient_Height int,
Patient_Weight int,
Patient_BP varchar(30),
Patient_Temperature varchar(15),
Patient_Health_Issue varchar(50) not null
);

#TABLE-5- Staff_Details
#=======================

create table Staff_Details(
Staff_Id int primary key,
Staff_Name varchar(40),
Staff_Role varchar(20) not null,
Staff_Salary int check (Staff_Salary>=10000),
Staff_Shift varchar(40)
); 

#TABLE-6- Room
#=============

create table Room(
Room_No int primary key,
Room_Type varchar(30),
patient_id int,
foreign key (patient_Id) references patient(patient_Id),
Staff_Id int,
foreign key (Staff_Id) references Staff_Details(Staff_Id),
Admission_date date
);  
drop table room;
select * from room;
#TABLE-7- Invoice
#==============

create table Invoice(
Invoice_No int unique not null,
Patient_Id int,
foreign key(Patient_Id) references Patient(Patient_Id),
Bill_Payer_Name varchar(50),
Payment_Method varchar(60),
Bill_Amount int ,
Invoice_Status bool
);   
drop table Invoice;
#===============================================================================

#INSERT-TABLE-1-Patient
#=====================
insert into Patient  values (1, 'Arun', 45, 'Male', 'Madurai', '909-156-4942', 'A'),
                            (2, 'Nanthini', 35, 'Female','Pondy ', '377-782-3290', 'AB'),
                            (3, 'Haritha', 46, 'Female', 'Trichy', '171-876-0703', 'O'),
                            (4, 'Trisha', 24, 'Female', 'Villupuram', '865-524-2180', 'AB'),
                            (5, 'Yashika', 23, 'Female', 'Cuddalore', '279-174-5307', 'A'),
                            (6, 'Banu', 45, 'Female', 'Chengalpattu', '477-840-8410', 'A');
                            

alter table patient change column patient_phone_number  patient_moblie_number varchar(30);
update patient set patient_moblie_number='9089980991' where patient_name='Banu';      
set sql_safe_updates=0;                      

#INSERT-TABLE-2-Doctor
#====================
insert into Doctor values (11, 'Sindhu', 'Pediatrics', 590, 2, '10am-7pm','999000888'),
						  (12, 'Udhay', 'Pediatrics', 630, 1, '9am-6pm','8888999900'),
                          (13, 'Reden', 'Oncology', 770, 22, '9am-6pm','7777888899'),
                          (14, 'Karmegam', 'Dermatology', 420, 49, '10am-7pm','8887779990'),
                          (15, 'Tamos', 'Pediatrics', 800, 26, '9am-6pm','99988776699');

alter table Doctor add column mobile_no varchar(15);                      
select*from doctor;
                            
#INSERT-TABLE-3-Appoinment
#=========================
insert into Appoinment values (111, 1, 11, '2024/11/11', '6:00 PM'),
                              (112, 2, 12, '2024/08/08', '11:30 AM'),
							  (113, 3, 13, '2024/09/09', '7:30 PM'), 
                              (114, 4, 14, '2024/10/10', '10:00 AM'),
							  (115, 5, 15, '2024/12/12', '8:00 AM');

select* from Appoinment;
select appointment_id,appointment_date from Appoinment;

#INSERT-TABLE-4-Patient_History
#==============================
insert into Patient_History values (1,156,56,'110/200','102 F','Tythoid'),
                                   (2,148,88,'90/200','99 F','Heart_Attack'),
                                   (3,165,65,'133/200','98.0 F','Thyroid'),
                                   (4,177,89,'102/200','96.67 F','Braintumour'),
                                   (5,164,70,'98/200','96.00 F','Open_heart_surgery'),
                                   (6,145,60,'101/200','96.92 F','Cancer');
select* from Patient_History;
delete from  Patient_History where Patient_Health_Issue='Cancer';
							
#INSERT-TABLE-5-Staff_Details  
#============================
							
insert into Staff_Details values
                           (1111,'Saranya','Nurse','18000', '2024/08/11 15.30.00' ),
                           (1112,'Monika','Nurse','20000', '2024/05/05 10.30.00'),
						   (1113,'Kavidha','Receptionist',15000, '2024/10/25 01.00.00'),
                           (1114,'Kalaivaanan','Ward_Boy',15500, '2024/09/19 12.00.00'),
						   (1115,'Aravind','Helper',14000, '2024/08/17 13.00.00'),
                           (1116,'Vicky','Service_man',13500, '2024/12/22 18.30.00');

select * from Staff_Details where staff_salary>10000;
select * from Staff_Details where staff_salary<14000;

#INSERT-TABLE-6-Room
#===================
insert into Room values (01,'Ordinary',1,1111,'2024/07/12'),
                        (02,'AC',3, 1112,'2024/08/15'),
                        (03,'Normal',4,1113,'2024/09/17'),
                        (04,'Ward',5,1114,'2024/10/19'),
                        (05,'Special_ward',6,1115,'2024/11/21');
                        select*from room;
#INSERT-TABLE-7-Invoice
#======================
insert into Invoice values (1001,1,'Radha','Online',25000,True),
                           (1002,2,'Amudhan','Googlepay',40000,False),
                           (1003,3,'Sekar','Cash',35000,True),
                           (1004,4,'Susi','Card',43000,False),
                           (1005,5,'Raji','Net_banking',50000,True),
                           (1006,6,'Barathi','cheque',100000,False);
                           
#===============================================================================                           
############ GROUP_BY AND ORDER_BY###########
#GROUP BY
#=======
####Write a SQL query to find the average bill  for each Patient. Display the patient_id and the average bill

select Payment_Method,count(*),sum(bill_amount) as average_bill_amount 
from Invoice  
group by Payment_Method;

###calculate the average salary for each staff_role, sorted in asc order by staff_role name

select staff_salary,Staff_Role,staff_name from Staff_Details; 

select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role; 
select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role order by Staff_Role asc; 
select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role order by Staff_Role desc; 

#####--------------- sub QUery--------########### 

select*from Staff_Details where Staff_Role='Nurse';
select count(*) from Staff_Details where Staff_Role='Nurse';
select * from invoice;
select * from invoice where bill_amount >30000;
select count(*) from invoice where bill_amount >30000;

select * from Invoice where bill_amount > (select bill_amount from invoice where bill_amount=35000);
select *from Invoice where bill_amount >30000 ;

### aggregate fuction to condtion using by at having

select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role having avg(staff_salary)<25001;
select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role having avg(staff_salary)>20000;
select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role having avg(staff_salary)>=15000;
select avg(staff_salary),Staff_Role from Staff_Details group by Staff_Role having avg(staff_salary)<=15500;

#=========================================================================

############USING_OPERATORS############ 
###/*Operator: AND
SELECT *FROM Doctor WHERE consultation_fee >= 600 AND consultation_fee <= 790;
###/*Operator: NOT
SELECT * FROM Appoinment WHERE NOT Appointment_Id = 111;
select* from appoinment;
###/*Operator: OR
SELECT * FROM Staff_Details WHERE Staff_name = 'Saranya' OR Staff_Salary > 22000;
###/*Operator: LKE
select* from Room where Room_Type like"a%"; 
select* from Room where Room_Type like"%ar%"; 
select* from Room where Room_Type like"__r%"; 
select* from Room where Room_Type like"%d"; 
###/*Operator: IN                        
select* from Patient_History where Patient_Health_Issue in ('Tythoid','Heart_Attack','Braintumour');
select* from Patient_History where Patient_Health_Issue not in ('Tythoid','Heart_Attack','Braintumour');
###/*Operator: BETWEEN
select * from Patient_History where Patient_Height between 150 and 190;
select * from Patient_History where Patient_Height not between 150 and 190;

#==========================================================                       

###########AGGREGATE_FUNCTONS#############

select Bill_Amount from Invoice;
select Bill_Amount,Bill_Payer_Name from Invoice;
###/*AGGREGATE:MAX
select max(Bill_Amount),Bill_Payer_Name from Invoice;
###/*AGGREGATE:MIN
select min(Bill_Amount),Bill_Payer_Name from Invoice;
###/*AGGREGATE:AVG
select avg(Bill_Amount),Bill_Payer_Name from Invoice;
###/*AGGREGATE:SUM
select sum(Bill_Amount),Bill_Payer_Name from Invoice;
select sum(Bill_Amount) as total from Invoice;
###/*AGGREGATE:COUNT(),
select count(Bill_Amount),Bill_Payer_Name from Invoice;
select count(*) Bill_Amount from Invoice;
select count(Bill_Amount),Bill_Payer_Name from Invoice where Payment_Method='card';
######### find the Patient_Id with the highest avg Bill_Amount:
select avg(Bill_Amount),Patient_Id from Invoice group by Patient_Id order by avg(Bill_Amount) desc limit 1;
select avg(Bill_Amount),Patient_Id from Invoice group by Patient_Id order by avg(Bill_Amount) desc limit 3;
select avg(Bill_Amount),Patient_Id from Invoice group by Patient_Id order by avg(Bill_Amount) asc limit 1;
select avg(Bill_Amount),Patient_Id from Invoice group by Patient_Id order by avg(Bill_Amount) asc limit 4;

#===================================================================

###SINGLE ROW FUNCTIONS
#====================
#--1.CONCAT
#--- Combine patient_name and patient_phone_number into a single column name_number.

select concat(patient_name,' ', patient_moblie_number) as name_number from Patient;
select* from  patient;
#--2. LENGTH
#--Find the length of doctor_name for all doctors;

SELECT name, LENGTH(name) AS name_length FROM Doctor;

select* from doctor;

#--3. UPPER
--- Convert Staff_Name to uppercase
select Staff_Name, upper(Staff_Name) as Staff_Name_Upper from Staff_Details;
                           
#--4. LOWER
--- Convert Room_type to lowercase
select Room_Type, lower(Room_Type) as Room_Type_Lower from Room;


# ======================  JOINS ======================================
#INNER join with 2 tables.
					
select t_1.patient_id,t_1.patient_name,t_1.patient_moblie_number, 
	   t_3.appointment_id,t_3.appointment_date       
from patient as t_1 inner join appoinment as t_3 on t_1.patient_id=t_3.patient_id; 

 ###table full joins
select* from patient t_01 
inner join appoinment t_03
on t_03.patient_id= t_01.patient_id; 

#=================================
 #Left  outer join with 2 table

 select t_5.staff_id,t_5.staff_name,t_5.staff_role, 
	   t_6.room_no,t_6.room_type       
from staff_details as t_5 left outer join room as t_6 on t_5.staff_id=t_6.staff_id;
 
 #=============================
#Right outer join withh 2 table 
 
 select t_4.patient_id,t_4.patient_health_issue, 
	    t_7.bill_payer_name,t_7.bill_amount       
from patient_history as t_4 right outer join invoice as t_7 on t_4.patient_id=t_7.patient_id;
            
#============================
#--- full outer join with 2 table

select t_4.patient_id,t_4.patient_health_issue, 
	    t_7.bill_payer_name,t_7.bill_amount       
from patient_history as t_4 right outer join invoice as t_7 on t_4.patient_id=t_7.patient_id
union
select t_4.patient_id,t_4.patient_health_issue, 
	    t_7.bill_payer_name,t_7.bill_amount       
from patient_history as t_4 right outer join invoice as t_7 on t_4.patient_id=t_7.patient_id;

select* from  patient; 
select* from doctor; 
select* from appoinment; 
select* from staff_details; 
select* from room; 
select* from invoice;
select * from outerjoin;
########################

###########    CASE   ###############

select *, 
case
when bill_amount > 35000 then 'high pay'
when bill_amount < 35000 then 'low pay'
else "pay"
end as status
from invoice;

################ views   ###### 
create view outerjoin as
select t_4.patient_id,t_4.patient_health_issue, 
	    t_7.bill_payer_name,t_7.bill_amount       
from patient_history as t_4 right outer join invoice as t_7 on t_4.patient_id=t_7.patient_id;

select * from outerjoin;
############################3
