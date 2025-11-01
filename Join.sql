/*프로그래머스 SQL 고득점 Kit - Join*/
--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

/*Lv.2*/

--상품 별 오프라인 매출 구하기
SELECT p.PRODUCT_CODE as PRODUCT_CODE, sum(p.PRICE*o.SALES_AMOUNT) as SALES
from PRODUCT p join OFFLINE_SALE o on p.PRODUCT_ID = o.PRODUCT_ID
group by p.PRODUCT_CODE
order by SALES desc, PRODUCT_CODE asc

/*Lv.3*/

--오랜 기간 보호한 동물(1)
SELECT i.name, i.datetime
from animal_ins i
left join animal_outs o
on i.animal_id=o.animal_id
where o.datetime is null
order by i.datetime FETCH FIRST 3 ROWS ONLY;