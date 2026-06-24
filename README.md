<div align="center">
  <img width="320px" src="https://github.com/user-attachments/assets/05217b68-3011-4015-9b99-b3f402206ab5" />
</div>

## Background
West Spokane Union is a small, hypothetical bank with 3,992 current customers located across all 50 U.S. States, as well as an additional 1,008 who have churned. To gain further insight into its customer base and identify points of friction, an analysis of their customer data was performed. A customer churn Tableau dashboard was created from this point-in-time dataset to uncover key customer insights and patterns to drive actionable recommendations for reducing West Spokane Union's future churn.



## Project Components

* The customer data was loaded into **Google BigQuery** using **Fivetran**.

* The **SQL** queries used to examine the data and perform quality checks can be found [here](https://github.com/blakefishman/Customer_Churn_Tableau/blob/main/SQL%20Queries/Initial%20Data%20Checks%20and%20Examining.sql).

* The **Tableau** customer churn interactive dashboard can be found [here](https://public.tableau.com/views/CustomerChurnDashboard_17823371555900/Overview).



## Executive Summary
t

<div align="center">
  <img width="750px" src="https://github.com/user-attachments/assets/44120481-4417-4cf2-b0b9-9ccf127b35a8" />
</div>
The full interactive dashboard can be found [here](https://public.tableau.com/views/CustomerChurnDashboard_17823371555900/Overview).




## Insights Deep-Dive

* **Geographic concentration is one of the largest churn predictors**. U.S. states such as Georgia (29.8%), Minnesota (27.8%), and Oklahoma (26.3%) are the top churning states and have averages that are significantly above the average overall churn rate of 20.2%. Conversely, Washington (12.4%) and New York (14.2%) churn significantly below the average.
   * Georgia, as an example and as the highest-churn U.S. state, exhibits several notable exceptions. Customers with four products churn at a rate of 50.0%, which is more than 20% higher than customers with one to three products.
   * Inactive customers who have filed at least one complaint also churn at 50%, which is at least 20% higher than other customer segments within the 'Activity x Complaint' breakdown, suggesting a heightened sensitivity to service or quality issues for these customers.
   * Gender differences are also stark in Georgia, where men churn at a significantly higher rate than women (34.2% vs. 26.1%).
   * Gender differences are also pronounced in Georgia, where men churn at a significantly higher rate than women (34.2% vs. 26.1%). Additionally, customers aged 25–35 churn at nearly twice the national average for that cohort (41.9% vs. 19.6%).

   * Conversely, in Washington as the lowest-churning state, customer churn among men is exceptionally low, at just 4.7%, while women exhibit a more typical churn rate of 17.1%.
   * Churned customers maintained significantly higher average account balances than those who were retained ($101,946 vs. $71,619), suggesting the churn here could also be driven by customers seeking higher-yield alternatives. However, customer complaints still appear to be a strong indicator of churn: Washington customers who filed at least one complaint were still much more likely to leave than those who did not.


* **Customers under 25 churn the highest of any age group** at 25.7%, and may lack anchors for long-term loyalty. Conversely, customers 65 and over exhibit the lowest churn rate at 16.7%, but naturally form the smallest customer age cohort as well. These trends appear to reflect natural lifecycle differences: younger customers are still exploring options and forming loyalty ties, while older customers have loyalties that are deeply established.

* **Customers who are both active and have filed at least one complaint churn the most** at 22.0%. Issues in quality or service may be enough to trigger churning, and their active engagement provides the means to exit.

* Gold and Diamond card holders churn at only 19.0%, while Silver and Platinum holders reach 21.3%. Though high turnover on the lowest tier can be expected, **the mid-tier churn spike for Platinum is anomalous and may signal distinct dissatisfaction with specific Platinum benefits**.
    * 'Inactive' Platinum customers who have complained at least once drive churn rates at 29.8% compared to 20.4% for 'Inactive' Platinum customers with no complaints. While 'Active' platinum customers remain stable regardless of complaint history, 'Inactive' non-complainants only churn at 20.4%.

* Overall customer trends show no significant differences in balance, tenure, credit score, or number of products between churned and retained customers.


<div align="center">
  <img width="750px" src="https://github.com/user-attachments/assets/b4fb7195-2411-4dd8-9fcb-6a08d67541d4" />
</div>
The full interactive dashboard can be found here.



## Recommendations

* **Investigate state-level churn rates between the highest and lowest churning states to identify operational differences**. Targeted retention campaigns should be deployed for the highest churning states immediately, and successful strategies from low-churn states should be identified and adapted for high-churn states as well.

* **Consider an onboarding program for customers under 25 due to their high churn**. Tailor the program to fit the habits and lifestyles of this 18-24 group, while also including staples like milestone rewards, in an effort to build loyalty during the critical first few months.

* **Improve customer service experience to reduce complaint-driven churn**, such as implementing SLA-backed complaint resolutions to rebuild trust with pre-existing complaint customers and bolster customer confidence overall. Deploy new tracking systems & infrastructure if needed to properly identify customer service flaws.

* **Analyze the structure of the Platinum tier's features** to determine if its true value is only actualized when a customer reaches four products , due to Platinum customers with four products churning at only 16.4%, compared to 25.3% for those with three. Customers may need four products to extract the full scope of the Platinum tier’s features. With three or less products, the tier's perceived utility may not outweigh the extra cost.
