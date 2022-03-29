--테이블 정보 조회하기 : desc
--유형 : 데이터타입
--dept 부서 테이블(부서정보-부서번호,부서명,위치)
DESC dept;

--emp 사원 테이블(사원번호,사원명,직책,직속상관의 사원번호,입사일,급여,추가수당,부서번호)
DESC emp;

--급여구간(등급,최저급여,최고급여)
DESC salgrade;


--DML -> 조회(SELECT) : 가장 많이 사용
--SELECT  조회하고 싶은 열이름 나열
--FROM  조회할 테이블명
SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

--중복 데이터 제거
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
     
--ALAIS(별칭)
--AS : 생략이 가능
--"" : 공백이 들어가도 ""붙이고 실행하면 가능
SELECT
    ename           AS 사원명,
    sal             급여,
    comm            AS "추가 수당",
    sal * 12 + comm AS 연봉
FROM
    emp;

--원하는 순서로 출력 데이터를 정렬
--order by 정렬할 열이름 [정렬옵션]
--emp 테이블에서 ename,sal 조회할 때 sal의 내림차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;
    
--emp 테이블의 전체 열 조회(부서번호는 오름차순이고,급여의 내림차순)
SELECT
    deptno,
    sal
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
    
    
--특정한 조건을 기준으로 데이터 조회
--SELECT ~ FROM ~ WHERE

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
--사원번호가 7782인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
    
--부서번호가 30이고 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
    
--사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
--부서번호가 30 이거나 사원직책이 CLERK 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
    
--연산자
--산술연산자
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
    
--비교연산자(>,<,<=,>=)
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;
    
--문자도 대소비교 연산자 가능
--ENAME 'F' 이상인
SELECT
    *
FROM
    emp
WHERE
    ename > 'F';

--급여가 2500이상이고, 직업이 analyst 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

--직무가 manager,salesman,clerk인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMANS'
    OR job = 'CLERK';
    
    
--등가비교연산자(같다: =, 같지않다 : !=, <>, ^=)

--급여가 3000이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;
    
--논리부정연산자 : NOT
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

--IN 연산자 : = 의미와 같음
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

--JOB이 'MANAGER'가 아니고, 'SALESMAN'도 아니고, 'CLERK'도 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
--IN 사용해서 부서번호가 10,20번인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
    
--job이 'MANAGER' 아니고, 'SALESMAN'아니고, 'CLERK'아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
    
--BETWEEN A AND B 연산자
--ex) 급여가 2000 이상 3000 이하

--원래
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;
--간편하게
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

--급여가 2000 이상 3000 이하가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

--LIKE 연산자와 와일드 카드( _ : 어떤 값이든 상관없이 단 한 개의 문자 데이터
--                        % : 어떤 값과 길이에 상관없이 모든 문자 데이터)

--사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원 이름의 두 번째 글자가 L인 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

--사원 이름에 AM이 들어있는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--사원 이름에 AM이 들어있지 않는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT IN ( '%AM%' );


--IS NULL 연산자
--IS NOT NULL 연산자

--comm이 null인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm = NULL; --null에는 = 사용 못함

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL; 

--mgr이 null이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;


--집합 연산자
--union(합집합), minus(차집합), intersect(교집합)

--deptno=10 or deptno=20 사원 조회
--unoin(중복값 제거)
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 20;

--union all : 중복 제거 없이 그냥 합침
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10;

--minus : 차집합
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--intersect : 교집합, 공통된 속성들만 추출
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;


--[문제] 사원 이름이 S로 끝나는 사원 데이터 출력
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

--[문제] 30번 부서에서 근무하고 있는 사원 중에 직책이 
--SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서 번호 출력
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND job IN 'SALESMAN';

--[문제] 20번,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인
--사원을 다음 두 가지 방식의 SELECT 문을 사용하여 사원번호, 이름, 직책, 급여,
--부서 번호를 출력하는 SQL문 작성
--집합 연산자 사용하지 않은 방식
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;
--집합 연산자 사용한 방식 => 그리고 이기 때문에 교집합 사용
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
INTERSECT
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000;

--[문제] NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여 열 값이
--2000 이상 3000이하 범위 이외의 값을 가진 데이터만 출력하도록 SQL 작성
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000;

--[문제] 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가
--아닌 사원 이름, 사원 번호, 급여, 부서번호 출력하는 SQL문 작성
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

--[문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원
--중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보를 출력하는 SQL문 작성
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';


--오라클 함수

--대소문자 변경 : UPPER(0, LOWER(), INITCAP()
--upper() : 대문자로 변경
--lower() : 소문자로 변경
--initcap() : 앞에만 대문자로 변경
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
    
--dual : sys가 소유하는 테이블
--        임시 연산이나 함수의 결과값 확인하는 용도
--문자열 길이 : length / 문자열 바이트 수 반환 : lengthb
SELECT
    length('한글'),
    lengthb('한글'),
    length('ab'),
    lengthb('ab')
FROM
    dual;  --특정 테이블명이 딱히 필요 없을 때

SELECT
    ename,
    length(ename) --ename 의 글자 길이 확인
FROM
    emp;

--[실습] 직책 이름이 6글자 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) > 6;

SELECT
    *
FROM
    emp;

--문자열 추출 : substr(원본데이터, 시작위치, [추출길이])
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

--[문제] emp 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;


-- 문자열 데이터 안에서 특정 문자 위치 찾기 :
-- INSTR(문자열 데이터, 위치를 찾으려는 부분 문자,시작위치,시작위치에서 찾으려는 문자가 몇 번 째인지 지정)
SELECT
    instr('HELLO ORACLE!', 'L')       AS instr1,
    instr('HELLO ORACLE!', 'L', 5)    AS instr2,
    instr('HELLO ORACLE!', 'L', 2, 2) AS instr3
FROM
    dual;
      
-- 사원 이름에 S가 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0; --0 초과면 S가 들어있다는 의미니까
    
    
--특정 문자를 다른 문자로 변경 : replace(원본, 찾는 문자, 바꿀 문자)    
SELECT
    '010-1234-1234'                    AS replace_before,
    replace('010-1234-1234', '-', ' ') AS replace2,
    replace('010-1234-1234', '-')      AS replace3
FROM
    dual;
    
--문자열 연결 : concat(문자1, 문자2)
SELECT
    concat(empno, concat(' : ', ename))
FROM
    emp;

--문자열 연결 : ||
SELECT
    empno || ename
FROM
    emp;

SELECT
    empno
    || ' : '
    || ename
FROM
    emp;

--특정 문자열 제거(아무것도 안 주면 공백제거) : trim(), ltrim(), rtrim()
SELECT
    '    이것이   ',
    TRIM('    이것이   '),
    ltrim('    이것이   '),
    rtrim('    이것이   ')
FROM
    dual;
    
--숫자함수
--round() : 반올림, trunc() : 버림,
--ceil() : 지정된 숫자보다 큰 정수 중에서 가장 작은 정수
--floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
--mod() : 나머지
SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round1,
    round(1234.5678, 1)   AS round2,
    round(1234.5678, 2)   AS round3,
    round(1234.5678, - 1) AS round4,
    round(1234.5678, - 2) AS round5
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc1,
    trunc(1234.5678, 1)   AS trunc2,
    trunc(1234.5678, 2)   AS trunc3,
    trunc(1234.5678, - 1) AS trunc4,
    trunc(1234.5678, - 2) AS trunc5
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;

--날짜 함수 : 연산이 가능함
--sysdate, current_date, curren_timestamp
SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;


--add_months() : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3) --3개월 뒤 날짜 출력을 뜻함
FROM
    dual;

--입사 20주년이 되는 사원들 조회
--240개월
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

--현재 날짜를 기준으로 입사 45년 미만인 사원
SELECT
    *
FROM
    emp
WHERE
    add_months(hiredate, 540) > sysdate;

--months_between(날짜1, 날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
    
    
--next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

--형변환 함수
SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'SMITH';

desc emp;

SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'SMITH';
    
    
--TO_CHAR() : 숫자, 날짜 데이터를 문자 데이터로 변환
--TO_NUMBER() : 문자데이터를 숫자 데이터로 변환
--TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    to_char(sysdate, 'YYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM
    dual;

SELECT
    to_char(sysdate, 'MM')    AS mm,
    to_char(sysdate, 'MON')   AS mon,
    to_char(sysdate, 'MONTH') AS month,
    to_char(sysdate, 'DD')    AS dd,
    to_char(sysdate, 'DY')    AS dy,
    to_char(sysdate, 'DAY')   AS day
FROM
    dual;

SELECT
    to_char(sysdate, 'HH24:MI:SS')      AS hh24miss, --24시간제
    to_char(sysdate, 'HH24:MI:SS AM')   AS hhmiss_am,
    to_char(sysdate, 'HH24:MI:SS P.M.') AS hhmiss_pm,
    to_char(sysdate, 'HH:MI:SS')        AS hhmiss --12시간제
FROM
    dual;
    
--숫자를 문자열로 표기해도 연산이 알아서 됨
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;
        
--숫자여도 콤마같은 기호가 들어가면 에러뜸        
SELECT
    '1,300' + '1,500'
FROM
    dual;        
        
        
--9: 숫자 한 자리를 의미
SELECT
    to_number('1,300', '999,999') + to_number('1,500', '999,999')
FROM
    dual;
        
-- sal을 $숫자 로 표기해줘
SELECT
    sal,
    to_char(sal, '$999,999') sal_$
FROM
    emp;

SELECT
    TO_DATE('2022-03-22', 'YYYY-MM-DD') AS date1,
    TO_DATE('20220322', 'YYYY-MM-DD')   AS date2
FROM
    dual;
    
    
-- 1981년 6월 1일 이후에 입사한 사원 정보
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('19810601', 'YYYY-MM-DD');

-- null 처리 함수 : null은 연산 불가능, 하나라도 null이면 null 나옴
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

-- nvl(널값 열, 널인경우 사용할 값)
--comm이 null인 경우 0으로 표시해주자
--자바와 다르게 한 번 선언했을 때 유지되지 않고 계속해서 선언해줘야 함 -> (comm,0)
SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

--nvl2(널값 열, 널이 아닐 경우 사용할 값 ,널인 경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl2(comm, '0', 'X'),
    sal + nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;


--DECODE 함수와 CASE 문
--decode(대상이 될 열 혹은 데이터,
--  조건1, 조건1과 일치시 반환할 결과
--  조건1, 조건1과 일치시 반환할 결과..
--  조건1~조건n까지 만족안할 때 반환할 결과
--)
-- job_id에 따라 비율을 다르게 준 다음 연산
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, --sal 이 MANAGER라면 sal*1.1해줘
     'SALESMAN', sal * 1.05,
           'ALALYST', sal, sal * 1.03 --아무것도 아니라면sal*1.03만 해줘
           ) AS upsal
FROM
    emp;
    
--case
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ALALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 :' || comm
    END AS come_text
FROM
    emp;
    
  
--[문제] emp 테이블에서 월 평균 근무일수 21.5일
--하루급여(day_pay), 시급(time_pay)
--day_pay 소수점 셋째 자리에서 버리기
--time_pay 소수점 둘째 자리에서 반올림
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5)     AS day_pay,
    round(sal / 21.5 / 8) AS time_pay
FROM
    emp;
    
--[문제]
SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
 --nvl(comm, 'N/A') => 단순히 이렇게 하면 에러남
    nvl(to_char(comm), 'N/A')                AS comm--문자로 바꿔줘야 함 
FROM
    emp;
    
--[문제] emp 테이블의 mgr 기준으로 출력
--mgr 준재하지 않으면 0000
--mgr  75인 경우 :  5555
--mgr  76인 경우 :  6666
--mgr  77인 경우 :  7777
--mgr  78인 경우 :  8888
--그 외 원래대로 mgr 출력
SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;

--case문으로 다시    
SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;
    
    
-- 다중행 함수
-- sum(), count(), max(), min(), avg() ...

--sum()
SELECT
    SUM(comm)
FROM
    emp;
 --중복 제거 가능
SELECT
    SUM(DISTINCT comm),
    SUM(sal)
FROM
    emp;
    
--emp 테이블의 사원 수 출력
SELECT
    COUNT(comm) --null 때문에 갯수가 4개뿐
FROM
    emp;

SELECT
    COUNT(*) --count(empno) 도 가능 다 가능 
FROM
    emp;   
    
    
--부서번호가 30번인 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;

--급여의 최대값
SELECT
    MAX(sal)
FROM
    emp;

--급여의 최소값
SELECT
    MIN(sal)
FROM
    emp;
    
--부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;
--부서번호가 20번인 사원 중 가장 최근 입사일 구하기
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 30번인 사원들의 급여 평균 출력
SELECT
    round(AVG(sal))
FROM
    emp
WHERE
    deptno = 30;

--부서번호별 평균 급여 출력
SELECT
    deptno,
    AVG(sal) --00937. 00000 -  "not a single-group group function"
FROM
    emp;
--해결
--group by : 결과값을 원하는 열로 묶어 출력
SELECT
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;


--부서별, 직책별 급여 평균 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

--group by : group by  절에 포함 안되는 열을 select 절에서는 사용 불가(단, 집계함수는 가능)
SELECT
    ename,
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

-- group by ~ having : 그룹을 잡을 때 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000;

--where : 출력 대상 행을 제한
--having : 그룹화된 대상을 제한

--emp 테이블의 부서별 직책의 평균급여가 500이상인, 사원들의 부서번호, 직책,
--평균 급여를 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 500
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    AVG(sal) >= 500
GROUP BY
    deptno,
    job;

SELECT     -----------------5
    deptno,
    job,
    AVG(sal)
FROM        -----------------1
    emp
WHERE       ----------------2
    sal <= 3000
GROUP BY        --------------3
    deptno,
    job
HAVING      --------------4
    AVG(sal) >= 2000
ORDER BY        --------------6
    deptno,
    job; 
    
--[문제] 부서번호, 평균급여, 최고급여, 최저급여, 사원수 출력
-- 평균 급여 출력할 때 소수점 제외
--각 부서별로 출력
SELECT
    deptno,
    trunc(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(empno) AS cnt
FROM
    emp
GROUP BY
    deptno;

--[문제] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

--[문제] 사원들의 입사연도 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

--join
--데이터가 여러 개의 테이블에 나뉘어 저장됨
SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    dept;

--내부 조인 : 일치하는 컬럼의 기준으로 값 가져오기
--column ambiguously defined
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d --차례대로 조인할 것이다.
WHERE
    e.deptno = d.deptno; --일치하는 값끼리 묶어줘야 그에 맞는 데이터를 다른 테이블에서 가져올 수 있음

--표준 문법(inner 생략가능)
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;
    
--부서 번호가 일치하는 사원들의 정보 출력
--급여가 3000 이상자만 출력
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
                         AND sal >= 3000;


--부서번호가 일치하는 사원들의 정보 출력
--급여가 2500 이하고, 사원번호가 9999이하인 사원 출력
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal >= 2500
    AND e.empno <= 9999;

SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
                   AND e.sal >= 2500
                   AND e.empno <= 9999;
--내가 추가한 것!! 내부 조인일 때는 이렇게 세 가지 방법 다 같은 결과 나옴, outer join은 다름!!    
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.sal >= 2500
    AND e.empno <= 9999;    
 --emp, salgrade 조인 : 비등가 조인
SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    job,
    comm,
    deptno,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
    
-- 자지 자신 테이블 조인 : 셀프조인
SELECT
    *
FROM
    emp;
--매니저를 하고 있는지 안 하는지 알아보기 - 같은 테이블 두 개로 비교하기
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno; --e1의 매니저번호와 e2의 사원번호가 같게


--outer join(외부조인) : 연결 안 되는 것도 끌어서 가져오기
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;    


--[문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원 수 출력
--부서코드, 부서명, 평균급여, 최대급여, 최소급여, 사원 수 
SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;


--[문제]  모든 부서 정보와 사원 정보를 출력(부서번호의 오름차순, 사원번호의 오름차순)
-- 부서번호, 부서명, 사원번호, 사원명, 직책, 급여
SELECT
    e.deptno,
    dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e
    RIGHT JOIN dept d ON e.deptno = d.deptno
ORDER BY
    e.deptno,
    empno;


--세 개의 테이블 조인
SELECT
    e1.empno,
    e2.empno,
    e3.empno
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
    
--[문제] 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의
-- 부서번호, 사원번호 순으로 정렬, 40번 부서는 dept에만 있기에 dept 기준 조인하기
SELECT
    d.deptno,
    d.dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    e1.deptno AS deptno_1,
    s.losal,
    s.hisal,
    s.grade,
    e2.empno  AS mgr_empno,
    e2.ename  AS mgr_ename
FROM
    emp      e1
    RIGHT OUTER JOIN dept     d ON e1.deptno = d.deptno
    LEFT OUTER JOIN salgrade s ON e1.sal BETWEEN s.losal AND s.hisal
    LEFT OUTER JOIN emp      e2 ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.empno;
    

-- 서브쿼리 : 쿼리문 안에 또 다른 쿼리문 존재    
--select 조회할 열
--from 테이블명
--where 조건식(select 조회할 열 from 테이블명 where 조건식);


--JONES 사원의 급여보다 높은 급여를 받는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );
    

--ALLEN 사원의 추가 수당보다 많은 추가 수당 받는 사원 정보    
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

--'WARD' 보다 빨리 입사한 사원정보 조회 -> 빨리 입사했다는건 날짜가 더 옛날이라는 것
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );


-- 실행결과가 하나로 나오는 단일행 서브쿼리 사용 연산자
-- > , <,  <=, = , >=, <>, != , ~=

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
--사원 정보와 소속부서 정보를 조회
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );

--실행결과가 여러 개로 나오는 다중행 서브쿼리 사용 연산자
--in , any(some), all, exists

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 20, 30 );  -- deptno가 20이거나 30이거나 라는 뜻.

--in : 메인쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 true 
--각 부서별 최고 급여와 동일한 급여 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal IN            -- =은 사용할 수가 없음-> 결과가 하나로 나오지 않아서, 여기선 결과가 3개 나와서 불가능
     (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

--any(some) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도
--true 라면 true로 반환

--'in'  ==  '=any' , in을 좀 더 많이 씀
SELECT
    *
FROM
    emp
WHERE
    sal = ANY            --  =any는 in과 같음, any는 앞에 기호를 붙여줘야 함, 단독 사용 불가
     (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


--각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ANY    -- in은 같냐의 뜻이므로 사용 불가, 그냥 < 는 여러 결과값에 대해 비교할 수 없기에 사용 불가
     (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (     --어차피 하나만 만족하면 되니까 굳이 min을 안 써도 결과값은 같음
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
--all : 서브쿼리가 반환한 여러 결과 값을 메인쿼리의 조건식이 모두 만족해야함
--보통 완전 최소값/최대값 때 씀

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
--다중열 서브쿼리

--자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 출력
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


--from 절에 사용하는 서브쿼리(인라인뷰), 뽑아내서 어떤 테이블로 보여줄지
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;
    

--[문제] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진
--사원 정보, 부서정보를 출력(not in)
SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno,
    dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    );

--[문제] 직책이 SALESMAN 인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
--사원정보, 급여 등급 정보를 출력
--EMPNO, ENAME, SAL, GRADE 출력 - salgrade 조인
--max() 쓰는 형태
SELECT
    empno,
    ename,
    sal,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal   --조인 조건이 사이에 있어야 하니까
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

--max() 안 쓰는 형태
SELECT
    empno,
    ename,
    sal,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );
    

--DML(데이터 조작어 : 삽입, 삭제, 수정)
--commit(커밋) : 데이터베이스에 최종 반영, 데이터 저장 확정.
--rollback(롤백) : 지금 반영된 것을 취소

--dept 테이블의 데이터를 추출하여 dept_temp 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

-- insert(삽입)
-- insert into 테이블명(열이름....)
-- values(데이터...)

--문자, 날짜 데이터는 ' ' 사용
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
)   --필드명은 생략 가능한데 조건 : 순서대로 다 집어넣을 때
 VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    deptno,
    dname
)  --존재하는 필드에 값을 넣어주지 않으면 null로 들어감
 VALUES (
    70,
    'NETWORK'
);

--insert into dept_temp
--values(800,'NETWORK', 'BUSAN');

INSERT INTO dept_temp VALUES (
    80,
    'NETWORK',
    NULL
);     --null로 넣어주는 것도 가능

SELECT
    *
FROM
    dept_temp;

-- emp 테ㅣ블의 구조만 복사해서 새로운 테이블 생성 - 기존 데이터들을 삭제된 채로 틀만 가져오기
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1; -- 1과 1이 같지 않다 -> 구조만 가져오기

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'MANAGER',
    NULL,
    '2021-01-05',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    8888,
    '성춘향',
    'MANAGER',
    9999,
    sysdate,
    4000,
    500,
    20
);     --현재날짜 넣기
  
--emp 테이블에서 부서번호가 20번인 사원들만 emp_temp 로 삽입
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
        emp
    WHERE
        deptno = 20;
    
    
--emp 테이블에서 salgrade 테이블을 참조하여 등급이 1인 사원을
--emp_temp에 추가하고 싶을 때
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    WHERE
        s.grade = 1;


-- 수정
--update 테이블명
--set 변경할열 = 값, 변경할열 = 값..
--where 

SELECT
    *
FROM
    dept_temp;

--loc 를 seoul로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL';

--deptno = 50인 경우에 loc를 부산으로 변경
UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 50;


--emp_temp 사원 중 sal이 3000이하인 사원만 comm을 300으로 수정
UPDATE emp_temp
SET
    comm = 300
WHERE
    sal <= 3000;


--update 서브쿼리
--dept 테이블에서 부서번호가 40번인 부서명과 지역 추출
UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    );

--dname 이 operations인 부서번호 추출 : dept
--추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL'로 변경 : dept_temp
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'OPERATIONS'
    );


--삭제
--delete  [from] 
--[where]

DELETE emp_temp;    --모든 행이 삭제됨

--empno = 7369인 사원의 급여를 1500으로 변경
UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;

--JOB이 ANALYST 인 사원 삭제
DELETE FROM emp_temp
WHERE
    job = 'ANALYST';

--emp_temp에서 급여등급이 3이고, 20번 부서의 사원만 삭제
--서브쿼리 형태
DELETE FROM emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 emp_temp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
                s.grade = 3
            AND e.deptno = 20
    );

SELECT
    *
FROM
    emp;
--[실습]
--emp 테이블 이용해 exam_emp 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;
--dept 테이블 이용해 exam_dept 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;

--salgrade 테이블 이용해 exam_salgrade 생성
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;

--각 테이블 생성 완료

--[실습] exam_emp 테이블에 입력
INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7202,
    'TEST_USER2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7203,
    'TEST_USER3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7204,
    'TEST_USER4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7205,
    'TEST_USER5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7206,
    'TEST_USER6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7207,
    'TEST_USER7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7208,
    'TEST_USER8',
    'STUDENT',
    7201,
    '2016-03-09',
    1200,
    NULL,
    80
);

SELECT
    *
FROM
    exam_emp;

--[실습] exam_emp 에 속한 사원 중 50번 부서에서 근무하는 
--사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL문 작성
UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

--[실습] exam_emp 에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원의
--급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );

--[실습] exam_emp에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문 작성
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 exam_emp e
            JOIN exam_salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
            s.grade = 5
    );

SELECT
    *
FROM
    exam_emp;

UPDATE dept_tcl
SET
    loc = 'BUSAN'
WHERE
    deptno = 40;

SELECT
    *
FROM
    dept_tcl;

INSERT INTO dept_tcl VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

INSERT INTO dept_tcl VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

INSERT INTO dept_tcl VALUES (
    30,
    'SALES',
    'CHICAGO'
);

INSERT INTO dept_tcl VALUES (
    40,
    'OPERATIONS',
    'BUSAN'
);

ROLLBACK; -- 바로 이전으로 돌아감

COMMIT; -- 최종 반영 완료


--DDL (데이터 정의어)  : 객체 생성(CREATE), 변경(ALTER), 삭제(DROP)
--create table 테이블명(
--     열이름 자료형,
--     열이름 자료형,
--     열이름 자료형);

--테이블명 규칙
--문자로 시작
--같은 사용자 소유의 테이블명 중복 불가
--영문자(한글 가능), 특수문자 기능($, #, _)
--SQL 키워드(SELECT, DELETE...)는 테이블명 사용 불가
 
 --자료형
 --문자 : 
 --CHAR(n) - 고정길이, ex> name char(10); => 3자리만 써도 10자리 잡음
 --VARCHAR2(n) -- 가변길이 ex> name varchar2(10); -> 3자리 쓰면 3자리만 잡음
 --NCHAR(n) -- 고정길이(유니코드)   ex> name nchar(10);  한글/영어 모두 10개 문자
 --NVARCHAR(n) -- 가변길이(유니코드)
 
 --숫자형
 --NUMBER(숫자1, 숫자2) : 숫자1 (자릿수), 숫자2(소수점자릿수)
 -- ex)empno number(4) : 숫자로 4자리 허용
 --ex) price number(7, 2) : 숫자로 7자리 허용하는데(소수점 들어오면 2자리 허용)
 --      job number : 저장 데이터 크기에 맞게 자동 조절
 
 --날짜형
 --DATE : 년,월,일,시,분,초
 --TIMESTAMP : 년,월,일,시,분,초 + 밀리초 입력가능

--테이블 생성
--구조 설계
CREATE TABLE emp_ddl (
    empno    NUMBER(4),
    ename    VARCHAR2(10),
    job      VARCHAR2(9),
    mgr      NUMBER(4),
    hiredate DATE,
    sal      NUMBER(7, 2),
    comm     NUMBER(7, 2),
    deptno   NUMBER(2)
);

drop table emp_ddl;

--다른 테이블 구조 이용해서 생성(데이터까지 포함)
create table emp_ddl as select * from emp;

--다른 테이블 구조만 이용해서 생성
create table emp_ddl1 as select * from emp where 1<>1; --틀만 가져오기


--테이블 변경 : ALTER

select * from emp_ddl;

-- 열(컬럼) 추가 : ADD
alter table emp_ddl add hp varchar2(20) ;

--열 이름을 변경 : RENAME
alter table emp_ddl rename column hp to tel;

--열 자료형 변경 : MODIFY
alter table emp_ddl modify empno number(5);
desc emp_ddl;

--데이터가 삽입되어 있을 때는 데이터의 길이와 맞지  않는다면 변경 불가
--alter table emp_ddl modify empno number(3); --내용이 없어야 변경 가능


--열 삭제 : DROP COLUMN
alter table emp_ddl drop column tel;

--테이블명 변경 : RENAME 
rename emp_ddl to emp_rename;


--테이블 삭제 : DROP
drop table emp_rename;


--[문제] emp_hw 생성
create table emp_hw(
        id char(8),
        name varchar2(10),
        addr varchar2(50),
        nation char(4),
        email varchar2(50),
        age number(7, 2) );
        
desc emp_hw;

--[실습] BIGO 열 추가하기
alter table emp_hw add bigo varchar2(20);

--[실습] bigo 열 크기를 30으로 변경
alter table emp_hw modify bigo varchar2(30); 

--[실습] bigo 열 이름 remark로 변경
alter table emp_hw rename column bigo to remark;

--제약조건(테이블의 특정 열에 지정)
--입력, 수정, 삭제 영향을 주는 부분 => 데이터의 무결성(정확성,일관성) 유지

--1) NOT NULL : 지정한 열에 NULL을 허용하지 않음
--2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NULL 제외)
--3) PRIMARY KEY : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
--4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
--5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

--1) NOT NULL 제약조건
create table table_notnull(
        login_id varchar2(20) not null,
        login_pwd varchar2(20) not null,
        tel varchar2(20) );
        
insert into table_notnull(login_id, login_pwd, tel)
values('test_id_01', null, '010-1234-5678'); --login_pwd는 not null이므로 null값 삽입 불가능

insert into table_notnull(login_id, tel)
values('test_id_01', '010-1234-5678'); --not null 칼럼에 값 자체를 안 넣어도 null로 인식

insert into table_notnull(login_id, login_pwd)
values('test_id_01', '12345');

update table_notnull 
set login_pwd = NULL  --not null이라 null로 업데이트 불가능
where login_id = 'test_id_01' ;

--scott 에 사용된 모든 제약조건 확인
select * from user_constraints;

--제약조건명 지정
create table table_notnull2 (
        login_id varchar2(20) constraint tblnn2_lgnid_nn not null,
        login_pwd varchar2(20)constraint tblnn2_lgnpwd_nn not null,
        tel varchar2(20) );
        
--table_notnull tel 컬럼을 not null 제약조건 추가
desc table_notnull;
select * from table_notnull;
alter table table_notnull modify(tel not null) ; 
--이미 들어가있는 데이터들의 형태에 따라 영향 받음
update table_notnull
set tel = '010-1234-5678'
where login_id = 'test_id_01' ;

--제약조건 이름 변경
alter table table_notnull2 rename constraint tblnn2_lgnid_nn to tblnn2_id_nn ;

--제약조건 삭제
alter table table_notnull2 drop constraint tblnn2_id_nn;


-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NOT NULL 제외)
create table table_unique(
        login_id varchar2(20) unique,
        login_pwd varchar2(20) not null,
        tel varchar2(20)
);

insert into table_unique (login_id, login_pwd, tel)
values('test_id_01', '12345', '010-1234-5678');

--unique 제약조건 위반 => 위에서 이미 test_id_01을 넣어줬기에 고유해야 함 이 값은. 중복X
insert into table_unique (login_id, login_pwd, tel)
values('test_id_01', '54321', '010-5678-1234');

--null은 가능 => unique는 null 제외이기 때문에
insert into table_unique (login_id, login_pwd, tel)
values('null', '54321', '010-5678-1234');

--unique 제약조건 이름 지정
create table table_unique2 (
        login_id varchar2(20) constraint tblunq2_lgnid_unq unique,
        login_pwd varchar2(20) constraint tblunq2_lgnpwd_nn not null,
        tel varchar2(20)
);

-- table_unique2 의 tel에 unique 제약조건 추가
alter table table_unique2 modify(tel unique) ;  

--3) primary key : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
--not null + unique
--!!!!!!!!!!각 행을 식별하는 용도!!!!!!!!!!!!!!!!
create table table_pk(
        login_id varchar2(20) primary key,
        login_pwd varchar2(20) not null,
        tel varchar2(20) );

insert into table_pk values('test_01', 'pw01', '010-1234-5678');
--unique constraint
insert into table_pk values('test_01', 'pw01', '010-1234-5678');

create table table_pk2(
        login_id varchar2(20) primary key,
        login_pwd varchar2(20) primary key,
        tel varchar2(20) );
        
create table table_pk2(
        login_id varchar2(20) constraint tblpk2_lgnid_pk primary key,
        login_pwd varchar2(20) constraint tbltk2_lgnpwd_nn not null,
        tel varchar2(20) );

--제약조건 지정 시 다른 방식, 밑에 몰아서 주기, 같은건데 방식만 다를 뿐
create table table_con(
        col1 varchar2(20),
        col2 varchar2(20),
        primary key(col1),
        constraint tblcon_unq unique(col2) );

--4) FORIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
create table dept_fk (
        deptno number(2) constraint deptfk_deptno_pk primary key,
        dname varchar2(20),
        loc varchar2(13) );

-- dept_fk 테이블의 deptno 컬럼을 참조해서 외래키로 설정(references)
create table emp_fk (
        empno number(4) constraint empfk_empno_pk primary key,
        ename varchar2(10),
        deptno number(2) constraint empfk_deptno_fk references dept_fk(deptno)
);

--parent key not found => 부모인 dept_fk테이블의 deptno 값이 없기 때문에
insert into emp_fk(empno, ename, deptno) 
values(7899, 'hong', 20) ;

--외래키 수행 순서
--외래키가 설정되었다면 부모 테이블에 데이터를 먼저 삽입해야 함
--그 다음 자식 테이블 삽입

insert into dept_fk values(10,'DATABASE', 'SEOUL') ;

insert into emp_fk(empno, ename, deptno) 
values(7899, 'hong', 10) ; --현재 부모 deptno가 10밖에 없으니까

--자식 테이블이 deptno 값을 참조, 자식 테이블 외래키 데이터 비워야 부모쪽에서 삭제 가능
delete from dept_fk where deptno = 10;

--외래키 삭제 순서
--자식 테이블부터 먼저 데이터 삭제
--그 다음 부모 테이블에 해당하는 데이터 삭제

delete from emp_fk where deptno=10;
delete from dept_fk where deptno = 10;

-- 부모 데이터를 삭제할 때 참조하고 있는 데이터도 함께 삭제
--부모 데이터를 삭제할 때 참조하고 있는 데이터를 null로 수정
create table dept_fk2 (
        deptno number(2) constraint deptfk2_deptno_pk primary key,
        dname varchar2(20),
        loc varchar2(13) );

-- on delete cascade : 열 데이터 삭제시 참조 데이터 함께 삭제
create table emp_fk2 (
        empno number(4) constraint empfk2_empno_pk primary key,
        ename varchar2(10),
        deptno number(2) constraint empfk2_deptno_fk references dept_fk2(deptno) 
        on delete cascade 
);

insert into dept_fk2 values(10,'DATABASE', 'SEOUL') ;

insert into emp_fk2(empno, ename, deptno) 
values(7899, 'hong', 10) ;
--부모 데이터 지우면 on delete cascade로 인해 자식들거까지도 삭제됨
delete from dept_fk2 where deptno=10;

select * from emp_fk2;

--ON DELETE SET NULL : 열 데이터 삭제시 참조 데이터를 NULL로 수정
create table dept_fk3 (
        deptno number(2) constraint deptfk3_deptno_pk primary key,
        dname varchar2(20),
        loc varchar2(13) );

create table emp_fk3 (
        empno number(4) constraint empfk3_empno_pk primary key,
        ename varchar2(10),
        deptno number(2) constraint empfk3_deptno_fk references dept_fk3(deptno) 
        on delete set null 
);

insert into dept_fk3 values(10,'DATABASE', 'SEOUL') ;

insert into emp_fk3(empno, ename, deptno) 
values(7899, 'hong', 10) ;

delete from dept_fk3 where deptno=10;

select * from dept_fk3;
select * from emp_fk3;


--5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능
create table tbl_check (
        login_id varchar2(20) constraint tblck_lgnid primary key,
        login_pwd varchar2(20) constraint tblck_lgpwd_ck check (length(login_pwd) > 3),
        tel varchar2(20)
    );
-- check constraint, pwd 부분이 3보다 길이가 길어야 함
insert into tbl_check values('test_id1', '123', '010-1234-5678' );
--pwd 부분 길이가 4라 check 조건 달성하여 가능
insert into tbl_check values('test_id1', '1234', '010-1234-5678' );


-- 기본값 지정 : default
create table tbl_default (
        login_id varchar2(20) constraint tbl_lgnid primary key,
        login_pwd varchar2(20) default '1234',
        tel varchar2(20)
    );

insert into tbl_default values('test_id1', null, '010-1234-5678' );

select * from tbl_default;
--default로 설정된 컬럼에 null 말고 값을 넣지 않으면 설정한 값이 들어감
insert into tbl_default( login_id,tel ) values('test_id2',  '010-1234-5678' );


--[실습] dept_const 테이블과 emp_const 테이블 생성
--dept_const 생성
create table dept_const (
        deptno number(2) constraint deptconst_deptno_pk primary key,
        dname varchar2(14) constraint deptconst_deptno_unq unique,
        loc varchar2(13) constraint deptconst_loc_nn not null
);
--같은 것
--create table dept_const (
--        deptno number(2),
--        dname varchar2(14) ,
--        loc varchar2(13) ,
--        constraint deptcont_deptno_pk primary key(deptno),
--        constraint deptconst_deptno_unq unique(dname),
--        constraint deptconst_loc_nn not null (loc)
--);
--emp_const 생성
create table emp_const (
        empno number(2) constraint empconst_empno_pk primary key,
        ename varchar2(10) constraint empconst_ename_nn not null,
        job varchar2(9),
        tel varchar2(20) constraint empconst_tel_unq unique,
        hiredate date,
        sal number(7,2) constraint empconst_sal_chk check(sal between 1000 and 9999),
        comm number(7,2),
        deptno number(2) constraint empconst_deptno_fk references dept_const(deptno)
);
--같은 것
--create table emp_const (
--        empno number(2) ,
--        ename varchar2(10) ,
--        job varchar2(9),
--        tel varchar2(20),
--        hiredate date,
--        sal number(7,2) ,
--        comm number(7,2),
--        deptno number(2) 
--        constraint empconst_empno_pk primary key(empno),
--        constraint empconst_ename_nn not null(ename),
--         constraint empconst_tel_unq unique(job),
--         constraint empconst_sal_chk check(sal between 1000 and 9999)(sal),
--        constraint empconst_deptno_fk references dept_const(deptno)(deptno)
--);


-- 시퀀스(sequence) : 규칙에 따라 순변을 생성

--1씩 증가
create sequence  dept_seq;

create table dept_sequence as select * from dept where 1<>1;

select * from dept_sequence;

insert into dept_sequence(deptno, dname, loc)
values(dept_seq.nextval, 'DATABASE', 'SEOUL'); 

-- 가장 마지막으로 생성된 시퀀스 확인
select dept_seq.currval from dual;

drop sequence dept_seq;

create sequence dept_seq
increment by 10 --시퀀스에서 생성할 번호의 증가값
start with 10   --시퀀스에서 생성할 번호의 시작값
maxvalue 90 --시퀀스에서 생성할 번호의 최댓값
minvalue 0 -- 시퀀스에서 생성할 번호의 최솟값
nocycle  --시퀀스에서 생성한 번호가 최댓값에 도달할 경우 다시 시작할 것인가 여부
cache 2 ; -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

insert into dept_sequence(deptno, dname, loc)
values(dept_seq.nextval, 'DATABASE', 'SEOUL'); 

select * from dept_sequence;

-- 시퀀스 수정, 전에 출력된 값들 이후부터 시작, maxvalue까지 도달했다면 다시 처음부터(cycle)
alter sequence dept_seq increment by 3 maxvalue 99 cycle;


-- 뷰(view) : 가상 테이블
--                하나 이상의 테이블을 조회하는 select 문을 저장한 객체
--                편리성 - select 문의 복잡도를 완화
--                보안성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

-- 생성
create view vm_emp20 as (select empno,ename,job,deptno from emp where deptno=20);

select * from vm_emp20;

-- insert
insert into vm_emp20(empno,ename,job,deptno)
values(8000, 'TEST', 'MANAGER', 20);
select * from vm_emp20;

--view 와 원본 테이블 연결 여부
select * from emp;

--생성된 뷰들의 속성 확인하기
select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP20' ;


-- 뷰 생성시 원본 데이터 수정 불가하도록 작성
-- with read only : 뷰의 열람
create view vm_emp_read as select empno, ename,  job from emp with read only ;

select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP_READ' ;

insert into vm_emp_read (empno,ename,job)
values(8001, 'TEST', 'MANAGER' );

-- 뷰 삭제
drop view vm_emp20;


-- 인덱스 : 빠른 검색
-- 인덱스 사용 여부에 따라 Table Full Scan, Index Scan

-- scott 가 가지고 있는 인덱스 확인하기
select * from user_indexes; --pk 설정된 값들은 인덱스로 사용됨

-- 인덱스 생성
-- create index 인덱스명 on 테이블명(열이름1 asc, 열이름2 desc, .....);
create index idx_emp_sal on emp(sal);

-- index가 설정된 컬럼 조회
select * from user_ind_columns;

select * from emp where deptno=20;

-- index 삭제
drop index idx_emp_sal ;










