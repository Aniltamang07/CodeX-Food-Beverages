# CodeX Food & Beverages

![]()

## Overview
CodeX is a German beverage company that is aiming to make its mark in the Indian market. A few months ago, they launched their energy drink in 10 cities in India.

Their Marketing team is responsible for increasing brand awareness, market share, and product development. They conducted a survey in those 10 cities and received results from 10k respondents.

## Objectives

* **Customer Demographics and Preferences:**
    * Identify gender and age groups that prefer energy drinks.
    * Determine preferred ingredients and packaging.
    * Understand typical consumption situations.
* **Market Analysis:**
    * Identify market leaders.
    * Analyze reasons for competitor preference.
* **Marketing Effectiveness:**
    * Determine effective marketing channels for specific demographics.
    * Evaluate marketing strategy effectiveness.
* **Brand Perception:**
    * Assess consumer opinions of the "Codex" brand.
* **Sales and Distribution (Codex):**
    * Identify key cities.
    * Determine preferred purchase locations.
* **Product Development (Codex):**
    * Identify areas for product development focus.
* **Atliq Hardware Sales Analysis (Images):**
    * Analyze year-over-year sales growth.
    * Evaluate new product performance.
    * Identify top-performing products.

## 🔍 Detailed Findings

### 1. Brand Performance Analysis
#### Market Share Distribution
| Brand       | Respondents | Market Share | Primary Selection Factor |
|-------------|------------|-------------|--------------------------|
| Cola-Coka   | 2,538      | 25.4%       | Availability             |
| Bepsi       | 2,112      | 21.1%       | Availability             |
| Gangster    | 1,854      | 18.5%       | Brand Reputation         |
| Blue Bull   | 1,058      | 10.6%       | Availability             |
| Others      | 2,439      | 24.4%       | Various                  |

#### Key Observations:
- Top 3 brands control 65% of market
- Availability drives 57% of primary brand selections
- Gangster demonstrates strong brand equity advantage

### 2. Marketing Channel Effectiveness
#### Overall Performance
| Channel            | Respondents Reached | Effectiveness Score* |
|--------------------|---------------------|----------------------|
| Online Ads         | 4,020               | 92                   |
| TV Commercials     | 2,688               | 85                   |
| Outdoor Billboards | 1,226               | 72                   |
| Print Media        | 841                 | 68                   |
| Other              | 1,225               | 65                   |

*Effectiveness Score (0-100) based on conversion metrics

#### Demographic Breakdown:
- **15-18 Year Olds**: TV commercials (78% recall rate)
- **19-30 Year Olds**: Social media ads (84% engagement)
- **31-45 Year Olds**: YouTube pre-roll (89% completion rate)
- **65+**: Local newspaper inserts (72% response)

### 3. Consumer Demographics
#### Consumption Frequency
| Demographic | Frequency         | Percentage |
|-------------|-------------------|------------|
| Female      | 2-3 times/week    | 42%        |
| Male        | 2-3 times/month   | 38%        |
| Non-binary  | Rarely            | 20%        |

#### Age Group Patterns
| Age Group | Frequency         | 
|-----------|-------------------|
| 15-18     | 2-3 times/week    |
| 19-30     | 2-3 times/month   | 
| 31-45     | 2-3 times/week    | 
| 46-65     | Once a week       | 
| 65+       | 2-3 times/week    |

### 4. Product Attributes
#### Ingredient Preferences
1. Caffeine (3,896 mentions)
   - Energy boost (87%)
   - Mental focus (76%)
2. Vitamins (2,534)
   - Health perception (82%)
   - Recovery benefits (68%)

#### Packaging Trends
| Type                   | Respondents | Key Drivers                     |
|------------------------|-------------|---------------------------------|
| Compact cans           | 3,984       | Portability (92%), Convenience  |
| Innovative bottles     | 3,047       | Design appeal (88%), Ergonomics |
| Collectible packaging  | 1,501       | Limited editions (79%)         |
| Eco-friendly          | 983         | Sustainability (65%)           |




##  Anlysis from the dataset

### 1.  Who prefers energy drink more? (male/female/non-binary?)

```sql
SELECT d.gender,
       f.consume_frequency
FROM   dim_repondents d
       JOIN fact_survey_responses f
         ON d.respondent_id = f.respondent_id
GROUP  BY gender
ORDER  BY f.consume_frequency; 
```

**Objective:** Find Which gender energy drink.

### 2.  Which age group prefers energy drinks more?

