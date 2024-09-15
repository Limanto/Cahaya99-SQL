-- insert constraint into supplier table
ALTER TABLE supplier
ADD CONSTRAINT chk_supplier_id CHECK (idsupplier LIKE 'SUP%');

-- insert constraint into MaterialGoods table
ALTER TABLE MaterialGoods
ADD CONSTRAINT chk_material_id CHECK (idmaterial LIKE 'MGD%');

-- insert constraint into PurchaseGoods table
ALTER TABLE PurchaseGoods
ADD CONSTRAINT chk_metodepembayaran CHECK (metodepembayaran IN ('Transfer Bank', 'QRIS', 'Cash'));

ALTER TABLE PurchaseGoods
ADD CONSTRAINT chk_purchase_id CHECK (idpembelian LIKE 'PGD%');

-- insert constraint into Category table
ALTER TABLE Category
ADD CONSTRAINT chk_namakategori CHECK (namakategori IN ('Sayuran', 'Daging', 'Telur', 'Nasi', 'Minuman'));

ALTER TABLE Category
ADD CONSTRAINT chk_category_id CHECK (idkategori LIKE 'CAT%');

-- insert constraint into FinishedGoods table
ALTER TABLE FinishedGoods
ADD CONSTRAINT chk_fgd_id CHECK (REGEXP_LIKE(idproduk, '^FGD[0-9]{7}$'));

-- insert constraint into Customer table
ALTER TABLE Customer
ADD CONSTRAINT chk_cus_id CHECK (REGEXP_LIKE(idcustomer, '^CUS[0-9]{7}$'))

ALTER TABLE Customer
ADD CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female'));

-- insert constraint into Payment table
ALTER TABLE Payment
ADD CONSTRAINT chk_pay_id CHECK (REGEXP_LIKE(idpayment, '^PAY[0-9]{7}$'))

-- insert constraint into Qris table
ALTER TABLE Qris
ADD CONSTRAINT chk_qris_kode CHECK (REGEXP_LIKE(kodeqris, '^QRIS[0-9]{8}$'))

-- insert constraint into Karyawan table

ALTER TABLE Karyawan
ADD CONSTRAINT chk_krw_id CHECK (REGEXP_LIKE(idkaryawan, '^KRW[0-9]{7}$'));

ALTER TABLE Karyawan
ADD CONSTRAINT chk_email_format CHECK (REGEXP_LIKE(emailkaryawan, '^[A-Za-z0-9._%+-]+@gmail.com$'));

-- insert constraint into JobDescription table
ALTER TABLE JobDescription
ADD CONSTRAINT chk_job_id CHECK (REGEXP_LIKE(idjob, '^JDC[0-9]{7}$'));

-- insert constraint into SalesTransaction table
ALTER TABLE SalesTransaction
ADD CONSTRAINT chk_sales_id CHECK (REGEXP_LIKE(idpenjualan, '^STR[0-9]{7}$'));
