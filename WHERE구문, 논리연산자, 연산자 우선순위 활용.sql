/***
����� 'VIP'�� ���鸸 �����غ�����
***/

SELECT *
	FROM MEM 
	WHERE GRADE='VIP'--Ư�� ���͸� �� �� WHERE�� ���

/***
����� 'VIP'�̸鼭 ������ ����
***/

SELECT *
FROM MEM
WHERE GRADE='VIP' AND GD='M'

/***
������ '20~25��'Ȥ�� '50~55��'�̸鼭, 
������ '����'�� ���鸸 �����غ�����
***/
-- �߸� ���� ����

SELECT *, YEAR(GETDATE())-YEAR(BIRTH_DT)+1 AS AGE
	FROM MEM
	WHERE YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '20' AND '25'
		OR YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '50' AND '55'
		AND GD='F'


SELECT *, YEAR(GETDATE())-YEAR(BIRTH_DT)+1 AS AGE
FROM MEM
WHERE (YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '20' AND '25'
		OR YEAR(GETDATE())-YEAR(BIRTH_DT)+1 BETWEEN '50' AND '55')
		AND GD='F'


