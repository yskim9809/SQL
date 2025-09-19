/*���α׷��ӽ� SQL ����� Kit - Group By*/

/*Lv.3*/

/*Lv.4*/

--���� �� ī�װ� �� ����� �����ϱ�
SELECT a.author_id, a.author_name, b.category, sum(b.price*s.sales) TOTAL_SALES
from BOOK b, AUTHOR a, BOOK_SALES s
where b.AUTHOR_ID=a.AUTHOR_ID and b.BOOK_ID=s.BOOK_ID
and to_char(s.sales_date,'yyyy-mm') = '2022-01'
group by a.author_id, a.author_name, b.category
order by a.author_id, b.category desc

--��ǰ�з��� ���� ��� ��ǰ�� ���� ��ȸ�ϱ�
select t.category CATEGORY, t.MAX_PRICE MAX_PRICE, f.product_name PRODUCT_NAME
from FOOD_PRODUCT f,
(SELECT category, max(price) as MAX_PRICE
from FOOD_PRODUCT
where category in ('����', '��', '��ġ','�Ŀ���')
group by category) t
where f.price = t.MAX_PRICE and f.category = t.category
order by MAX_PRICE desc