/*프로그래머스 SQL 고득점 Kit - Select*/
--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

/*Lv.1*/

--Python 개발자 찾기
select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPER_INFOS 
where 'Python' in (SKILL_1, SKILL_2, SKILL_3)
order by ID


/*Lv.2*/

--업그레이드 된 아이템 구하기
select t.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE t,
(select ITEM_ID
from ITEM_INFO 
where RARITY like 'RARE') i, ITEM_INFO  ii
where i.ITEM_ID = t.PARENT_ITEM_ID and t.ITEM_ID = ii.ITEM_ID
order by t.ITEM_ID desc
