-- create table pembeli:
CREATE TABLE pembeli (
id_pembeli INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_pembeli VARCHAR(100),
jk CHAR(2),
no_telp VARCHAR(14),
alamat VARCHAR(250)
);
-- create table penjual:
CREATE TABLE penjual (
id_penjual INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_toko VARCHAR(100),
no_telp VARCHAR(14),
alamat VARCHAR(250)
);
-- create table kategori:
CREATE TABLE kategori (
id_kategori INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_kategori VARCHAR(100)
);
-- create table barang:
CREATE TABLE barang (
id_brg INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_brg VARCHAR(250),
jumlah_brg INT,
harga_satuan INT,
FK_id_kategori INT,
FOREIGN KEY (FK_id_kategori) REFERENCES kategori(id_kategori),
FK_id_penjual INT,
FOREIGN KEY (FK_id_penjual) REFERENCES penjual(id_penjual)
);
-- create table transaksi:
CREATE TABLE transaksi (
id_trs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tanggal_trs DATE,
jumlah_beli INT,
total_trs INT,
FK_id_brg INT,
FOREIGN KEY (FK_id_brg) REFERENCES barang(id_brg),
FK_id_pembeli INT,
FOREIGN KEY (FK_id_pembeli) REFERENCES pembeli(id_pembeli)
);
-- add rows to pembeli:
INSERT INTO pembeli (nama_pembeli,jk,no_telp,alamat) 
VALUES 
("Dani", "lk", "081234567899", "Kaliwungu,Kendal"), 
("Zaki", "lk", "085127373434", "Banaran,Semarang"),
("Lia", "pr", "089576895479", "Mbae,Kudus"),
("Maul", "lk", "087684893456", "Kayen,Pati"),
("Sari", "pr", "081456794459", "Gembong,Pati"),
("Fikri", "lk", "081347568743", "Sayung,Demak"),
("Mei", "pr", "089128950546", "Prupuk,Tegal"),
("Sinta", "pr", "083547689560", "Tanah Abang,Jakarta Pusat"),
("Izah", "pr",  "087467325540", "Mersi,Banyumas"),
("Nita", "pr", "085398419345", "Sleman,Yogyakarta");
-- show all from pembeli:
SELECT * FROM pembeli;
-- add rows to kategori:
INSERT INTO kategori (nama_kategori) 
VALUES ("Pakaian"), ("Kesehatan"), 
("Makanan"), ("Minuman"), 
("Komputer & Aksesoris"), ("Dapur"), 
("Mainan"), ("Elektronik"), 
("Olahraga"), ("Buku"), 
("Kamera"), ("Souvenir");
-- show all from kategori:
SELECT * FROM kategori;
-- add rows to penjual:
INSERT INTO penjual(nama_toko, no_telp, alamat)
VALUES
("Pusat HP", "085923502237", "Banyumas"),
("Raja RAM", "086309978872", "Jakarta Pusat"),
("Best Outfit", "08715669609", "Bandung"),
("Baca Lagi", "087281062352", "Jakarta Selatan"),
("Khas Bali", "086548961413", "Denpasar"),
("Mister Sehat", "082042329394", "Jakarta Barat"),
("Yunita Snack", "087231826248", "Cianjur"),
("Pisces", "083265925806", "Jakarta Utara"),
("PlayBlock", "081914369280", "Batam"),
("NostalgiaMerch", "088767569792", "Surakarta"),
("Gramedia", "083144903362", "Semarang");
-- show all from penjual:
SELECT * FROM penjual;
-- add rows to barang:
INSERT INTO barang (nama_brg, jumlah_brg, harga_satuan, FK_id_kategori, FK_id_penjual)
VALUES
("RAM 16GB DDR4", 5, 400000, 5, 2),
("Kitab Fiqih", 3, 80000, 10, 11),
("Keripik kaca", 4, 15000, 3, 7),
("Kaos polos", 6, 35000, 1, 3),
("Rubik 9x9", 8, 20000, 7, 9),
("Setrika", 7, 300000, 8, 8),
("Tripod kamera", 6, 30000, 11, 8),
("Parcel bunga", 12, 50000, 12, 10),
("Susu Bubuk Kuta", 4, 20000, 4, 5),
("Vitamicin", 3, 6000, 2, 6),
("Obat gemuk", 2, 36000, 2, 6),
("Piring makan", 6, 5000, 6, 4),
("HP Sumsang V3", 4, 1500000, 8, 1),
("Raket Bulutangkis", 3, 180000, 9, 9);
-- show all from barang:
SELECT * FROM barang;
SELECT * FROM barang WHERE harga_satuan > 100000;
SELECT nama_brg, jumlah_brg FROM barang ORDER BY jumlah_brg DESC;
-- change tanggal_trs data types from transaksi:
ALTER TABLE transaksi MODIFY COLUMN tanggal_trs DATETIME;
-- show datatypes column from table transaksi:
SHOW FIELDS FROM transaksi;
-- add rows to transaksi:
INSERT INTO transaksi (tanggal_trs, jumlah_beli, total_trs, FK_id_brg, FK_id_pembeli)
VALUES
('2022-11-12 14:08:53', 2, 70000, 4, 3),
('2022-11-08 13:00:15', 1, 80000, 2, 10),
('2022-11-10 20:39:47', 1, 300000, 6, 8),
('2022-11-11 00:01:01', 2, 3000000, 13, 6),
('2022-11-13 09:37:46', 4, 200000, 8, 2),
('2022-11-12 08:42:07', 3, 15000, 12, 4),
('2022-11-12 05:34:45', 1, 6000, 10, 5),
('2022-11-13 15:34:12', 1, 400000, 1, 1), 
('2022-11-11 00:00:00', 2, 3000000, 13, 7),
('2022-11-09 12:45:00', 3, 60000, 5, 9);
-- show all from transaksi:
SELECT * FROM transaksi;
-- inner join beetwen barang and pembeli from transaksi:
SELECT transaksi.tanggal_trs, transaksi.jumlah_beli, barang.nama_brg, pembeli.nama_pembeli
FROM transaksi
INNER JOIN barang ON transaksi.FK_id_brg = barang.id_brg
INNER JOIN pembeli ON transaksi.FK_id_pembeli = pembeli.id_pembeli;
-- show all from barang where harga_satuan between 3000 and 300000, :
SELECT * FROM barang 
WHERE harga_satuan BETWEEN 3000 AND 300000;

