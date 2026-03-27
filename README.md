# Global Terrorism Statistics 

## Overview 
This project uses exploratory data analysis to identify trends in terrorist attacks and casualties, specifically frequency of attacks in regions and years 
as well as trends in types of attacks and targets. The goal is to transform raw data from the Global Terrorism Database kept by START at the University of
Maryland into actionable insights.

## Note on Data
- The data this project used can be found and downloaded at https://www.start.umd.edu/gtd-download

## Key Insights
- Attacks increased following the start of the Afghanistan War in 2001, and peaked in the mid 2010s before declining in recent years
- The most affected region is the Middle East and North Arica, with the 2 most affected countries (Iraq and Afghanistan) in this region, who account for a large proportion of total attacks
- Terrorist attacks are mostly bombing and explosions (around 50 percent of all), with the next type (armed assault) following at second at around 25 percent
- Private citizens and militaries are the most common targets of terrorist attacks.
  
## Tools Used 
- Python: data processing and cleaning
- SQL: data storage and aggregation
- Power BI: dashboard and data vizualization
  
## Dashboard Features
- Line Chart: Attacls and casualties over time (1970-2020)
- Map: Global distribution of attacks by country
- Bar chart: attack types (percentage)
- Pie chart: target types
- KPI Cards:
    - Total Attacks
    - Total Casualties
    - Suicide Attacks
    - Most Affected Country
    - Most Affected Region

## How to Use 
- You can download the .pbix file and open in your dekstop or mobile PowerBI. The map is interactive, so clicking on a country will show the KPI cards for that specific country.
- There are also pngs of the dashboard and whole map in the PowerBI folder

## Future Improvements
- Predictive analytics for likelihood of attacks (logistic/probit regression or other ML model)
- Time series forecasting
- Publish dashboard for web acess
