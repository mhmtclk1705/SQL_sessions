	/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 

SELECT DISTINCT strftime('%Y',InvoiceDate)
FROM invoices;


    /* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
    
   SELECT sum(Total) as total_amount,
   InvoiceDate
   FROM invoices
   WHERE InvoiceDate BETWEEN '2009-01-01' and '2014-01-01'; 

