SELECT * FROM barang ORDER BY FK_id_kategori;

-- Menampilkan kategori yang paling banyak barangnya:
SELECT kategori.nama_kategori, SUM(jumlah_brg) as banyak_brg FROM barang
INNER JOIN kategori ON barang.FK_id_kategori = kategori.id_kategori
GROUP BY kategori.nama_kategori ORDER BY banyak_brg DESC;