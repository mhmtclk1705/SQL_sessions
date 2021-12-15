/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu */

    SELECT count(*)
    FROM invoices;

    SELECT count(BillingState) -- primary key olmadığı için null ları saymayabilir
    FROM invoices;

    /* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/

    SELECT count(DISTINCT Composer) AS besteci_sayisi
    from tracks;

    /*tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresini listeleyen
    sorguyu yazınız */

    SELECT name as song_name, min(Milliseconds) as duration
    from tracks;

    /*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız.*/

    select min(Grade), max(Grade)
    FROM students;


    -- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */

    SELECT sum(Total) as toplam_gelir
    FROM invoices;


    /* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
    
    SELECT round(avg(total),2) as ortalama_gelir   -- round yuvarlamak için kullanılıyor
    FROM invoices;

    /* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */

    SELECT round(AVG(Milliseconds))  --- ortalama duration aldık 
    FROM tracks;

    SELECT Name, Milliseconds   ---- sub-query yöntemiyle kullanmak daha kolay
    FROM tracks
    WHERE Milliseconds > 
    (SELECT round(AVG(Milliseconds))
    FROM tracks);

    /*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
    
    SELECT Composer, count(Name) as Song_Count
    FROM tracks
    WHERE Composer IS NOT NULL -- null olmayanları görmek istemediğimiz için bu şekilde 
                                -- where kullandık is not null bu işe yarıyor
    GROUP BY Composer;

    

    	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/

    SELECT country, count(FirstName) as count_name -- burda FirstName null olmayanları bulmak
    FROM customers                      -- için verdiğimiz bir isim customerID de kullanabiliriz
    GROUP BY Country
    ORDER BY count_name DESC;

    
    /* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/

    SELECT country, City, count(FirstName) as Number_of_Customer
    FROM customers
    GROUP BY country,City;


    /* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

    SELECT BillingCountry, round(AVG(total),2) as ort_fatura  -- round 2 hane olması için
    FROM invoices
    --WHERE InvoiceDate BETWEEN '2009-01-01' and '2011-12-31 23:59:59' -- tarih aralığı belirledik
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

 SELECT 
 fro