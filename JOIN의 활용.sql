/***
특정제품을 20101201~20101210 기간 내에 구매한 고객들의 고객 정보만 추출해보세요
멤버테이블이라고 하는 고객 정보에 특정 기간에 구매한 고객(거래 일자)를 옆에 붙여볼건데
붙였을 때 값이 있으며 구매 한 고객 null 값이면 구매하지 않은 고객
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
	ON A.MEM_NO=B.CUSTOMERID --두개 붙여주는 조건에 대한 구문
WHERE B.CUSTOMERID IS NOT NULL

/***
특정제품을 20101201-12101210 내에 구매하지 않은 고객들의 정보만 추출하세요
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
WHERE절에 서브쿼리를 쓰면 특정 조건에 대해서만 나오지만 
JOIN 절에 서브쿼리를 쓰면 특정 조건 이외의 것도 나오기 때문에
WHERE절에 서브쿼리를 쓰는것보다 JOIN 절에 서브쿼리를 써서 활용하는 것을 더 추천!
***/
