/*프로그래머스 SQL 고득점 Kit - Sum, Max, Min*/
--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


/*Lv.1*/

--가장 비싼 상품 구하기
SELECT max(price) as MAX_PRICE
from PRODUCT

--최댓값 구하기
SELECT max(datetime)
from ANIMAL_INS

--잡은 물고기 중 가장 큰 물고기의 길이 구하기
# select concat(length,'cm') as MAX_LENGTH
# from FISH_INFO 
# where length = (select max(length) from fish_info)

select concat(max(length), 'cm') as MAX_LENGTH
from fish_info

/*Lv.2*/

--가격이 제일 비싼 식품의 정보 출력하기
-- SELECT *
-- from (select * from FOOD_PRODUCT order by price desc)
-- where rownum =1

select * 
from FOOD_PRODUCT 
where price = (select max(price) from FOOD_PRODUCT )

--최솟값 구하기
SELECT min(datetime)
from animal_ins;

--동물 수 구하기
SELECT count(*)
from ANIMAL_INS

--중복 제거하기
SELECT count(distinct name)
from ANIMAL_INS