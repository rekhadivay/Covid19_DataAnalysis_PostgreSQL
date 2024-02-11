--Q1.Datewise likelyhood of dying due to covid- TotalCase vs TotalDeaths in Canada.

 select date, total_cases, total_deaths
 from "Covid_Deaths"
 where location like '%Canada%';

-- Q2.Total % of  deaths out of entire population in Canada.
 
 SELECT * FROM public."Covid_Deaths"
 where location like '%Canada%';
select max(total_deaths)/avg(cast(population as integer))* 100 
 from "Covid_Deaths" 
 where location like '%Canada%' ;



--Q3. To verify the info seperately.

select total_deaths, population 
from "Covid_Deaths"
where location like '%Canada%';

--Q4.Country with highest deaths % of population.

select Location, max(total_deaths)/avg(cast(population as bigint))* 100  as percentage
from "Covid_Deaths"
group by location
order by percentage desc;

--Q5. Total % of covid +ve cases in Canada.

select max(total_cases)/avg(cast(population as bigint))* 100  as percentage_positive
from "Covid_Deaths"
where location like '%Canada%';

--Q6.total % of covid +ve cases in world.

select location, max(total_cases)/avg(cast(population as bigint))* 100  as percentage_positive
from "Covid_Deaths"
group by location
order by percentage_positive desc;

--Q7.Continent wise covid +ve cases.

select location, max(total_cases) as total_case
from "Covid_Deaths"
where continent is null
group by location
order by total_case desc;

--Q8. Continent wise deaths.
select location, max(total_deaths) as total_death
from "Covid_Deaths"
where continent is not null
group by location 
order by total_death desc;

--Q9. Daily new case vs hospitalization vs icu_patients in Canada.
select date,new_cases, hosp_patients, icu_patients
from "Covid_Deaths" 
where location like '%Canada%';

--Q10. CountryWise  covid deaths and vaccination for age > 65.

select "Covid_Deaths".date, "Covid_Deaths".location, "Covid_Vaccinations".aged_65_older 
from "Covid_Deaths"
join "Covid_Vaccinations" on "Covid_Deaths".iso_code = "Covid_Vaccinations".iso_code
 and "Covid_Deaths".date = "Covid_Vaccinations".date;
 
 --Q11.  Contrywise total vaccinated persons.

select "Covid_Deaths".location as country, (max("Covid_Vaccinations". people_fully_vaccinated)) as fully_vaccinated
from "Covid_Deaths"
join "Covid_Vaccinations" on "Covid_Deaths".iso_code = "Covid_Vaccinations".iso_code
and "Covid_Deaths".date = "Covid_Vaccinations".date
where "Covid_Deaths".continent is not null
group by country
order by fully_vaccinated ;
 
---- Q12.  GLOBAL NUMBERS of total cases, total deaths and death percentage
Select SUM(new_cases) as total_case, SUM(cast(new_deaths as int)) as total_death, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From "Covid_Deaths"
where continent is not null 
order by 1,2
 
 
 



















