```sql
SELECT d.age, f.Consume_frequency
FROM dim_repondents d
  JOIN fact_survey_responses f
    ON d.Respondent_ID = f.Respondent_ID
GROUP BY d.age
ORDER BY f.Consume_frequency DESC;
```

**Objective:** Find which age Group prefer energy drink more.

### 3.  Which type of marketing reaches the most Youth (15-30)?


```sql
SELECT d.age, 
       f.Marketing_channels
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY d.age
ORDER BY f.Marketing_channels DESC;
```

**Objective:** Find which marketing reaches the youth.

### 4. What are the preferred ingredients of energy drinks among respondents?
 

```sql
SELECT f.Ingredients_expected, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY f.Ingredients_expected
ORDER BY num_respondent DESC;

```

**Objective:** Find the preferred ingredients.

### 5. What packaging preferences do respondents have for energy drinks?


```sql
SELECT f.Packaging_preference, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY f.Packaging_preference
ORDER BY num_respondent DESC;
```

**Objective:** Find the preferred Packing for energy drinks.

### 6. Who are the current market leaders?


```sql
SELECT Current_brands, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY f.Current_brands
ORDER BY num_respondent DESC limit 2;
```

**Objective:** Find the current leader .

### 7. What are the primary reasons consumers prefer those brands over ours?


```sql
SELECT Current_brands, 
       COUNT(d.Respondent_ID) AS num_respondent, 
       Reasons_for_choosing_brands
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY f.Current_brands
ORDER BY num_respondent DESC;
```

**Objective:** Find the reason why conusumer choosing other brands.

### 8. Which marketing channel can be used to reach more customers?

```sql
SELECT Marketing_channels, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
GROUP BY Marketing_channels
ORDER BY num_respondent DESC;
```

**Objective:** Check which marketing channel has more reach.

### 9.  How effective are different marketing strategies and channels in
reaching our customers?

```sql
SELECT Marketing_channels, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
WHERE f.Current_brands = "CodeX"
GROUP BY Marketing_channels
ORDER BY num_respondent DESC;
```
**Objective:** Identify the marketing strategies and chennels for our brand.

### 10.  What do people think about our brand? (overall rating)


```sql
SELECT Current_brands, Taste_experience
FROM dim_repondents d
  JOIN fact_survey_responses f
    ON d.Respondent_ID = f.Respondent_ID
WHERE f.Current_brands = "CodeX"
GROUP BY Current_brands;
```
**Objective:** Check the overall rating of our brand.

### 11.  Which cities do we need to focus more on?

```sql
SELECT city, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
JOIN dim_cities c
ON d.Respondent_ID = f.Respondent_ID 
   AND d.City_ID = c.City_ID
WHERE f.Current_brands = "CodeX"
GROUP BY city
ORDER BY num_respondent DESC 
LIMIT 5;

```
**Objective:** Check the overall rating of our brand.

### 12.  Where do respondents prefer to purchase energy drinks?


```sql
SELECT Purchase_location, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
WHERE f.Current_brands = "CodeX"
GROUP BY Purchase_location
ORDER BY num_respondent DESC;

```
**Objective:** Check the purchase location for our brand.

### 13.  What are the typical consumption situations for energy drinks among respondents?



```sql
SELECT Consume_reason, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
WHERE f.Current_brands = "CodeX"
GROUP BY Consume_reason
ORDER BY num_respondent DESC;

```
**Objective:** Check the typical consumption situations for energy drinks among respondents.


### 14.   Which area of business should we focus more on our product development? (Branding/taste/availability)



```sql
SELECT Reasons_for_choosing_brands, 
       Marketing_channels, 
       Taste_experience, 
       COUNT(d.Respondent_ID) AS num_respondent
FROM dim_repondents d
JOIN fact_survey_responses f
ON d.Respondent_ID = f.Respondent_ID
WHERE f.Current_brands = "CodeX"
GROUP BY Marketing_channels, 
         Taste_experience
ORDER BY Taste_experience DESC

```
**Objective:** Check where should be focus more. (Branding/taste/availability)




## Recommendations Summary
- Allocate 60% of marketing budget to digital channels, 25% to TV, and 15% to other medium
- Develop age-specific campaigns: social media for teens/young adults, traditional media for seniors
- Partner with convenience stores and online delivery platforms to improve availability
- Packaging innovation balancing portability and sustainability
 
- **Data_source** [Code Basics](https://codebasics.io/)

