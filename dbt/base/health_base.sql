with health_base as (
    select
        _AIRBYTE_RAW_ID,
        LOCATION_KEY,
        NURSES_PER_1000,
        PHYSICIANS_PER_1000,
        POLLUTION_MORTALITY_RATE,
        LIFE_EXPECTANCY,
        HOSPITAL_BEDS_PER_1000,
        ADULT_FEMALE_MORTALITY_RATE,
        ADULT_MALE_MORTALITY_RATE
    from {{ source('raw_health', 'HEALTH')}}
)

select * from health_base