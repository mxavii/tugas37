CREATE DATABASE perpustakaan;
use perpustakaan;

CREATE TABLE buku (id INT(11) PRIMARY KEY, judul VARCHAR(255), id_pengarang INT(11), id_penerbit INT(11), tahun_terbit INT(11), jumlah_stok INT(11), kode_rak VARCHAR(255));
CREATE TABLE pengarang (id INT(11) PRIMARY KEY, nama VARCHAR(255), alamat TEXT, telepon VARCHAR(255));
CREATE TABLE penerbit (id INT(11) PRIMARY KEY, nama VARCHAR(255), alamat TEXT, telepon VARCHAR(255));
CREATE TABLE kategori (id INT(11) PRIMARY KEY, genre VARCHAR(255));
CREATE TABLE kategori_buku (id_buku INT(11), id_kategori INT(11));
CREATE TABLE anggota(id INT(11) PRIMARY KEY, nama VARCHAR(255), jenis_kelamin VARCHAR(255), alamat VARCHAR(255), tgl_lahir DATE, id_pekerjaan INT(11), telepon VARCHAR(255), tgl_daftar TIMESTAMP, expired DATE );
CREATE TABLE pekerjaan (id INT(11) PRIMARY KEY, nama VARCHAR(255));
CREATE TABLE petugas (id INT(11) PRIMARY KEY, nama VARCHAR(255), jenis_kelamin VARCHAR(255), alamat VARCHAR(255), tgl_lahir DATE, telepon VARCHAR(255));
CREATE TABLE pinjam (id INT(11) PRIMARY KEY, id_anggota INT(11), id_daftar_pinjam INT(11), tgl_pinjam TIMESTAMP, lama INT(11), id_petugas INT(11));
CREATE TABLE daftar_pinjam (id INT(11) PRIMARY KEY, id_buku INT(11), kondisi VARCHAR(255));
CREATE TABLE pelanggaran (id INT(11) PRIMARY KEY, jenis VARCHAR(255), nominal INT(11));
CREATE TABLE kembali (id INT(11) PRIMARY KEY, id_pinjam INT(11), tgl_kembali TIMESTAMP, id_petugas INT(11));
CREATE TABLE denda (id INT(11) PRIMARY KEY, id_pelanggaran INT(11), id_kembali INT(11), nominal INT(11));
CREATE TABLE denda_item (id INT(11) PRIMARY KEY, id_denda INT(11), id_buku INT(11), nominal INT(11));
ALTER TABLE denda CHANGE id_pelanggaran id_denda_item INT(11);
ALTER TABLE denda MODIFY COLUMN id_kembali INT(11) AFTER id;
ALTER TABLE denda_item CHANGE id_denda id_pelanggaran INT(11);
ALTER TABLE denda_item MODIFY COLUMN id_buku INT(11) AFTER id;
ALTER TABLE denda DROP COLUMN nominal;
ALTER TABLE denda_item DROP COLUMN nominal;

