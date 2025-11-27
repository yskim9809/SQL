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

--나이 정보가 없는 회원 수 구하기
SELECT count(*) USERS
from USER_INFO 
where age is null

--잡은 물고기의 평균 길이 구하기
select round(avg(IFNULL(LENGTH, 10)),2) AVERAGE_LENGTH
from FISH_INFO

/*Lv.2*/

--NULL 처리하기
SELECT ANIMAL_TYPE, NVL(NAME,'No name'), SEX_UPON_INTAKE
from ANIMAL_INS 
order by ANIMAL_ID

--ROOT 아이템 구하기
select i.ITEM_ID, i.ITEM_NAME
from ITEM_INFO i, ITEM_TREE t
where i.ITEM_ID=t.ITEM_ID and t.PARENT_ITEM_ID is null
order by i.ITEM_ID