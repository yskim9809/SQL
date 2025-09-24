--test
--from on where group having select distinct order limit ����

--��ȭ��� 2ȸ �̻��� ��ȭ��ȣ�� ��ȭ��ȣ�� ��ȭȽ���� ���������� ��� ���ϱ�
with call_diff as( --lag�� ����� ���� ��ȭ�� ���ð��� ��ȣ����, ��ȭ���۽ð� ������ ������ ���
select call_id, caller, stime, etime, lag(etime, 1) over(partition by caller order by stime) as prev_etime
from call)

select caller, count(caller) callcount, 
round(avg(case when pre_etime is not null then stime-prev_etime end)) as avg_interval
from call_diff
group by caller
having count(*)>=2
order by caller;

--���� ���� ������ ��ý�Ʈ�� ������ ������ �ֺ��� ���� ������ �� ��
with goal_count as( --���� ���պ� ī��Ʈ ����, �׸��� ���� ���� �� �� ���ϱ�
select goal_player, assist_player, count(*) as cnt
from goal
where assist_player is not null
group by goal_player, assist_player),

max_count as (select max(cnt) as max_cnt
from goal_count)

select p.player_name, p2.player_name,gc.cnt
from goal_count gc
join max_count mc on mc.max_cnt=gc.cnt
join player p on p.player_id = gc.goal_player
join player p2 on p2.player_id = gc.assist_player --�� ��������� �̸��� ������������ �ι�����
