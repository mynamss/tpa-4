SELECT * FROM transaksi ORDER BY FK_id_brg DESC;

-- Menampilkan 3 barang paling sering dibeli oleh pembeli:
SELECT barang.nama_brg, COUNT(FK_id_brg) as frekuensi_beli FROM transaksi
INNER JOIN barang ON transaksi.FK_id_brg = barang.id_brg
GROUP BY barang.nama_brg ORDER BY frekuensi_beli DESC LIMIT 3;