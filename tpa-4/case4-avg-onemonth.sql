SELECT * FROM transaksi ORDER BY total_trs DESC;

-- Menampilkan rata rata transaksi dalam 1 bulan terakhir:
SELECT AVG(total_trs) as rata2_trs FROM transaksi;