  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/

 SELECT markalar.marka_id, markalar.marka_adi, 
 siparisler.siparis_adedi, 
 siparisler.siparis_tarihi
 FROM markalar
 INNER JOIN  siparisler
 ON markalar.marka_id = siparisler.marka_id;