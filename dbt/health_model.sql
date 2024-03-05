{{ config(materialized = 'table')}}

with health as (
    select * 
    from {{ ref('health_base')}}
),

health_full as (
    select
        health._AIRBYTE_RAW_ID,
        health.LOCATION_KEY,
        iff(health.LIFE_EXPECTANCY = null, 0, health.LIFE_EXPECTANCY) as LIFE_EXPECTANCY,
        iff(health.NURSES_PER_1000 = null, 0, health.NURSES_PER_1000) as NURSES_PER_1000,
        iff(health.PHYSICIANS_PER_1000 = null, 0, health.PHYSICIANS_PER_1000) as PHYSICIANS_PER_1000,
        iff(health.POLLUTION_MORTALITY_RATE = null, 0, health.POLLUTION_MORTALITY_RATE) as POLLUTION_MORTALITY_RATE,
        iff(health.HOSPITAL_BEDS_PER_1000 = null, 0, health.HOSPITAL_BEDS_PER_1000) as HOSPITAL_BEDS_PER_1000,
        iff(health.ADULT_FEMALE_MORTALITY_RATE = null, 0, health.ADULT_FEMALE_MORTALITY_RATE) as ADULT_FEMALE_MORTALITY_RATE,
        iff(health.ADULT_MALE_MORTALITY_RATE = null, 0, health.ADULT_MALE_MORTALITY_RATE) as ADULT_MALE_MORTALITY_RATE
    from health
)

select * from health_full
