use health;

select * from ocd_patient_dataset;

-- 1. Count & Pct of F vs M that have OCD & -- Average Obsession Score by Gender

SELECT
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score

FROM ocd_patient_dataset
Group By 1
Order by 2;

select
	sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
	sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,

	round(sum(case when Gender = 'Female' then patient_count else 0 end)/
	(sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_female,

    round(sum(case when Gender = 'Male' then patient_count else 0 end)/
	(sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_male

from ocd_patient_dataset
;

-- 2.Count of Patients by Ethnicity and their respective Average Obsession Score

select Ethnicity, count('Patient ID') as patient_count,
avg(`Y-BOCS Score (Obsessions)`) as obs_score
from ocd_patient_dataset
Group By 1
Order By 2;


-- 3. Number of people diagnosed with OCD MoM

-- alter table ocd_patient_dataset modify `OCD Diagnosis Date` date;

select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from ocd_patient_dataset
group by 1
Order by 1;

-- 4. What is the most common Obsession Type (Count) & It's respective Average Obsession Score

Select
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from ocd_patient_dataset
group by 1
Order by 2;

-- 5. What is the most common Compulsion type (Count) & It's respective Average Obsession Score

Select
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from ocd_patient_dataset
group by 1
Order by 2;
