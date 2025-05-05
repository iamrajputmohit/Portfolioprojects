select	*
from covid_deaths_synthetic
order by 3,4

select location,date,total_cases,new_cases,total_deaths
from covid_deaths_synthetic
order by 3,4




-- looking at total case vs total deaths 
-- shows the likelyhood of dieing if you are convicted, in a afghanistan 
SELECT location,date,total_cases, total_deaths, (total_deaths / total_cases) * 100 AS 'death%'
FROM covid_deaths_synthetic;
order by 1,2



-- looking at countries with most cases
select location,max(total_cases) as highestinfectioncount 
from covid_deaths_synthetic
group by location
order by highestinfectioncount desc 



-- looking at countries with most deaths
select location,max(total_deaths) as highestdeathcount 
from covid_deaths_synthetic
group by location
order by highestdeathcount desc 



-- Global Nubmers
SELECT 
    date, 
    SUM(new_cases) AS total_cases, 
    SUM(new_deaths) AS total_deaths, 
    (SUM(new_deaths) / SUM(new_cases)) * 100 AS death_percentage
FROM covid_deaths_synthetic
GROUP BY date
ORDER BY 1, 2 DESC;


-- total cases vs total vaccination 
SELECT 
    cd.date, 
    GROUP_CONCAT(DISTINCT cd.location) AS locations,
    SUM(cd.new_cases) AS total_cases,
    SUM(cv.total_vaccinations) AS total_vaccinations
FROM coviddeaths.covid_deaths_synthetic cd 
JOIN covidvaccination.covid_vaccination_80000 cv 
    ON cd.location = cv.location 
    AND cd.date = cv.date 
GROUP BY cd.date
ORDER BY cd.date;









