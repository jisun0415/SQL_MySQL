/***
�� �� �� , 
���Ű� ���� ���� �����غ�����
���Ű� �ִ� ���� �����غ�����

�� ������ ����, �Ǹ� �����Ͱ� ���� ������ ��. 
***/

--���ž��� �� ����Ʈ
SELECT DISTINCT A.MEM_NO
--SELECT *
	FROM MEM A
	LEFT
	JOIN SALES B
	ON A.MEM_NO=B.CUSTOMERID
WHERE B.CUSTOMERID IS NULL

--���� �ִ� �� ����Ʈ
SELECT DISTINCT A.MEM_NO
--SELECT *
FROM MEM A
LEFT
JOIN SALES B
ON A.MEM_NO=B.CUSTOMERID
WHERE B.CUSTOMERID IS NOT NULL

/***
�� �� �� ���Ű� ����/�ִ� ���� �� ����
***/

--���Ű� ���� ���� ��
SELECT COUNT(DISTINCT A.MEM_NO) AS NONPUR_CNT --COUNT��� �Լ��� �����Լ��̴�.
	FROM MEM A
	LEFT
	JOIN SALES B
	ON A.MEM_NO=B.CUSTOMERID
WHERE B.CUSTOMERID IS NULL

--���Ű� �ִ� ���� ��
SELECT COUNT(DISTINCT A.MEM_NO) AS NONPUR_CNT --COUNT��� �Լ��� �����Լ��̴�.
	FROM MEM A
	LEFT
	JOIN SALES B
	ON A.MEM_NO=B.CUSTOMERID
WHERE B.CUSTOMERID IS NOT NULL

/***
���� ��, ���Ű� ����/�ִ� ���� ���� ������ �����ϱ�
***/
SELECT COUNT(DISTINCT A.MEM_NO) AS TOT_CNT
	, COUNT(DISTINCT CASE WHEN B.CUSTOMERID IS NULL THEN A.MEM_NO END) AS NONPUR_CNT --�����ǹ����� �ڿ� ELSE NULL�� �����Ǿ�����
	, COUNT(DISTINCT CASE WHEN B.CUSTOMERID IS NOT NULL THEN A.MEM_NO END) AS PUR_CNT

	, COUNT(DISTINCT CASE WHEN B.CUSTOMERID IS NULL THEN A.MEM_NO END)*1.00/COUNT(DISTINCT A.MEM_NO)*1.00 AS NONPUR_POR --���� ���ϱ� ����
	, COUNT(DISTINCT CASE WHEN B.CUSTOMERID IS NOT NULL THEN A.MEM_NO END)*1.00/COUNT(DISTINCT A.MEM_NO)*1.00 AS PUR_POR --1.00���� �����°��� �߿���.
	FROM MEM A
	LEFT 
	JOIN SALES B
	ON A.MEM_NO=B.CUSTOMERID

/***
������ ���� �̷¿���(�ִ�/����) ���а��� �߰��غ�����
***/
SELECT MEM_NO --MEM_NO���� �����Ұǵ� �Ʒ��� ����
		, CASE WHEN B.CUSTOMERID IS NOT NULL THEN '�����̷�_0' --B����CUSTOMERID�� NULL�� �ƴϸ� �����̷�_0ǥ��
			   WHEN B.CUSTOMERID IS NULL THEN '�����̷�_X' END AS PUR_GB --B���� CUSTOMERID�� NULL�̸� �����̷� Xǥ��

		FROM MEM A --MEM���̺�κ��� �׸��� �� �̸��� A��
		LEFT --�ٵ� ���� �� ���ϰž� �� ���� �Ʒ��ڵ�
		JOIN (
				SELECT DISTINCT CUSTOMERID --SALES���̺��� CUSTOMERID�� �ߺ��ȵǰ� ����
				FROM SALES
		) B --���̸���  B���� �Ұ���
		ON A.MEM_NO=B.CUSTOMERID --A�� MEM_NO�� B�� CUSTOMERID�� ������><



