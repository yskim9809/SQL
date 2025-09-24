--test
--from on where group having select distinct order limit 순서

--통화욋수 2회 이상인 전화번호의 전화번호별 통화횟수와 연락간격의 평균 구하기
with call_diff as( --lag를 사용해 이전 통화의 끝시간을 번호별로, 통화시작시간 순으로 정렬해 출력
select call_id, caller, stime, etime, lag(etime, 1) over(partition by caller order by stime) as prev_etime
from call)

select caller, count(caller) callcount, 
round(avg(case when pre_etime is not null then stime-prev_etime end)) as avg_interval
from call_diff
group by caller
having count(*)>=2
order by caller;

--골을 넣은 선수와 어시스트한 선수의 조합이 최빈값을 갖는 조합의 골 수
with goal_count as( --먼저 조합별 카운트 세기, 그리고 가장 많은 골 수 구하기
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
join player p2 on p2.player_id = gc.assist_player --두 선수모두의 이름을 가져오기위해 두번조인
