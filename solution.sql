/* 1.List all currently admitted patients with their doctor's name.*/
select concat(p.first_name,'_',p.last_name) as patients_full_name, concat(d.first_name,'_',d.last_name) as doctor_full_name  from patients p 
join doctors d on p.doctor_id = d.doctor_id ;

/* 2.Count total patients in each ward.*/
select ward,count(concat(first_name,'_',last_name)) as patients_count  from patients group by ward;

/* 3. Find the doctor with the highest salary.*/
SELECT concat(first_name,'_',last_name) AS doctor_full_name, salary
FROM doctors
ORDER BY salary DESC
LIMIT 1;
/* 4.Show all patients admitted in February 2024.*/
select  concat(first_name,'_',last_name) as patients_name, admission_date from patients where EXTRACT(MONTH FROM admission_date) = 02
and EXTRACT(year FROM  admission_date) = 2024 

/* 5.Which doctor is handling the most patients?*/
select  
count(patient_id) as patient_count,concat(d.first_name,'_',d.last_name) as doctor_full_name  from patients p 
join doctors d on p.doctor_id = d.doctor_id 
group by concat(d.first_name,'_',d.last_name)
order by patient_count desc
limit 1;

/* 6. List patients who have been admitted for more than 6 days.*/
select * from (select patient_id ,discharge_date - admission_date as diff from patients)temp  where diff >5

/* 7.Find all doctors who currently have no patients assigned.*/

SELECT * FROM doctors 
WHERE doctor_id NOT IN (
    SELECT DISTINCT doctor_id FROM patients
);

/* 8.Show the average hospital stay (in days) per ward.*/

select * from (select ward ,round(avg(diff)) as days from (select ward,patient_id ,discharge_date - admission_date as diff from patients)temp group by ward) where days is not null 

/* 9.Rank doctors by number of patients using a window function.*/

select doctor_full_name  , Dense_rank() over(order by patient_count desc) as rnk from  (select  
count(patient_id) as patient_count,concat(d.first_name,'_',d.last_name) as doctor_full_name  from patients p 
join doctors d on p.doctor_id = d.doctor_id 
group by concat(d.first_name,'_',d.last_name)
order by patient_count desc)
AS doctor_summary;
/* 10.Show monthly admission count for 2024 using DATE_TRUNC.*/

select DATE_TRUNC('month',admission_date) as p_month ,count(patient_id) from patients
where EXTRACT(YEAR FROM admission_date) = 2024
group by DATE_TRUNC('month',admission_date)




