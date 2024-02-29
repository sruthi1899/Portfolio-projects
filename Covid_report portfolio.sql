select *
From Portfolioproject..CovidDeaths
where continent is not null
order by 3,4

select *
From Portfolioproject..CovidVaccinations
where continent is not null
order by 3,4


select location,date,population,total_cases,new_cases,total_deaths
From Portfolioproject..CovidDeaths
order by 1,2

--Total Cases Vs Total Deaths

select location, date, population, total_cases, new_cases,total_deaths, (total_deaths/total_cases)*100 as death_percentage
from Portfolioproject..CovidDeaths
order by 1,2

--Total Cases Vs Total Deaths in United states
select location, date, population, total_cases, new_cases,total_deaths, (total_deaths/total_cases)*100 as death_percentage
from Portfolioproject..CovidDeaths
where location like '%states%'
order by 1,2

--Total_cases Vs Population
select location, date, population, total_cases, new_cases,total_deaths, (total_cases/population)*100 as death_percentage
from Portfolioproject..CovidDeaths
where location like '%states%'
order by 1,2

--Total Cases Vs Total Population in the countries
select location, sum(population) as Country_population, sum(total_cases) as Contry_Totalcases
from Portfolioproject..CovidDeaths
where continent is not null
group by location
order by 1,2

--comparing countries highest rate of covid with other countries
select location, population,  MAX(total_cases) as Highestinfected_cases, MAX((total_cases/population))*100 as 
perecentpopulationInfected
From Portfolioproject..CovidDeaths
group by location, population
order by perecentpopulationInfected desc


--Countries highest death count per population
select location, Max(cast(total_deaths as int)) as Totaldeath_count
From Portfolioproject..CovidDeaths
where continent is not null
group by location
order by Totaldeath_count desc

--continent wise statistics 
--continent Population and Continent_cases

select continent, sum(new_cases) as Continent_population, sum(total_cases) as Continent_Totalcases
from Portfolioproject..CovidDeaths
where continent is not null
group by continent
order by 1,2


--continents total deaths
select continent, sum(cast(total_deaths as bigint)) as Continent_Totaldeaths
from Portfolioproject..CovidDeaths
where continent is not null
group by continent
order by 1,2

--Global Numbers on specific dates
select date, sum(total_cases) as worlds_totalcases, sum(new_cases) as worlds_newcases
from Portfolioproject..CovidDeaths
where continent is not null
group by date
order by 1,2

--world New Deaths
select sum(new_cases) as worldnew_cases, sum(cast(new_deaths as bigint)) as worldnew_deaths,
sum(cast(new_deaths as bigint))/sum(new_cases)*100 as death_percentage
from Portfolioproject..CovidDeaths
where continent is not null
order by 1,2

--Total Population Vs Vaccinations
--CTE usage
with popVsvac(continent,population,location,date,new_vaccinations, RollingPeopleVaccinated)
as
(
select d.continent,d.population, d.location,d.date, v.new_vaccinations
,sum(cast(v.new_vaccinations as bigint)) over (partition by d.location) as RollingPeopleVaccinated
from Portfolioproject..CovidDeaths d 
join Portfolioproject..CovidVaccinations v
on d.location=v.location
and d.date=v.date
where d.continent is not null
)
select *, (RollingPeopleVaccinated/population)*100 perecentageofVaccination
from popVsvac 



--Temp table
drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
 continent nvarchar(255),
 Location nvarchar(255),
 date datetime,
 population numeric,
 new_vaccinations numeric,
 RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
select d.continent,d.population, d.location,d.date, v.new_vaccinations,
sum(cast(v.new_vaccinations as int)) over (partition by d.location) as  RollingPeopleVaccinated
from Portfolioproject..CovidDeaths d 
join Portfolioproject..CovidVaccinations v
on d.location=v.location
and d.date=v.date

select *, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated
