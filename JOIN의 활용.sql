/***
Ư����ǰ�� 20101201~20101210 �Ⱓ ���� ������ ������ �� ������ �����غ�����
������̺��̶�� �ϴ� �� ������ Ư�� �Ⱓ�� ������ ��(�ŷ� ����)�� ���� �ٿ����ǵ�
�ٿ��� �� ���� ������ ���� �� �� null ���̸� �������� ���� ��
***/

SELECT *
FROM MEM A
LEFT
JOIN(
	SELECT DISTINCT CUSTOMERID
	FROM SALES
	WHERE STOCKCODE IN('21730','21615')
		AND INVOICEDATE BETWEEN '2010-12-01' AND '2010-12-10'
		) B
	ON A.MEM_NO=B.CUSTOMERID --�ΰ� �ٿ��ִ� ���ǿ� ���� ����
WHERE B.CUSTOMERID IS NOT NULL

/***
Ư����ǰ�� 20101201-12101210 ���� �������� ���� ������ ������ �����ϼ���
***/

SELECT *
FROM MEM A
LEFT
JOIN (
	SELECT DISTINCT CUSTOMERID
	FROM SALES
	WHERE STOCKCODE IN('21730','21615')
		AND INVOICEDATE BETWEEN '2010-12-01' AND '2010-12-10'
		) B
	ON A.MEM_NO=B.CUSTOMERID
WHERE B.CUSTOMERID IS NULL
/***
WHERE���� ���������� ���� Ư�� ���ǿ� ���ؼ��� �������� 
JOIN ���� ���������� ���� Ư�� ���� �̿��� �͵� ������ ������
WHERE���� ���������� ���°ͺ��� JOIN ���� ���������� �Ἥ Ȱ���ϴ� ���� �� ��õ!
***/
