/*프로그래머스 SQL 고득점 Kit - Group By*/
--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
/*Lv.3*/

/*Lv.4*/

--저자 별 카테고리 별 매출액 집계하기
SELECT a.author_id, a.author_name, b.category, sum(b.price*s.sales) TOTAL_SALES
from BOOK b, AUTHOR a, BOOK_SALES s
where b.AUTHOR_ID=a.AUTHOR_ID and b.BOOK_ID=s.BOOK_ID
and to_char(s.sales_date,'yyyy-mm') = '2022-01'
group by a.author_id, a.author_name, b.category
order by a.author_id, b.category desc

--식품분류별 가장 비싼 식품의 정보 조회하기
select t.category CATEGORY, t.MAX_PRICE MAX_PRICE, f.product_name PRODUCT_NAME
from FOOD_PRODUCT f,
(SELECT category, max(price) as MAX_PRICE
from FOOD_PRODUCT
where category in ('과자', '국', '김치','식용유')
group by category) t
where f.price = t.MAX_PRICE and f.category = t.category
order by MAX_PRICE desc

--년, 월, 성별 별 상품 구매 회원 수 구하기
SELECT extract(year from o.sales_date) year, extract(month from o.sales_date) month, u.gender gender, count(distinct u.user_id) users
from USER_INFO u, ONLINE_SALE o
where u.USER_ID = o.USER_ID and u.gender is not null
group by extract(year from o.sales_date), extract(month from o.sales_date), u.gender
order by year, month, gender

--입양 시각 구하기(2)
with hours as( --시간 테이블 만들어놓기
    select level-1 as hours --0~23시
    from dual
    connect by level<=24
)
select h.hours hour, count(a.animal_id) count
from hours h
left join animal_outs a on to_char(a.datetime,'hh24') = h.hours
group by h.hours
order by hour






