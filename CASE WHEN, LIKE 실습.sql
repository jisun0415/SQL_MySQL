/***
���� ���������� �������� ���� ������ ���� �з��� �ʿ��� �� �Ʒ��� ���� Ȱ���.
���� �� ī������� �Ͼ�� �� � ���������� � ������ �̷�������� ������ ���� ��
�з��ؼ� ������ ����
 ***/

SELECT MEM_NO, ADDR,
	CASE WHEN ADDR LIKE '����%' THEN '����Ư����' --LIKE �� ���� Ư�����ڸ� �����ϴ� �ָ� ���ٴ� �ǹ�
		 WHEN ADDR LIKE '���%' THEN '��⵵'
		 WHEN ADDR LIKE '����%' THEN '������'
		 WHEN ADDR LIKE '���ϵ�%'  OR ADDR LIKE '���%' THEN '���ϵ�'
		 WHEN ADDR LIKE '��󳲵�%'  OR ADDR LIKE '�泲%' THEN '��󳲵�'
		 WHEN ADDR LIKE '��û�ϵ�%'  OR ADDR LIKE '���%' THEN '��û�ϵ�'
		 WHEN ADDR LIKE '��û����%'  OR ADDR LIKE '�泲%' THEN '��û����'
		 WHEN ADDR LIKE '����ϵ�%'  OR ADDR LIKE '����%' THEN '����ϵ�'
		 WHEN ADDR LIKE '���󳲵�%'  OR ADDR LIKE '����%' THEN '���󳲵�'
		 WHEN ADDR LIKE '����%' THEN '���ֱ�����'
		 WHEN ADDR LIKE '�뱸%' THEN '�뱸������'
		 WHEN ADDR LIKE '����%' THEN '����������'
		 WHEN ADDR LIKE '�λ�%' THEN '�λ걤����'
		 WHEN ADDR LIKE '����%' THEN '����Ư����ġ��'
		 WHEN ADDR LIKE '���%' THEN '��걤����'
		 WHEN ADDR LIKE '��õ%' THEN '��õ������'
		 WHEN ADDR LIKE '����%' THEN '����Ư����ġ��'
		 ELSE '�������о���' END AS REG_GB
         FROM MEM

/***
���� ���� ���� ���������� LEFT�Լ��� CHARINDEX�Լ��� Ȱ���ؼ� �غ���
***/

--LEFT �Լ� ����
SELECT LEFT('ABCD',3) --ABCD���� ���ʺ��� 3���� �����Ͷ�! ��� : ABC

--CHARINDEX ����
SELECT CHARINDEX('B','ABCD') --���ڿ� ���� ������ ã���ִ� �Լ�! ABCD���� B�� ��ġ�� ã���ּ��� ��� : 2
FROM MEM

SELECT MEM_NO,ADDR,
		LEFT(ADDR, CHARINDEX(' ',ADDR)-1) AS REG_GB -- CHARINDEX�� ���ؼ� �� ó�� ���� ������ ������ ��ġ�� �ҷ����� ADDR���� �� ��ġ���� ����
		FROM MEMRHR

