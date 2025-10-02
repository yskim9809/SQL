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

/*Lv.2*/

--업그레이드 된 아이템 구하기
select t.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE t,
(select ITEM_ID
from ITEM_INFO 
where RARITY like 'RARE') i, ITEM_INFO  ii
where i.ITEM_ID = t.PARENT_ITEM_ID and t.ITEM_ID = ii.ITEM_ID
order by t.ITEM_ID desc
