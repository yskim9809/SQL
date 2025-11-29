/*프로그래머스 SQL 고득점 Kit - String, Date*/
--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


/*Lv.1*/

--자동차 대여 기록에서 장기/단기 대여 구분하기
SELECT history_id,CAR_ID,to_char(START_DATE,'yyyy-mm-dd') START_DATE,
to_char(END_DATE,'yyyy-mm-dd') END_DATE,
case
    when (end_date-start_date+1) >=30 then '장기 대여'
    else '단기 대여'
end as RENT_TYPE
from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
where to_char(start_date,'yyyy-mm') = '2022-09'
order by history_id desc

--특정 옵션이 포함된 자동차 리스트 구하기
SELECT car_id, car_type, daily_fee, options
from car_rental_company_car
where options like '%네비게이션%'
order by car_id desc;