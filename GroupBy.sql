/*프로그래머스 SQL 고득점 Kit - Group By*/

/*Lv.3*/

/*Lv.4*/

--저자 별 카테고리 별 매출액 집계하기
SELECT a.author_id, a.author_name, b.category, sum(b.price*s.sales) TOTAL_SALES
from BOOK b, AUTHOR a, BOOK_SALES s
where b.AUTHOR_ID=a.AUTHOR_ID and b.BOOK_ID=s.BOOK_ID
and to_char(s.sales_date,'yyyy-mm') = '2022-01'
group by a.author_id, a.author_name, b.category
order by a.author_id, b.category desc