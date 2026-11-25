show databases;
create database hospital_management_system;
use hospital_management_system;
CREATE TABLE patients (
 patient_id INTEGER PRIMARY KEY,
 patient_name TEXT,
 age INTEGER,
 gender TEXT,
 city TEXT
);
CREATE TABLE appointments (
 appointment_id INTEGER PRIMARY KEY,
 patient_id INTEGER,
 department TEXT,
 status TEXT,
 fee DECIMAL(10,2)
);
INSERT INTO patients VALUES
(1, 'Aarav', 45, 'M', 'Jaipur'),
(2, 'Priya', 32, 'F', 'Delhi'),
(3, 'Rahul', 50, 'M', 'Jaipur'),
(4, 'Sneha', 28, 'F', 'Mumbai'),
(5, 'Vikram', 60, 'M', 'Delhi'),
(6, 'Anjali', 35, 'F', 'Pune'),
(7, 'Karan', 40, 'M', 'Jaipur'),
(8, 'Riya', 25, 'F', 'Mumbai'),
(9, 'Amit', 55, 'M', 'Pune'),
(10, 'Nisha', 22, 'F', 'Delhi');

INSERT INTO appointments VALUES
(1, 1, 'Cardiology', 'Completed', 1200.00),
(2, 1, 'General', 'Completed', 500.00),
(3, 2, 'Neurology', 'Pending', 1500.00),
(4, 3, 'Orthopedics', 'Completed', 800.00),
(5, 3, 'General', 'Cancelled', 500.00),
(6, 4, 'Dermatology', 'Completed', 600.00),
(7, 4, 'Cardiology', 'Completed', 1100.00),
(8, 5, 'Neurology', 'Completed', 1600.00),
(9, 6, 'Orthopedics', 'Pending', 900.00),
(10, 7, 'General', 'Completed', 500.00),
(11, 7, 'Dermatology', 'Pending', 650.00),
(12, 8, 'Cardiology', 'Completed', 1300.00),
(13, 1, 'Orthopedics', 'Completed', 850.00),
(14, 2, 'General', 'Completed', 500.00),
(15, 3, 'Cardiology', 'Pending', 1200.00),
(16, 4, 'Neurology', 'Completed', 1400.00),
(17, 5, 'Dermatology', 'Cancelled', 600.00),
(18, 6, 'General', 'Completed', 500.00),
(19, NULL, 'Orthopedics', 'Completed', 800.00),
(20, NULL, 'Cardiology', 'Pending', 1250.00);

show tables;
select*from patients;
select * from appointments;

