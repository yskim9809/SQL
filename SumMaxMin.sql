/*프로그래머스 SQL 고득점 Kit - Sum, Max, Min*/
--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


/*Lv.1*/

--가장 비싼 상품 구하기
SELECT max(price) as MAX_PRICE
from PRODUCT

--최댓값 구하기
SELECT max(datetime)
from ANIMAL_INS