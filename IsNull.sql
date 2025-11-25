/*프로그래머스 SQL 고득점 Kit - Is Null*/
--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


/*Lv.1*/

--경기도에 위치한 식품창고 목록 출력하기
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, NVL(FREEZER_YN,'N') as FREEZER_YN 
from FOOD_WAREHOUSE 
where address like '경기도%'
order by WAREHOUSE_ID

--이름이 없는 동물의 아이디
SELECT ANIMAL_ID
from ANIMAL_INS 
where name is null
order by ANIMAL_ID

--이름이 있는 동물의 아이디
SELECT ANIMAL_ID
from ANIMAL_INS 
where name is not null
order by ANIMAL_ID


/*Lv.2*/