-- Inserting values into Supplier table
INSERT INTO Supplier VALUES ('SUP0124001', 'Agen Beras Grosir Sin Global Jaya', '085281673150', 'Jl. Sultan Agung Tirtayasa RT.05 RW.13 kel. Kunciran Indah, kec. Pinang, Tangerang City, Banten 15144');
INSERT INTO Supplier VALUES ('SUP0224002', 'Gun Farm', '083891782551', 'Pasar Delapan Alam Sutera Blok LB 6565 Serpong, Tangerang');
INSERT INTO Supplier VALUES ('SUP0224003', 'Gunawan Telur', '081586036115', 'Pasar Delapan Alam Sutera Kios KS6 Alam Sutera, Tangerang');
INSERT INTO Supplier VALUES ('SUP0324004', 'Sentral Ayam', '081381123477', 'Jl. Mission Drive Ruko Solvang Square No. 53, Kelapa Dua, Tangerang Regency, Banten 15810');
INSERT INTO Supplier VALUES ('SUP0324005', 'Ud Adira Simbolon Family', '081234524425', 'Pasar Delapan Alam Sutera Alam Sutera, Tangerang');

-- Inserting values into MaterialGoods table
INSERT INTO MaterialGoods VALUES ('MGD0324001', 'Ayam', 100.00, 'kg', 10.00);
INSERT INTO MaterialGoods VALUES ('MGD0324002', 'Sosis', 5.00, 'kg', 1.00);
INSERT INTO MaterialGoods VALUES ('MGD0324003', 'Telor', 10.00, 'kg', 2.00);
INSERT INTO MaterialGoods VALUES ('MGD0324004', 'Kangkung', 50.00, 'ikat', 10.00);
INSERT INTO MaterialGoods VALUES ('MGD0324005', 'Garam', 2.00, 'kg', 0.50);
INSERT INTO MaterialGoods VALUES ('MGD0324006', 'Beras', 10.00, 'kg', 1.00);