SELECT * FROM barang 
WHERE harga_satuan BETWEEN 3000 AND 300000 
ORDER BY harga_satuan DESC;

-- update/edit records from barang:
UPDATE barang
SET jumlah_brg = "10", harga_satuan = "30000"
WHERE id_brg = 11;

SELECT * FROM barang WHERE id_brg = 11; 

-- update/edit records from penjual:
SELECT * FROM penjual;
UPDATE penjual
SET nama_toko = "Elektroko"
WHERE id_penjual = 8;
SELECT * FROM penjual;

-- delete records from penjual:
DELETE FROM penjual WHERE id_penjual = 9;
SELECT * FROM barang;

DELETE FROM barang WHERE FK_id_penjual = 9;

-- Coba benerin error dimana tadinya tidak bisa menghapus records atau table: (Gagal)
ALTER TABLE barang 
ADD FOREIGN KEY (FK_id_penjual) REFERENCES penjual(id_penjual) ON DELETE CASCADE ON UPDATE CASCADE;

DROP TABLE kategori;
DROP TABLE pembeli;
-- Benerin error dimana tadinya tidak bisa menghapus records atau table: (Berhasil)
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE kategori;
DROP TABLE pembeli;

-- Hapus 1 rows dari 
-- delete database: (WARNING: DANGER OPTION)
DROP database onlineshop;