-- 1. Retrieve all patients from 'Jaipur'
select * from patients where city='jaipur';
-- 2. List patients who are older than 40.
select patient_name,age from patients where age>40;
-- 3. Find appointments where the fee is greater than 800.
select appointment_id, department, round(fee,0) from appointments where fee>800;
-- 4. Retrieve all appointments in the 'Cardiology' department.
select appointment_id,round(fee,0),status from appointments where department='cardiology';
-- 5. List female patients located in 'Delhi'.
select patient_name,age from patients where gender='f' and city="delhi";
-- 6. Find appointments that are 'Completed' with a fee under 1000.
select appointment_id,department,round(fee,0) from appointments where status='completed' and fee<1000;
-- 7. Retrieve patients whose names start with the letter 'A'.
select patient_name,city from patients where patient_name like 'A%';
-- 8. Find appointments where the fee is between 500 and 1000 inclusive.
select appointment_id,department , round(fee,0) from appointments where fee between 500 and 1000;
-- 9. List patients who are from either 'Pune' or 'Mumbai'.
select patient_name , city from patients where city = 'pune' or city='mumbai';
-- 10. Find appointments that do NOT have a 'Completed' status.
select appointment_id,department, status from appointments where status <> 'completed';
-- 11. Count the total number of patients from each city
select city, count(patient_id) as patient_count from patients group by city;
-- 12. Count the total number of patients by gender.
select gender, count(gender) as patient_count from patients group by gender;
-- 13. Calculate the total fee collected by each department.
select department , round(sum(fee),0) from appointments group by department;
-- 14. Find the average fee for each department.
select department, round(avg(fee),2) from appointments group by department;
-- 15. Count the total number of appointments per status.
select status , count(appointment_id) as total_appointments from appointments group by status order by status asc;
-- 16. Find the maximum fee charged in each department.
select department, round(max(fee),0) as max_fee from appointments group by department;
-- 17.  Find the minimum age of patients in each city.
select city , min(age) as min_age from patients group by city order by city asc;
-- 18. Find the maximum age of patients grouped by gender.
select gender , max(age) as max_age from patients group by gender order by max_age asc;
-- 19. Count the number of appointments associated with each patient_id.
select patient_id , count(appointment_id) as appt_count from appointments group by patient_id;
-- 20. Calculate the total fees collected for each appointment status.
select status , round(sum(fee),0) as total_fee from appointments group by status;
-- 21. Identify cities that have strictly more than 2 patients.
select city, count(city) as count from patients group by city having count>2;
-- 22. Find departments where the total fees collected exceed 2000.
select department , round(sum(fee),0) as total_fee from appointments group by department having total_fee>2000;
-- 23.  Identify statuses that have more than 4 appointments.
select status, count(appointment_id) as count from appointments group by status having count>4;
-- 24. Find departments where the average fee is greater than 800.
select department, round(avg(fee),1) as avg_fee from appointments group by department having avg_fee>800;
-- 25. Find patient IDs that have 2 or more appointments.
select patient_id, count(appointment_id) as appt_count from appointments group by patient_id having appt_count>=2;
-- 26. Identify genders where the average patient age is strictly greater than 30.
select gender , round(avg(age),1) as avg_age from patients group by gender having avg_age>30;
-- 27. Find cities where the minimum patient age is 25 or older.
select city , min(age) as min_age from patients group by city having min_age>=25;
-- 28. Identify departments where the maximum fee is at least 1200.
select department , round(max(fee),0) as max_fee from appointments group by department having max_fee>1200;
-- 29. Find patient IDs where the total fee paid exceeds 1500.
select patient_id, round(sum(fee),0) as total_fee from appointments group by patient_id having total_fee>1500;
-- 30.  Identify statuses where the total fee is strictly less than 4000
select status, round(sum(fee),0) as total_fee from appointments group by status having total_fee<4000;
-- 31. List the patient names and their appointment departments.
select p.patient_name, a.department from patients p inner join appointments a on p.patient_id=a.patient_id;
-- 32. Find appointment details (department, fee) for the patient named 'Priya'.
select a.department, round((a.fee),0) from patients p inner join appointments a on p.patient_id=a.patient_id where p.patient_name='priya';
-- 33. List patients (name, city) who have a 'Pending' appointment.
select p.patient_name, p.city from patients p inner join appointments a on p.patient_id=a.patient_id where a.status='pending';
-- 34. Calculate the total fees paid by each patient name.
select p.patient_name,round(sum(a.fee),0) as total_paid from patients p inner join appointments a on p.patient_id=a.patient_id group by p.patient_name;
-- 35. Find the average appointment fee paid by patients from 'Jaipur'.
select round(avg(a.fee),1) as avg_fee from patients p join appointments a on p.patient_id=a.patient_id where city='jaipur';
-- 36. List the departments visited by patients who are older than 40.
select a.department from patients p inner join appointments a on p.patient_id=a.patient_id  where p.age>40 group by a.department;
-- 37. Count the number of appointments for each patient name.
select p.patient_name , count(a.appointment_id) as appt_count from patients p inner join appointments a on p.patient_id=a.patient_id group by p.patient_name order by p.patient_name asc; 
-- 38. Find the highest fee paid by a female ('F') patient.
select round(max(a.fee),0) as max_fee from patients p inner join appointments a on p.patient_id=a.patient_id where p.gender = 'f';
-- 39. List patient names who visited either the 'Cardiology' or 'Neurology' departments.
select p.patient_name from patients p inner join appointments a on p.patient_id = a.patient_id where a.department = 'cardiology' or a.department ='neurology' group by p.patient_name;
-- 40. Show patient name, gender, department, and status for appointments with a fee over 1000.
select p.patient_name,p.gender,a.status,a.department from patients p inner join appointments a on p.patient_id = a.patient_id where fee>1000;
-- 41. List all patients and their appointment IDs, ensuring patients with zero appointments are included.
select p.patient_name, a.appointment_id from patients p left join appointments a on p.patient_id = a.patient_id ;
-- 42. Find the names of patients who have NEVER booked an appointment.
select p.patient_name from patients p left join appointments a on p.patient_id = a.patient_id where a.appointment_id is null ;
-- 43. Count the number of appointments per patient name, showing 0 for those without appointments.
select p.patient_name,count(a.appointment_id) as appt_count from patients p left join appointments a on p.patient_id = a.patient_id group by p.patient_name order by patient_name asc;
-- 44. Calculate total fees paid per patient name, treating missing appointments as 0 total fee.
select p.patient_name,round(ifnull(sum(a.fee),0),0)as total_fee from patients p left join appointments a on p.patient_id = a.patient_id group by p.patient_name order by patient_name asc;
-- 45. List patient name, age, and appointment status, preserving all patient records.
select p.patient_name , p.age, ifnull(a.status,'none') as status from patients p left join appointments a on p.patient_id=a.patient_id;
-- 46.  List all appointments and their associated patient names, ensuring unassigned appointments are included.
select a.appointment_id , ifnull(p.patient_name,'none') as patient_name from patients p right join appointments a on p.patient_id=a.patient_id;
-- 47. Find appointment IDs and departments that have NO assigned patient.
select a.appointment_id, a.department from patients p right join appointments a on p.patient_id = a.patient_id where p.patient_id is null;
-- 48. Calculate the total fees collected from unassigned appointments
select round(sum(a.fee),0) as unassigned_fee from patients p right join appointments a on p.patient_id = a.patient_id where p.patient_id is null;
-- 49. Count appointments per patient city, ensuring all appointments (even unassigned ones) are counted.
select ifnull(p.city,'none') as city, count(a.appointment_id) as appt_count from patients p right join appointments a on p.patient_id=a.patient_id group by p.city;
-- 50. List the department, fee, and patient name, preserving all appointment records.
select a.department, ifnull(p.patient_name,'none') as patient_name, round(a.fee,0) as fee from patients p right join appointments a on p.patient_id = a.patient_id ;




