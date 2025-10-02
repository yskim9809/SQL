/*���α׷��ӽ� SQL ����� Kit - Select*/
--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

/*Lv.1*/

--Python ������ ã��
select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPER_INFOS 
where 'Python' in (SKILL_1, SKILL_2, SKILL_3)
order by ID

--��ì�� ���� �� ���ϱ�
select count(*) FISH_COUNT
from FISH_INFO 
where length<=10 or length is null

--���� ū ����� 10���� ���ϱ�
select ID, LENGTH
from FISH_INFO 
order by LENGTH desc, ID asc
where rownum>=10
--||fetch first 10 rows only ����Ŭ
--mysql���� limit 10


--Ư�� ������ ������ ����� ã��
select count(*) as count
from ECOLI_DATA 
where (GENOTYPE &1 <> 0 or GENOTYPE &4 <> 0) and (GENOTYPE &2 =0) --1,3����,2������

/*Lv.2*/

--���׷��̵� �� ������ ���ϱ�
select t.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE t,
(select ITEM_ID
from ITEM_INFO 
where RARITY like 'RARE') i, ITEM_INFO  ii
where i.ITEM_ID = t.PARENT_ITEM_ID and t.ITEM_ID = ii.ITEM_ID
order by t.ITEM_ID desc
