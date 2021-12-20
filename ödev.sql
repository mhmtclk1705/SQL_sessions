	/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 




    /* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
    
    
    
    sql assignment 2 son soru
    /*Based on the previous question, find the albums 
whose total duration is higher than 70 minutes. 
Your solution should include album title and total duration.*/

SELECT sum(tracks.Milliseconds) as total_duration,
tracks.AlbumId,
albums.Title
FROM tracks
LEFT JOIN albums on tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING total_duration > 4200000
ORDER BY total_duration DESC;

    
