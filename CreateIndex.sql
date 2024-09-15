--UNIQUE
CREATE UNIQUE INDEX customer_nohp_uk ON customer (nohp);
CREATE UNIQUE INDEX karyawan_emailkaryawan_uk ON karyawan (emailkaryawan);
--NON-UNIQUE
CREATE INDEX category_namakategori_idx ON category (namakategori);
CREATE INDEX finishedgoods_namaproduk_idx ON finishedgoods (namaproduk);
CREATE INDEX salestransaction_tanggalpenjualan_idx ON salestransaction (tanggalpenjualan);
--FUNCTION-BASED
CREATE INDEX customer_nama_upper_idx ON customer (UPPER(nama));
--COMPOSITE
CREATE INDEX salestransaction_metodepembayaran_tanggalpenjualan_idx ON salestransaction (metodepembayaran, tanggalpenjualan);
