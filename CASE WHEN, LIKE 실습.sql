/***
고객의 지역정보나 가맹점의 지역 정보에 대한 분류가 필요할 때 아래와 같이 활용됌.
예를 들어서 카드결제가 일어났을 때 어떤 가맹점에서 어떤 결제가 이루어졌는지 정보가 쌓일 때
분류해서 관리가 가능
 ***/

SELECT MEM_NO, ADDR,
	CASE WHEN ADDR LIKE '서울%' THEN '서울특별시' --LIKE 를 쓰면 특정문자를 포함하는 애를 쓴다는 의미
		 WHEN ADDR LIKE '경기%' THEN '경기도'
		 WHEN ADDR LIKE '강원%' THEN '강원도'
		 WHEN ADDR LIKE '경상북도%'  OR ADDR LIKE '경북%' THEN '경상북도'
		 WHEN ADDR LIKE '경상남도%'  OR ADDR LIKE '경남%' THEN '경상남도'
		 WHEN ADDR LIKE '충청북도%'  OR ADDR LIKE '충북%' THEN '충청북도'
		 WHEN ADDR LIKE '충청남도%'  OR ADDR LIKE '충남%' THEN '충청남도'
		 WHEN ADDR LIKE '전라북도%'  OR ADDR LIKE '전북%' THEN '전라북도'
		 WHEN ADDR LIKE '전라남도%'  OR ADDR LIKE '전남%' THEN '전라남도'
		 WHEN ADDR LIKE '광주%' THEN '광주광역시'
		 WHEN ADDR LIKE '대구%' THEN '대구광역시'
		 WHEN ADDR LIKE '대전%' THEN '대전광역시'
		 WHEN ADDR LIKE '부산%' THEN '부산광역시'
		 WHEN ADDR LIKE '세종%' THEN '세종특별자치시'
		 WHEN ADDR LIKE '울산%' THEN '울산광역시'
		 WHEN ADDR LIKE '인천%' THEN '인천광역시'
		 WHEN ADDR LIKE '제주%' THEN '제주특별자치도'
		 ELSE '지역구분없음' END AS REG_GB
         FROM MEM

/***
위와 같은 것을 추출하지만 LEFT함수와 CHARINDEX함수를 활용해서 해보기
***/

--LEFT 함수 예시
SELECT LEFT('ABCD',3) --ABCD에서 왼쪽부터 3개를 가져와라! 결과 : ABC

--CHARINDEX 예시
SELECT CHARINDEX('B','ABCD') --문자에 대한 순서를 찾아주는 함수! ABCD에서 B의 위치를 찾아주세요 결과 : 2
FROM MEM

SELECT MEM_NO,ADDR,
		LEFT(ADDR, CHARINDEX(' ',ADDR)-1) AS REG_GB -- CHARINDEX를 통해서 맨 처음 지역 정보가 끝나는 위치를 불러오고 ADDR에서 그 위치까지 저장
		FROM MEMRHR

