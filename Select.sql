/*���α׷��ӽ� SQL ����� Kit - Select*/
--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

/*Lv.2*/

--���׷��̵� �� ������ ���ϱ�
select t.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE t,
(select ITEM_ID
from ITEM_INFO 
where RARITY like 'RARE') i, ITEM_INFO  ii
where i.ITEM_ID = t.PARENT_ITEM_ID and t.ITEM_ID = ii.ITEM_ID
order by t.ITEM_ID desc
