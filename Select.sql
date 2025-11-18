/*프로그래머스 SQL 고득점 Kit - Select*/
--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

/*Lv.1*/

--Python 개발자 찾기
select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPER_INFOS 
where 'Python' in (SKILL_1, SKILL_2, SKILL_3)
order by ID

--잔챙이 잡은 수 구하기
select count(*) FISH_COUNT
from FISH_INFO 
where length<=10 or length is null

--가장 큰 물고기 10마리 구하기
select ID, LENGTH
from FISH_INFO 
order by LENGTH desc, ID asc
where rownum>=10
--||fetch first 10 rows only 오라클
--mysql에선 limit 10


--특정 형질을 가지는 대장균 찾기
select count(*) as count
from ECOLI_DATA 
where (GENOTYPE &1 <> 0 or GENOTYPE &4 <> 0) and (GENOTYPE &2 =0) --1,3포함,2미포함

--평균 일일 대여 요금 구하기
SELECT round(avg(daily_fee)) as average_fee
from car_rental_company_car
where car_type='SUV';

--조건에 부합하는 중고거래 댓글 조회하기
SELECT A.TITLE, A.BOARD_ID, B.REPLY_ID, B.WRITER_ID, B.CONTENTS, TO_CHAR(B.CREATED_DATE,'YYYY-MM-DD') AS CREATED_DATE 
FROM USED_GOODS_BOARD A
LEFT JOIN USED_GOODS_REPLY B ON A.BOARD_ID = B.BOARD_ID
WHERE A.CREATED_DATE BETWEEN TO_DATE('20221001','YYYYMMDD') AND TO_DATE('20221031','YYYYMMDD')
AND B.REPLY_ID IS NOT NULL
ORDER BY B.CREATED_DATE ASC, A.TITLE ASC;

--인기있는 아이스크림
SELECT flavor
from first_half
order by total_order desc, shipment_id asc;

--조건에 맞는 도서 리스트 출력하기
SELECT BOOK_ID, to_char(PUBLISHED_DATE,'yyyy-mm-dd') PUBLISHED_DATE
from book
where category like '인문' and to_char(PUBLISHED_DATE,'yyyy') = 2021
order by PUBLISHED_DATE



/*Lv.2*/

--업그레이드 된 아이템 구하기
select t.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE t,
(select ITEM_ID
from ITEM_INFO 
where RARITY like 'RARE') i, ITEM_INFO  ii
where i.ITEM_ID = t.PARENT_ITEM_ID and t.ITEM_ID = ii.ITEM_ID
order by t.ITEM_ID desc

--부모의 형질을 모두 가지는 대장균 찾기


--특정 물고기를 잡은 총 수 구하기
select count(ID) FISH_COUNT
from FISH_INFO 
where FISH_TYPE in 
(select FISH_TYPE
from FISH_NAME_INFO 
where FISH_NAME in ('BASS','SNAPPER'))
