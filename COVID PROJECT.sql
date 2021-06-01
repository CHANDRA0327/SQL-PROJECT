Select *
from PortfolioProject.dbo.covidDeaths$
order by 3,4


select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject.dbo.covidDeaths$
order by 1,2

select location,Population, max(total_cases) as HighestInfectioncount, Max(total_cases/population)*100 as
Percantagepopulation_Infected
from PortfolioProject.dbo.covidDeaths$
Group by location,population
order by Percantagepopulation_Infected desc



select DATE , sum(total_cases)--,total_deaths, (total_deaths/total_cases)*100 as DeathPercantage
from PortfolioProject.dbo.covidDeaths$
where continent is not null
Group by date 
order by 1,2

select DEA.continent,DEA.location,DEA.date,DEA.population,VAC.new_vaccinations
,SUM(convert(int,new_vaccinations)) OVER (Partition by DEA.location order by dea.location,dea.date) as Cumulativevacinated
from PortfolioProject..covidDeaths$ AS DEA
join PortfolioProject..CovidVaccinations$ AS VAC
ON DEA.location=VAC.location
AND DEA.date=VAC.DATE
WHERE DEA.continent IS NOT NULL
ORDER BY 2,3
















