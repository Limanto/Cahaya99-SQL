CREATE TABLE cash (
    idpayment      CHAR(10) NOT NULL,
    jumlahtunai    NUMBER(10, 2) NOT NULL,
    kembaliantunai NUMBER(10, 2) NOT NULL
);

ALTER TABLE cash ADD CONSTRAINT cash_pk PRIMARY KEY ( idpayment );

CREATE TABLE category (
    idkategori   CHAR(10) NOT NULL,
    namakategori VARCHAR2(20) NOT NULL,
    deskripsi    VARCHAR2(50) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT categoryv1_pk PRIMARY KEY ( idkategori );

CREATE TABLE conversion (
    fgd_idproduk   CHAR(10) NOT NULL,
    mgd_idmaterial CHAR(10) NOT NULL,
    jumlahmaterial NUMBER(10, 2) NOT NULL,
    jumlahproduk   NUMBER(10, 2) NOT NULL
);

ALTER TABLE conversion ADD CONSTRAINT relation_2_pk PRIMARY KEY ( fgd_idproduk, mgd_idmaterial );

CREATE TABLE customer (
    idcustomer     CHAR(10) NOT NULL,
    nama           VARCHAR2(20),
    nohp           VARCHAR2(12),
    gender         CHAR(10),
    alamatcustomer VARCHAR2(50)
);

ALTER TABLE customer ADD CONSTRAINT customerv1_pk PRIMARY KEY ( idcustomer );

CREATE TABLE finishedgoods (
    idproduk       CHAR(10) NOT NULL,
    namaproduk     VARCHAR2(255) NOT NULL,
    hargaproduk    INTEGER NOT NULL,
    ctr_idkategori CHAR(10) NOT NULL
);

ALTER TABLE finishedgoods ADD CONSTRAINT finishinggoods_pk PRIMARY KEY ( idproduk );

CREATE TABLE jobdescription (
    idjob          VARCHAR2(10) NOT NULL,
    jabatan        VARCHAR2(20) NOT NULL,
    gaji           NUMBER(10, 2) NOT NULL,
    krw_idkaryawan CHAR(10) NOT NULL
);

CREATE UNIQUE INDEX jobdescription__idxv1 ON
    jobdescription (
        krw_idkaryawan
    ASC );

ALTER TABLE jobdescription ADD CONSTRAINT jobdescription_pk PRIMARY KEY ( idjob );

CREATE TABLE karyawan (
    idkaryawan           CHAR(10) NOT NULL,
    namakaryawan         VARCHAR2(20) NOT NULL,
    nohp                 VARCHAR2(12) NOT NULL,
    emailkaryawan        VARCHAR2(50) NOT NULL,
    krw_idkaryawan       CHAR(10),
    jobdescription_idjob VARCHAR2(10)
);

CREATE UNIQUE INDEX karyawan__idx ON
    karyawan (
        jobdescription_idjob
    ASC );

ALTER TABLE karyawan ADD CONSTRAINT karyawan_pk PRIMARY KEY ( idkaryawan );

CREATE TABLE materialgoods (
    idmaterial  CHAR(10) NOT NULL,
    namaproduk  VARCHAR2(255) NOT NULL,
    jumlahstock NUMBER(10, 2) NOT NULL,
    satuan      VARCHAR2(50) NOT NULL,
    stokminimal NUMBER(10, 2) NOT NULL
);

ALTER TABLE materialgoods ADD CONSTRAINT mgoods_pk PRIMARY KEY ( idmaterial );

CREATE TABLE payment (
    idpayment      CHAR(10) NOT NULL,
    nominalpayment NUMBER(10, 2) NOT NULL
);

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( idpayment );

CREATE TABLE purchasedetail (
    mgd_idmaterial  CHAR(10) NOT NULL,
    pgd_idpembelian CHAR(10) NOT NULL,
    quantity        INTEGER NOT NULL
);

ALTER TABLE purchasedetail ADD CONSTRAINT pdetail_pk PRIMARY KEY ( mgd_idmaterial,
                                                                   pgd_idpembelian );

CREATE TABLE purchasegoods (
    idpembelian      CHAR(10) NOT NULL,
    tanggalpembelian DATE NOT NULL,
    metodepembayaran VARCHAR2(50) NOT NULL,
    sup_idsupplier   CHAR(10) NOT NULL
);

ALTER TABLE purchasegoods ADD CONSTRAINT purchasegoods_pk PRIMARY KEY ( idpembelian );

CREATE TABLE qris (
    idpayment CHAR(10) NOT NULL,
    kodeqris  VARCHAR2(12) NOT NULL,
    barcode   VARCHAR2(50) NOT NULL
);

ALTER TABLE qris ADD CONSTRAINT qris_pk PRIMARY KEY ( idpayment );

CREATE TABLE salesdetail (
    str_idpenjualan CHAR(10) NOT NULL,
    fgd_idproduk    CHAR(10) NOT NULL,
    quantity        INTEGER NOT NULL
);

ALTER TABLE salesdetail ADD CONSTRAINT relation_3_pk PRIMARY KEY ( str_idpenjualan,
                                                                   fgd_idproduk );

CREATE TABLE salestransaction (
    idpenjualan       CHAR(10) NOT NULL,
    tanggalpenjualan  DATE NOT NULL,
    metodepembayaran  VARCHAR2(50) NOT NULL,
    krw_idkaryawan    CHAR(10) NOT NULL,
    cus_idcustomer    CHAR(10) NOT NULL,
    payment_idpayment CHAR(10) NOT NULL
);

ALTER TABLE salestransaction ADD CONSTRAINT salestransaction_pk PRIMARY KEY ( idpenjualan );

CREATE TABLE supplier (
    idsupplier     CHAR(10) NOT NULL,
    namasupplier   VARCHAR2(255) NOT NULL,
    nomorsupplier  VARCHAR2(20) NOT NULL,
    alamatsupplier VARCHAR2(255) NOT NULL
);

ALTER TABLE supplier ADD CONSTRAINT supplier_pk PRIMARY KEY ( idsupplier );

ALTER TABLE cash
    ADD CONSTRAINT cash_payment_fk FOREIGN KEY ( idpayment )
        REFERENCES payment ( idpayment );

ALTER TABLE finishedgoods
    ADD CONSTRAINT finishedgoods_category_fk FOREIGN KEY ( ctr_idkategori )
        REFERENCES category ( idkategori );

ALTER TABLE jobdescription
    ADD CONSTRAINT jobdescription_karyawan_fk FOREIGN KEY ( krw_idkaryawan )
        REFERENCES karyawan ( idkaryawan );

ALTER TABLE karyawan
    ADD CONSTRAINT karyawan_jobdescription_fk FOREIGN KEY ( jobdescription_idjob )
        REFERENCES jobdescription ( idjob );

ALTER TABLE karyawan
    ADD CONSTRAINT karyawan_karyawan_fk FOREIGN KEY ( krw_idkaryawan )
        REFERENCES karyawan ( idkaryawan );

ALTER TABLE purchasedetail
    ADD CONSTRAINT pdetail_mgoods_fk FOREIGN KEY ( mgd_idmaterial )
        REFERENCES materialgoods ( idmaterial );

ALTER TABLE purchasedetail
    ADD CONSTRAINT pdetail_pgoods_fk FOREIGN KEY ( pgd_idpembelian )
        REFERENCES purchasegoods ( idpembelian );

ALTER TABLE purchasegoods
    ADD CONSTRAINT purchasegoods_supplier_fk FOREIGN KEY ( sup_idsupplier )
        REFERENCES supplier ( idsupplier );

ALTER TABLE qris
    ADD CONSTRAINT qris_payment_fk FOREIGN KEY ( idpayment )
        REFERENCES payment ( idpayment );

ALTER TABLE conversion
    ADD CONSTRAINT relation_2_finishinggoods_fk FOREIGN KEY ( fgd_idproduk )
        REFERENCES finishedgoods ( idproduk );

ALTER TABLE conversion
    ADD CONSTRAINT relation_2_materialgoods_fk FOREIGN KEY ( mgd_idmaterial )
        REFERENCES materialgoods ( idmaterial );

ALTER TABLE salesdetail
    ADD CONSTRAINT relation_3_finishinggoods_fk FOREIGN KEY ( fgd_idproduk )
        REFERENCES finishedgoods ( idproduk );

ALTER TABLE salesdetail
    ADD CONSTRAINT relation_3_transaction_fk FOREIGN KEY ( str_idpenjualan )
        REFERENCES salestransaction ( idpenjualan );

ALTER TABLE salestransaction
    ADD CONSTRAINT salestransaction_customer_fk FOREIGN KEY ( cus_idcustomer )
        REFERENCES customer ( idcustomer );

ALTER TABLE salestransaction
    ADD CONSTRAINT salestransaction_karyawan_fk FOREIGN KEY ( krw_idkaryawan )
        REFERENCES karyawan ( idkaryawan );
