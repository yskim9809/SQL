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


--없어진 기록 찾기
SELECT o.animal_id, o.name
from animal_ins i
right join animal_outs o
on i.animal_id=o.animal_id 
where i.animal_id is null
order by o.animal_id;


/*Lv.4*/

--그룹별 조건에 맞는 식당 목록 출력하기
SELECT p.MEMBER_NAME MEMBER_NAME, rr.REVIEW_TEXT REVIEW_TEXT, to_char(rr.REVIEW_DATE,'yyyy-mm-dd') REVIEW_DATE
from
(select m.MEMBER_ID MEMBER_ID, count(r.REVIEW_ID)
from MEMBER_PROFILE m
join REST_REVIEW r on m.MEMBER_ID =r.MEMBER_ID
group by m.MEMBER_ID
order by count(r.REVIEW_ID) desc
fetch first 1rows only) t, MEMBER_PROFILE p, REST_REVIEW rr
where t.MEMBER_ID = p.MEMBER_ID and p.MEMBER_ID = rr.MEMBER_ID
order by REVIEW_DATE , REVIEW_TEXT
