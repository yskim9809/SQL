/*프로그래머스 SQL 고득점 Kit - Group By*/
--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

/*Lv.3*/

--자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
SELECT car_id, max(case /*어떤 기록이라도 대여중이면 대여중으로 출력*/
               when to_date('20221016','yyyymmdd') 
                between start_date and end_Date
               then '대여중'
               else '대여 가능'
               end) as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
group by car_id
order by car_id desc

--대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
SELECT extract(month from start_date) as MONTH, car_id, count(*) as RECORDS
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where to_char(start_date,'yyyy-mm-dd') between '2022-08-01' and '2022-10-31'
and car_id in( /*car_id만 제한하고있으니 바깥쿼리도 날짜 제한필요*/
    select car_id 
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY
    where extract(month from start_date) in (8,9,10)
    group by car_id
    having count(*)>=5
             )
group by extract(month from start_date),car_id
having count(*)<>0
order by month, car_id desc


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

--언어별 개발자 분류하기
SELECT grade, id, email
FROM (
    SELECT d.id,
           d.email,
           CASE
             WHEN SUM(CASE WHEN s.name = 'Python' THEN 1 ELSE 0 END) > 0
              AND SUM(CASE WHEN s.category = 'Front End' THEN 1 ELSE 0 END) > 0
                  THEN 'A'
             WHEN SUM(CASE WHEN s.name = 'C#' THEN 1 ELSE 0 END) > 0
                  THEN 'B'
             WHEN SUM(CASE WHEN s.category = 'Front End' THEN 1 ELSE 0 END) > 0
                  THEN 'C'
           END AS grade
    FROM developers d
    JOIN skillcodes s
      ON (d.skill_code & s.code) = s.code
    GROUP BY d.id, d.email
) t
WHERE grade IS NOT NULL
ORDER BY grade, id;


-- 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기
select e.EMP_NO EMP_NO, e.EMP_NAME EMP_NAME, 
(case when sum(g.score)/2>=96 then 'S'
      when sum(g.score)/2>=90 then 'A'
      when sum(g.score)/2>=80 then 'B'
      else 'C' end) as GRADE,
(case when sum(g.score)/2>=96 then e.sal*0.2
      when sum(g.score)/2>=90 then e.sal*0.15
      when sum(g.score)/2>=80 then e.sal*0.1
      else e.sal*0 end) as BONUS
from HR_EMPLOYEES e, HR_GRADE g
where e.EMP_NO = g.EMP_NO 
group by e.emp_no
order by EMP_NO



