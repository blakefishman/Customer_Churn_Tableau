-- Examining data in Google BigQuery for the first time and performing various checks for duplicates, errors, inconsistencies, ranges, etc.


-- 1) Duplicate check

SELECT
    CustomerId,
    COUNT(*) AS duplicate_id_count
FROM `ChurnCore`
GROUP BY 1
HAVING duplicate_id_count > 1
;


-- 2) Null check

SELECT
    SUM(CASE WHEN RowNumber IS NULL THEN 1 ELSE 0 END) AS null_count_row_number,
    SUM(CASE WHEN CustomerId IS NULL THEN 1 ELSE 0 END) AS null_count_customer_id,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS null_count_credit_score,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS null_count_state,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_count_gender,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_count_age,
    SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS null_count_tenure,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS null_count_balance,
    SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS null_count_num_of_products,
    SUM(CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS null_count_is_active_member,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS null_count_exited,
    SUM(CASE WHEN Complain IS NULL THEN 1 ELSE 0 END) AS null_count_complain,
    SUM(CASE WHEN `Satisfaction Score` IS NULL THEN 1 ELSE 0 END) AS null_count_satisfaction_score,
    SUM(CASE WHEN `Card Type` IS NULL THEN 1 ELSE 0 END) AS null_count_card_type,
    SUM(CASE WHEN `Point Earned` IS NULL THEN 1 ELSE 0 END) AS null_count_point_earned
FROM `ChurnCore`
;


-- 3) Empty check for strings

SELECT
    SUM(CASE WHEN State = '' THEN 1 ELSE 0 END) AS empty_count_state,
    SUM(CASE WHEN Gender = '' THEN 1 ELSE 0 END) AS empty_count_gender,
    SUM(CASE WHEN `Card Type` = '' THEN 1 ELSE 0 END) AS empty_count_card_type
FROM `ChurnCore`
;


-- 4) Check State, Gender, and Card Type for inconsistencies and typos

SELECT
    DISTINCT State,
    COUNT(State) AS count
FROM `ChurnCore`
GROUP BY 1
ORDER BY 1
;

SELECT
    DISTINCT Gender,
    COUNT(Gender) AS count
FROM `ChurnCore`
GROUP BY 1
ORDER BY 1
;

SELECT
    DISTINCT `Card Type`,
    COUNT(`Card Type`) AS count
FROM `ChurnCore`
GROUP BY 1
ORDER BY 1
;


-- 5) Check for length inconsistencies in CustomerID

SELECT
    CustomerId,
    LENGTH(SAFE_CAST(CustomerId AS string)) AS length
FROM `ChurnCore`
WHERE LENGTH(SAFE_CAST(CustomerId AS string)) != 8
;


-- 6) Examine account balance ranges for outliers

SELECT
    MIN(Balance) AS min_balance,
    MAX(Balance) AS max_balance,
    AVG(Balance) AS avg_balance,
    STDDEV(Balance) AS stddev_balance,
    VARIANCE(Balance) AS variance_balance
FROM `ChurnCore`
;


WITH balance_validation AS (
SELECT 
    CASE 
        WHEN Balance IS NULL THEN 'missing_value'
        WHEN Balance < 0 THEN 'negative_value'
        WHEN Balance = 0 THEN 'zero_value'
        WHEN Balance > 1000000 THEN 'suspiciously_high'
        ELSE 'valid'
    END AS validation_flag
FROM `ChurnCore`
)

SELECT
    validation_flag,
    COUNT(validation_flag) AS validation_flag_count
FROM balance_validation
GROUP BY 1
ORDER BY 2 DESC
;


-- 7) Check number of products per account for outliers

SELECT
    MIN(NumOfProducts) AS min_numofproducts,
    MAX(NumOfProducts) AS max_numofproducts
FROM `ChurnCore`
;


-- 8) Verify 0/1 binary for various fields (below was also performed for IsActiveMember, Exited, Complain, `Satisfaction Score`, `Card Type`, and `Point Earned` fields)

SELECT
    COUNT(HasCrCard)
FROM `ChurnCore`
WHERE HasCrCard IS NULL
    OR HasCrCard NOT IN (0, 1)
;
