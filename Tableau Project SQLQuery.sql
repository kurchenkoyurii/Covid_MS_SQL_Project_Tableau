

-- For visualization
--1
SELECT 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS INT)) AS total_deaths, 
	SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeath
WHERE continent IS NOT NULL
ORDER BY 1,2;

--2
SELECT 
	location, 
	SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
From PortfolioProject..CovidDeath
WHERE continent IS NULL 
AND location NOT IN ('World', 
					'European Union', 
					'International',
					'Lower middle income',
					'Low income',
					'Upper middle income',
					'High income')
GROUP BY location
ORDER BY TotalDeathCount DESC;

--3
SELECT  location, 
		population, 
		MAX(total_cases) AS HighestInfectionCount,  
		Max((total_cases/population))*100 AS PercentPopulationInfected
From PortfolioProject..CovidDeath
GROUP BY location, population
ORDER BY  PercentPopulationInfected DESC;


--4

SELECT  location, 
		population,
		date, 
		MAX(total_cases) AS HighestInfectionCount,  
		Max((total_cases/population))*100 AS PercentPopulationInfected
From PortfolioProject..CovidDeath
--Where location like '%states%'
GROUP BY location, population, date
ORDER BY PercentPopulationInfected DESC