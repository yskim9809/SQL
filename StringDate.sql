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


/*Lv.2*/
--조건에 부합하는 중고거래 상태 조회하기
SELECT board_id, writer_id, title, price, 
case when status='SALE' then '판매중'
     when status='RESERVED' then '예약중'
     when status='DONE' then '거래완료'
end as status
from used_goods_board
where to_char(created_date,'yyyy-mm-dd')='2022-10-05'
order by board_id desc;

--자동차 평균 대여 기간 구하기
SELECT CAR_ID, to_char(round(avg(END_DATE-START_DATE+1),1),'FM999.0') AVERAGE_DURATION
from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
group by car_id
having round(avg(END_DATE-START_DATE+1),1) >=7
order by round(avg(END_DATE-START_DATE+1),1) desc, CAR_ID desc

--루시와 엘라 찾기
SELECT animal_id, name, sex_upon_intake
from animal_ins
where name in ('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty')
order by animal_id;

--이름에 el이 들어가는 동물 찾기
SELECT animal_id, name
from animal_ins
where animal_type='Dog' and lower(name) like '%el%'
order by name;

--중성화 여부 파악하기
SELECT animal_id, name, case when (sex_upon_intake like 'Intact%') then 'X'
else 'O' end as 중성화
from animal_ins
order by animal_id;

--카테고리 별 상품 개수 구하기
SELECT substr(product_code,1,2) category, count(*) products
from product
group by substr(product_code,1,2)
order by category asc;