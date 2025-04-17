-- Who prefers energy drink more? (male/female/non-binary?)


SELECT d.Gender, f.Consume_frequency
 FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by gender
order by f.Consume_frequency;

 -- Which age group prefers energy drinks more?


SELECT d.age, f.Consume_frequency
 FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by age
order by f.Consume_frequency DESC;

-- Which type of marketing reaches the most Youth (15-30)?


SELECT d.age, f.Marketing_channels
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by age
order by f.Marketing_channels DESC;

-- What are the preferred ingredients of energy drinks among respondents?

SELECT f.Ingredients_expected, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by f.Ingredients_expected
order by num_respondent DESC;

-- What packaging preferences do respondents have for energy drinks?


SELECT f.Packaging_preference, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by f.Packaging_preference
order by num_respondent DESC;

-- Who are the current market leaders?

SELECT Current_brands, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by f.Current_brands
order by num_respondent DESC;

-- What are the primary reasons consumers prefer those brands over ours?

SELECT Current_brands, count(d.Respondent_ID) as num_respondent, Reasons_for_choosing_brands
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by f.Current_brands
order by num_respondent DESC;


-- Which marketing channel can be used to reach more customers?

SELECT Marketing_channels, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
group by Marketing_channels
order by num_respondent DESC;

-- How effective are different marketing strategies and channels in reaching our customers?


SELECT Marketing_channels, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
where f.Current_brands = "CodeX"
group by Marketing_channels
order by num_respondent DESC;

-- What do people think about our brand? (overall rating)


SELECT Current_brands, Taste_experience
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
where f.Current_brands = "CodeX"
group by Current_brands;

-- Which cities do we need to focus more on?


SELECT city, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
join dim_cities c
on d.Respondent_ID = f.Respondent_ID and d.City_ID = c.City_ID
where f.Current_brands = "CodeX"
group by city
order by num_respondent DESC limit 5;

-- Where do respondents prefer to purchase energy drinks?

SELECT Purchase_location, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
where f.Current_brands = "CodeX"
group by Purchase_location
order by num_respondent DESC;

-- What are the typical consumption situations for energy drinks among respondents?


SELECT Consume_reason, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
where f.Current_brands = "CodeX"
group by Consume_reason
order by num_respondent DESC;

-- Which area of business should we focus more on our product development? (Branding/taste/availability)


SELECT Reasons_for_choosing_brands, Marketing_channels,
Taste_experience, count(d.Respondent_ID) as num_respondent
FROM dim_repondents d
join fact_survey_responses f
on d.Respondent_ID = f.Respondent_ID
where f.Current_brands = "CodeX"
group by Marketing_channels, Taste_experience
order by Taste_experience  DESC,
num_respondent;



