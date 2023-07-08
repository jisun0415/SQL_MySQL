
/***
4��-�ǽ�1
�� ID, ��� ����(GRADE), ��������(GD) �׸��� �����غ�����
***/

SELECT MEM_NO, GRADE, GD
	FROM MEM

/***
4��-�ǽ�2
�� ID, �̸� �׸��� �����غ�����
***/

SELECT *
FROM MEM

SELECT MEM_NO,LAST_NAME+FIRST_NAME AS NM
FROM MEM

SELECT MEM_NO,CONCAT(LAST_NAME,FIRST_NAME) AS NM
FROM MEM

/***
4��-�ǽ�3
�� ID, �¾ ����, �¾ ��, ������ ����, ������ �� �׸��� �����غ�����
������ (MEM_NO,DOB_YY,DOB_MM,ENTR_YY,ENTER_MM)
***/

SELECT MEM_NO
	, YEAR(BIRTH_DT) AS DOB_YY
	, MONTH(BIRTH_DT) AS DOB_MM
	, YEAR(ENTR_DT) AS ENTR_YY
	,MONTH(ENTR_DT) AS ENTR_MM
FROM MEM

/***
4��-�ǽ�4
�� ID, ���� ����
***/

SELECT MEM_NO
	, YEAR(GETDATE())-YEAR(BIRTH_DT)+1 AS AGE /*GETDATA�� ���糯¥�� �����ؿ� �� �ִ� ��*/
	FROM MEM

SELECT MEM_NO
	, DATEDIFF(YEAR,BIRTH_DT,GETDATE())+1 AS AGE /*DATEDIFF�� (�� ��������, ���⸦ ����, ���⿡��)*/
	FROM MEM

	--����
	SELECT MEM_NO
	,GETDATE()
	,YEAR(GETDATE())
	,BIRTH_DT
	,YEAR(BIRTH_DT) AS YY
	, DATEDIFF(YEAR,BIRTH_DT,GETDATE())+1 AS AGE
	FROM MEM


/***
5�� �ǽ�, �ǹ������� �츮�귣���� �ֿ��ɴ븦 �ľ��ϴµ� ����Ѵ�. 
�̺�Ʈ�� ��ȹ�� �� ������ �ܳ��ؼ� ��ȹ�� �� �ֱ� ����!
***/

--CASE WHEN ������ ������ ���������� Ȯ���Ѵ� 
SELECT MEM_NO
	,YEAR(GETDATE())-YEAR(BIRTH_DT)+1 AS AGE
	, CASE WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <10 THEN '10�� �̸�'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '10' AND '19' THEN '10��'
	       WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '20' AND '29' THEN '20��'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '30' AND '39' THEN '30��'
	       WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '40' AND '49' THEN '40��'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '50' AND '59' THEN '50��'
	ELSE 'XX'
	END AS AGEBAND
FROM MEM

SELECT MEM_NO
	,YEAR(GETDATE())-YEAR(BIRTH_DT)+1 AS AGE
	, CASE WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <10 THEN '10�� �̸�'
	       WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <20 THEN '10��'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <30 THEN '20��'
	       WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <40 THEN '30��'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 <50 THEN '40��'
		   WHEN YEAR(GETDATE())-YEAR(BIRTH_DT)+1 >= 50
				AND YEAR(GETDATE())-YEAR(BIRTH_DT)+1<=100 THEN '50���̻�'
	ELSE 'XX' --���� �ƴ� ���ǵ��� �� WHEN �������� ���ְ� �׷��� �𸣰ڴ°� ELSE�� �ۼ��ؾ� ���赵�� �پ����.
	END AS AGEBAND
FROM MEM