INSERT INTO buku VALUES ('1','(Muhammad: His Life Based On The Earliest Sources','1','1','1983', '17', 'B99');
INSERT INTO buku VALUES ('2','Muhammad Al-Fatih : Penakluk Konstantinopel', '2', '2', '2012', '33', 'B102');
INSERT INTO buku VALUES ('3','Laskar Pelangi', '3', '3', '2005', '23', 'K77');
INSERT INTO buku VALUES ('4','Maryamah Karpov', '3', '3', '2008', '11', 'K77');
INSERT INTO buku VALUES ('5','Indonesia Menggugat', '4', '4', '1989', '17', 'R45');
INSERT INTO pengarang VALUES ('1','Martin Lings', 'Westerham, Inggris', '');
INSERT INTO pengarang VALUES ('2', 'Syaikh Ramzi Al-Munyawi', '', '');
INSERT INTO pengarang VALUES ('3', 'Andrea Hirata', 'Bangka Belitung, Indonesia', '');
INSERT INTO pengarang VALUES ('4', 'Ir. Sukarno', 'Indonesia', '18081933');
INSERT INTO penerbit VALUES ('1', 'Islamic Texts Society', 'Cambridge, Inggris', '+44 1223 842425');
INSERT INTO penerbit VALUES ('2', 'Pustaka Al-Kautsar', 'Jakarta, Indonesia', '021 8507590');
INSERT INTO penerbit VALUES ('3', 'Bentang Pustaka', 'Yogyakarta, Indonesia', '0274 889248');
INSERT INTO penerbit VALUES ('4', 'Departemen Penerangan RI', 'Indonesia', '');
INSERT INTO kategori VALUES ('1', 'Biografi');
INSERT INTO kategori VALUES ('2', 'Sejarah');
INSERT INTO kategori VALUES ('3', 'Roman');
INSERT INTO kategori VALUES ('4', 'Hukum dan Politik');
INSERT INTO kategori_buku VALUES ('1', '1');
INSERT INTO kategori_buku VALUES ('2', '1');
INSERT INTO kategori_buku VALUES ('2', '2');
INSERT INTO kategori_buku VALUES ('3', '3');
INSERT INTO kategori_buku VALUES ('4', '3');
INSERT INTO kategori_buku VALUES ('5', '2');
INSERT INTO kategori_buku VALUES ('5', '4');
INSERT INTO anggota VALUES ('1', 'Hanif', 'laki-laki', 'jalan besar', '19921112', '1', '081232232221', NOW(), '20200203');
INSERT INTO anggota VALUES ('2', 'Fulan', 'laki-laki', 'jalan panjang', '19930405', '2', '081234567889', NOW(), '20200203');
INSERT INTO anggota VALUES ('3', 'Fulanah', 'perempuan', 'jalan ujung', '19940605', '2', '081234544389', NOW(), '20200203');
INSERT INTO anggota VALUES ('4', 'Wong', 'laki-laki', 'jalan aspal', '19910607', '3', '081134324589', NOW(), '20200203');
INSERT INTO anggota VALUES ('5', 'Wang', 'perempuan', 'jalan sepi', '19960606', '1', '085734324589', NOW(), '20200203');
INSERT INTO pekerjaan VALUES ('1', 'wiraswasta');
INSERT INTO pekerjaan VALUES ('2', 'mahasiswa');
INSERT INTO pekerjaan VALUES ('3', 'PNS');
INSERT INTO pekerjaan VALUES ('4', 'pelajar');
INSERT INTO pekerjaan VALUES ('5', 'wirausahawan');
INSERT INTO petugas VALUES ('1', 'Andre', 'laki-laki', 'jalan gedhe', '19820607', '08113433589');
INSERT INTO petugas VALUES ('2', 'Beni', 'laki-laki', 'jalan marioborong', '19720607', '081134335443');
INSERT INTO petugas VALUES ('3', 'Caca', 'perempuan', 'jalan kenangan', '19890307', '083334335443');
INSERT INTO petugas VALUES ('4', 'Dani', 'laki-laki', 'jalan batas', '19790305', '083334335445');
INSERT INTO petugas VALUES ('5', 'Elis', 'perempuan', 'jalan jalan', '19870103', '0833343352322');
INSERT INTO pinjam VALUES ('1', '2', '1', NOW(), '17', '3');
INSERT INTO pinjam VALUES ('2', '4', '2', NOW(), '14', '3');
INSERT INTO pinjam VALUES ('3', '5', '3', NOW(), '10', '4');
INSERT INTO pinjam VALUES ('4', '3', '4', NOW(), '7', '1');
INSERT INTO pinjam VALUES ('5', '1', '5', NOW(), '7', '1');
INSERT INTO daftar_pinjam VALUES ('1', '2', 'baik');
INSERT INTO daftar_pinjam VALUES ('2', '3', 'baik');
INSERT INTO daftar_pinjam VALUES ('3', '4', 'cover belakang sobek');
INSERT INTO daftar_pinjam VALUES ('4', '5', 'baik');
INSERT INTO daftar_pinjam VALUES ('5', '1', 'baik');
INSERT INTO pelanggaran VALUES ('1', 'cover sobek', '18000');
INSERT INTO pelanggaran VALUES ('2', 'sobek', '11000');
INSERT INTO pelanggaran VALUES ('3', 'hilang', '100000');
INSERT INTO pelanggaran VALUES ('4', 'dicorat-coret', '10000');
INSERT INTO pelanggaran VALUES ('5', 'basah', '29000');
INSERT INTO pelanggaran VALUES ('6', 'terlambat 1-7 hari', '7000');
INSERT INTO pelanggaran VALUES ('7', 'terlambat 7-30 hari', '25000');
INSERT INTO pelanggaran VALUES ('8', 'terlambat di atas 30 hari', '100000');
UPDATE pelanggaran SET nominal=25000 WHERE id=7;
INSERT INTO kembali VALUES ('1', '1', NOW(), '3');
INSERT INTO kembali VALUES ('2', '3', NOW(), '3');
INSERT INTO kembali VALUES ('3', '5', NOW(), '4');
INSERT INTO kembali VALUES ('4', '2', NOW(), '4');
INSERT INTO kembali VALUES ('5', '4', NOW(), '3');
INSERT INTO denda_item VALUES ('1', '2', '6');
INSERT INTO denda_item VALUES ('2', '4', '5');
INSERT INTO denda_item VALUES ('3', '3', '7');
INSERT INTO denda_item VALUES ('4', '3', '8');
INSERT INTO denda_item VALUES ('5', '5', '2');
INSERT INTO denda VALUES ('1', '1', '1');
INSERT INTO denda VALUES ('2', '2', '2');
INSERT INTO denda VALUES ('3', '5', '5');
INSERT INTO denda VALUES ('4', '4', '3');
INSERT INTO denda VALUES ('5', '4', '4');

ALTER TABLE buku ADD FOREIGN KEY (id_pengarang) REFERENCES pengarang(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE buku ADD FOREIGN KEY (id_penerbit) REFERENCES penerbit(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE kategori_buku ADD FOREIGN KEY (id_buku) REFERENCES buku(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE kategori_buku ADD FOREIGN KEY (id_kategori) REFERENCES kategori(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE anggota ADD FOREIGN KEY (id_pekerjaan) REFERENCES pekerjaan(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE pinjam ADD FOREIGN KEY (id_anggota) REFERENCES anggota(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE pinjam ADD FOREIGN KEY (id_daftar_pinjam) REFERENCES daftar_pinjam(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE pinjam ADD FOREIGN KEY (id_petugas) REFERENCES petugas(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE daftar_pinjam ADD FOREIGN KEY (id_buku) REFERENCES buku(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE kembali ADD FOREIGN KEY (id_pinjam) REFERENCES pinjam(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE kembali ADD FOREIGN KEY (id_petugas) REFERENCES petugas(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE denda_item add FOREIGN KEY  (id_buku) REFERENCES buku(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE denda_item add FOREIGN KEY  (id_pelanggaran) REFERENCES pelanggaran(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE denda add FOREIGN KEY  (id_kembali) REFERENCES kembali(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE denda add FOREIGN KEY  (id_denda_item) REFERENCES denda_item(id) ON UPDATE CASCADE ON DELETE CASCADE;
