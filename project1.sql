--Q1: Who is the senior most employee based on jb title?
SELECT
	*
FROM
	EMPLOYEE
ORDER BY
	LEVELS DESC
LIMIT
	1;
	
--Q2: which countries have the most invoices_line?
SELECT
	*
FROM
	INVOICE;

SELECT
	COUNT(*) AS C,
	BILLING_COUNTRY
FROM
	INVOICE
GROUP BY
	BILLING_COUNTRY
ORDER BY
	C DESC;

--Q3: what are top 3 values of total invoice?
SELECT
	*
FROM
	INVOICE
ORDER BY
	TOTAL DESC
LIMIT
	3;

--Q4:whic city has the best customer ? we would like to throw a promotional music 
--festival in the city we made the most money. wite a query that return one city that 
--has the highest sum of invioce totals. return both the city anme s sum of all inovice totals.
SELECT
	BILLING_CITY,
	SUM(TOTAL) AS TOTAL
FROM
	INVOICE
GROUP BY
	BILLING_CITY
ORDER BY
	TOTAL DESC
	limit 1;

--Q5: who is the best customer top 3? the customer who has spent the most money will  be decclared 
--the best customer write a query that return the person who has spent the most money?
SELECT
	CUSTOMER.CUSTOMER_ID,
	CUSTOMER.FIRST_NAME,
	CUSTOMER.LAST_NAME,
	SUM(INVOICE.TOTAL) AS TOTAL
FROM
	CUSTOMER
	INNER JOIN INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
GROUP BY
	CUSTOMER.CUSTOMER_ID
ORDER BY
	TOTAL DESC
	limit 3;
--Q6:write query to return the email, first name ,last name,s genre of all rock music listeners 
--return your list ordered alphabetically by email sarting with A?
SELECT DISTINCT
	CUSTOMER.FIRST_NAME,
	CUSTOMER.LAST_NAME,
	CUSTOMER.EMAIL
FROM
	CUSTOMER
	JOIN INVOICE 
	ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
	JOIN INVOICE_LINE 
	ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
	JOIN TRACK 
	ON INVOICE_LINE.TRACK_ID = TRACK.TRACK_ID
	JOIN GENRE 
	ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE
	GENRE.NAME = 'Rock'
ORDER BY
	CUSTOMER.EMAIL;

--Q7:let,s invite the artist who have written the most rock music in our dataset write a 
--query that returns the artist name and total track count of the too 10 rock banda?

SELECT
	ARTIST.ARTIST_ID,
	ARTIST.NAME,
	COUNT(ARTIST.ARTIST_ID) AS NO_OF_SONGS
FROM
	TRACK
	JOIN ALBUM ON ALBUM.ALBUM_ID = TRACK.ALBUM_ID
	JOIN ARTIST ON ALBUM.ARTIST_ID = ARTIST.ARTIST_ID
	JOIN GENRE ON GENRE.GENRE_ID = TRACK.GENRE_ID
WHERE
	GENRE.NAME = 'Rock'
GROUP BY
	ARTIST.ARTIST_ID
ORDER BY
	NO_OF_SONGS DESC
LIMIT
	10;
--Q8:Return all the track names that have a song length lrger then the avg
--song lenght lenght return the name and milliseconds for each track order by
--the song length with the longest songh listed first?
SELECT
	NAME,
	MILLISECONDS
FROM
	TRACK
WHERE
	MILLISECONDS > (
		SELECT
			AVG(MILLISECONDS) AS AVG_TRACK_LENGTH
		FROM
			TRACK
	)
GROUP BY
	NAME,
	MILLISECONDS
ORDER BY
	MILLISECONDS DESC
LIMIT
	1;
--Q9 Find how much amount spent by each customer on artist? 
--write a quwer to return customer name, artist name,total spent?
WITH
	BEST_SELLING_ARTIST AS (
		SELECT
			ARTIST.ARTIST_ID AS ARTIST_ID,
			ARTIST.NAME AS ARTIST_NAME,
			SUM(INVOICE_LINE.UNIT_PRICE * INVOICE_LINE.QUANTITY) AS TOTAL_SALES
		FROM
			INVOICE_LINE
			JOIN TRACK ON INVOICE_LINE.TRACK_ID=TRACK.TRACK_ID
			JOIN ALBUM ON ALBUM.ALBUM_ID=TRACK.ALBUM_ID
			JOIN ARTIST ON ARTIST.ARTIST_ID=ALBUM.ARTIST_ID
		GROUP BY
			1 
		ORDER BY
			3 DESC
		LIMIT
			1
	)
SELECT
	C.CUSTOMER_ID,
	C.FIRST_NAME,
	C.LAST_NAME,
	BSA.ARTIST_NAME,
	SUM(IL.UNIT_PRICE * IL.QUANTITY) AS AMOUNT_SPENT FROM INVOICE I
	JOIN CUSTOMER C ON C.CUSTOMER_ID = I.CUSTOMER_ID
	JOIN INVOICE_LINE IL ON IL.INVOICE_ID = I.INVOICE_ID
	JOIN TRACK T ON T.TRACK_ID = IL.TRACK_ID
	JOIN ALBUM ALB ON ALB.ALBUM_ID = T.ALBUM_ID
	JOIN BEST_SELLING_ARTIST BSA ON BSA.ARTIST_ID = ALB.ARTIST_ID
GROUP BY
	1,
	2,
	3,
	4
ORDER BY
	5 DESC

--Q10 we want to find out most popular music genre fron each county 
-- we determine the most popular gener as the gener with the highest amount?
WITH
	POPULAR_GENRE AS (
		SELECT
			COUNT(INVOICE_LINE.QUANTITY) AS PURCHASE,
			CUSTOMER.COUNTRY,
			GENRE.NAME,
			GENRE.GENRE_ID,
			ROW_NUMBER() OVER (
				PARTITION BY CUSTOMER.COUNTRY
				ORDER BY
					COUNT(INVOICE_LINE.QUANTITY) DESC
			) AS ROWNO
		FROM
			INVOICE_LINE
			JOIN INVOICE ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
			JOIN CUSTOMER ON CUSTOMER.CUSTOMER_ID = INVOICE.INVOICE_ID
			JOIN TRACK ON TRACK.TRACK_ID = INVOICE_LINE.TRACK_ID
			JOIN GENRE ON GENRE.GENRE_ID = TRACK.GENRE_ID
		GROUP BY
			2,
			3,
			4
		ORDER BY
			2 ASC,
			1 DESC
	)
SELECT
	*
FROM
	POPULAR_GENRE
WHERE
	ROWNO <= 1;
--Q11:write a query that determines the customer that has spent the most on
--music for each country write a query that return the country along will the
--top customer and how much they spent for country where the top amount spent 
--is shared provide all customer all customer who spent this amount ?
WITH
	CUSTOMER_WITH_COUNTY AS (
		SELECT
			CUSTOMER.CUSTOMER_ID,
			FIRST_NAME,
			LAST_NAME,
			BILLING_COUNTRY,
			SUM(TOTAL) AS TOTAL_SPANDING,ROW_NUMBER() OVER (
				PARTITION BY
					BILLING_COUNTRY
				ORDER BY
					SUM(TOTAL) DESC
			) AS ROWNO
		FROM
			INVOICE
			JOIN CUSTOMER ON INVOICE.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID
		GROUP BY
			1,
			2,
			3,
			4
		ORDER BY
			4 ASC,
			5 DESC
	)
select* from CUSTOMER_WITH_COUNTY 
where rowno=1;
--Q12: