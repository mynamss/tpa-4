SELECT * FROM pembeli;
SELECT * FROM transaksi;
SELECT * FROM barang;

-- add records where 1 pembeli buy 3 barang:
INSERT INTO transaksi (tanggal_trs, jumlah_beli, total_trs, FK_id_brg, FK_id_pembeli)
VALUES
('2022-11-14 00:01:00', 1, 400000, 1, 1),
('2022-11-14 00:15:00', 1, 80000, 2, 1),
('2022-11-14 00:20:00', 1, 15000, 3, 1);

SELECT * FROM transaksi WHERE FK_id_pembeli = 1;

select product_id, users.name, products.name from transaction_products inner join transactions on transaction_products.transaction_id = transactions.id inner join users on transactions.user_id = users.id inner join products on transaction_products.product_id = products.id where user_id = 1;

-- SUCCESS
