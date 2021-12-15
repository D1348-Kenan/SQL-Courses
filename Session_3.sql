/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorguyu yazınız*/
	
	SELECT count(*)
	FROM invoices;
	
	SELECT count(InvoiceId) AS fatura_sayısı
	FROM invoices;
	
	SELECT count(BillingState)
	FROM invoices;
	
	
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	
	SELECT count(DISTINCT Composer) AS besteci_sayısı
	FROM tracks;
	
	/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/
	
	--ÖDEV.
	
		-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	SELECT name AS song_name, min(Milliseconds) as Duration
	FROM tracks;
	
	/* students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız*/
	SELECT min(Grade), max(Grade)
	FROM students;
	
	
	-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	
	SELECT sum(total) as  toplam_kazanc
	FROM invoices;
	
	/*ÖDEV: invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların 
	toplam değerini listeyiniz */
	
	
	/* invoices  tablosunda faturaların ortalama değerini listeyiniz */
	
	SELECT round(avg(total),2)  as ortalama_gelir
	FROM invoices;
	
		/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	
	SELECT round(avg(Milliseconds),2) 
	FROM tracks;
	
	SELECT name, Milliseconds 
	FROM tracks
	WHERE Milliseconds > 393599;
	
/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT name, Milliseconds 
	FROM tracks
	WHERE Milliseconds > (	SELECT avg(Milliseconds)	
													FROM tracks);
	
	/*-----------------------------------------------------------------------------------------------
		GROUP BY Clause
	------------------------------------------------------------------------------------------------*/
	
	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	
		/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	
	SELECT country, count(FirstName) as nu_of_cust
	FROM customers
	GROUP by country
	ORDER by nu_of_cust DESC;
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
	SELECT country, City, count(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country, City;
	
 	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	
	SELECT BillingCountry, round(avg(total),2) as ort_fatura
	FROM invoices
	WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59'
	GROUP BY BillingCountry;
	
	/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
 SELECT 	markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, 
					siparisler.siparis_tarihi
 FROM markalar
 JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id;
 
 
 SELECT 	markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, 
					siparisler.siparis_tarihi
 FROM markalar
 LEFT JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id;
 
 
 
 
 
	
	
	
	
	
	