--Inserting values into PurchaseGoods table
INSERT INTO PurchaseGoods VALUES ('PGD0324001', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'Transfer Bank', 'SUP0124001');
INSERT INTO PurchaseGoods VALUES ('PGD0324002', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'QRIS', 'SUP0224002');
INSERT INTO PurchaseGoods VALUES ('PGD0324003', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Cash', 'SUP0224003');
INSERT INTO PurchaseGoods VALUES ('PGD0324004', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Transfer Bank', 'SUP0324004');
INSERT INTO PurchaseGoods VALUES ('PGD0324005', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'Transfer Bank', 'SUP0324004');

-- Inserting values into PurchaseDetail table
INSERT INTO PurchaseDetail VALUES ('MGD0324001', 'PGD0324001', 1);
INSERT INTO PurchaseDetail VALUES ('MGD0324002', 'PGD0324002', 2);
INSERT INTO PurchaseDetail VALUES ('MGD0324003', 'PGD0324003', 1);
INSERT INTO PurchaseDetail VALUES ('MGD0324004', 'PGD0324004', 4);
INSERT INTO PurchaseDetail VALUES ('MGD0324005', 'PGD0324005', 3);

-- Inserting values into Category table
INSERT INTO Category VALUES ('9', 'Sayuran', 'Olahan berbahan dasar sayur');
INSERT INTO Category VALUES ('CAT0324002', 'Daging', 'Olahan berbahan dasar daging');
INSERT INTO Category VALUES ('CAT0324003', 'Telur', 'Segala macam olahan makanan berbahan dasar telur');
INSERT INTO Category VALUES ('CAT0324004', 'Nasi', 'Segala macam makanan yang berbahan dasar nasi');
INSERT INTO Category VALUES ('CAT0324005', 'Minuman', 'Minuman yang dapat dibeli dan diminum');

-- Inserting values into FinishedGoods table
INSERT INTO FinishedGoods VALUES ('FGD0324001', 'salted egg chicken', 5000, 'CAT0324002');
INSERT INTO FinishedGoods VALUES ('FGD0324002', 'fried sausage', 5000, 'CAT0324002');
INSERT INTO FinishedGoods VALUES ('FGD0324003', 'omelette', 3000, 'CAT0324003');
INSERT INTO FinishedGoods VALUES ('FGD0324004', 'sauteed kale', 3000, 'CAT0324001');
INSERT INTO FinishedGoods VALUES ('FGD0324005', 'sunny side up egg', 3000, 'CAT0324003');
INSERT INTO FinishedGoods VALUES ('FGD0324006', 'rice', 3000, 'CAT0324004');

-- Inserting values into Conversion table
INSERT INTO Conversion VALUES ('FGD0324001', 'MGD0324001', 1.00, 8.00);
INSERT INTO Conversion VALUES ('FGD0324002', 'MGD0324002', 1.00, 70.00);
INSERT INTO Conversion VALUES ('FGD0324003', 'MGD0324003', 1.00, 18.00);
INSERT INTO Conversion VALUES ('FGD0324004', 'MGD0324004', 1.00, 16.00);
INSERT INTO Conversion VALUES ('FGD0324005', 'MGD0324003', 1.00, 35.00);
INSERT INTO Conversion VALUES ('FGD0324006', 'MGD0324006', 1.00, 9.00);

-- Inserting values into Customer table
INSERT INTO Customer VALUES ('CUS0324001', 'Steven', '081345573890', 'Male', 'Jln. Agung Utara 19 No. 27');
INSERT INTO Customer VALUES ('CUS0324002', 'Caryn', '081377778889', 'Female', 'Jln. Agung Selatan 25 No. 37');
INSERT INTO Customer VALUES ('CUS0324003', 'Kevin', '081344467380', 'Male', 'Jln. Agung Barat 12 No. 22');
INSERT INTO Customer VALUES ('CUS0324004', 'Devin', '085273840756', 'Male', 'Jln. Agung Pusat 11 No. 20');
INSERT INTO Customer VALUES ('CUS0324005', 'Bayu', '082178391048', 'Male', 'Jln. Agung Timur 67 No. 33');

-- Inserting values into Payment table
INSERT INTO Payment VALUES ('PAY0324001', 20000);
INSERT INTO Payment VALUES ('PAY0324002', 25000);
INSERT INTO Payment VALUES ('PAY0324003', 5000);
INSERT INTO Payment VALUES ('PAY0324004', 20000);
INSERT INTO Payment VALUES ('PAY0324005', 30000);

-- Inserting values into Qris table
INSERT INTO Qris VALUES ('PAY0324001', 'QRIS02984823', 'BARCODE304965');
INSERT INTO Qris VALUES ('PAY0324003', 'QRIS02456741', 'BARCODE604928');

-- Inserting values into Cash table
INSERT INTO Cash VALUES ('PAY0324002', 30000.00, 5000.00);
INSERT INTO Cash VALUES ('PAY0324004', 50000.00, 30000.00);
INSERT INTO Cash VALUES ('PAY0324005', 50000.00, 20000.00);

-- Inserting values into Karyawan table
INSERT INTO Karyawan VALUES ('KRW0324002', 'Nani', '082722311712', 'nani@gmail.com', 'KRW0324002', NULL);
INSERT INTO Karyawan VALUES ('KRW0324003', 'Siti', '082722111412', 'siti@gmail.com', 'KRW0324003', NULL);
INSERT INTO Karyawan VALUES ('KRW0324001', 'Rendy', '082722131712', 'rendy@gmail.com', 'KRW0324001', NULL);

-- Inserting values into JobDescription table
INSERT INTO JobDescription VALUES ('JDC0324001', 'Chef', 3000000.00, 'KRW0324003');
INSERT INTO JobDescription VALUES ('JDC0324002', 'Pelayan', 2500000.00, 'KRW0324001');
INSERT INTO JobDescription VALUES ('JDC0324003', 'Kasir', 2500000.00, 'KRW0324002');

-- Updating Karyawan table to set jobdescription_idjob
UPDATE Karyawan SET jobdescription_idjob = 'JDC0324001' WHERE idkaryawan = 'KRW0324003';
UPDATE Karyawan SET jobdescription_idjob = 'JDC0324002' WHERE idkaryawan = 'KRW0324001';
UPDATE Karyawan SET jobdescription_idjob = 'JDC0324003' WHERE idkaryawan = 'KRW0324002';

-- Inserting values into SalesTransaction table
INSERT INTO SalesTransaction VALUES ('STR0324001', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Cash', 'KRW0324002', 'CUS0324001', 'PAY0324001');
INSERT INTO SalesTransaction VALUES ('STR0324002', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Transfer bank', 'KRW0324002', 'CUS0324002', 'PAY0324002');
INSERT INTO SalesTransaction VALUES ('STR0324003', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'QRIS', 'KRW0324002', 'CUS0324003', 'PAY0324003');
INSERT INTO SalesTransaction VALUES ('STR0324004', TO_DATE('2024-03-23', 'YYYY-MM-DD'), 'Transfer bank', 'KRW0324002', 'CUS0324004', 'PAY0324004');
INSERT INTO SalesTransaction VALUES ('STR0324005', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'QRIS', 'KRW0324002', 'CUS0324005', 'PAY0324005');


-- Inserting values into SalesDetail table
INSERT INTO SalesDetail VALUES ('STR0324001', 'FGD0324001', 1);
INSERT INTO SalesDetail VALUES ('STR0324002', 'FGD0324002', 2);
INSERT INTO SalesDetail VALUES ('STR0324003', 'FGD0324003', 1);
INSERT INTO SalesDetail VALUES ('STR0324004', 'FGD0324004', 4);
INSERT INTO SalesDetail VALUES ('STR0324005', 'FGD0324005', 3);
