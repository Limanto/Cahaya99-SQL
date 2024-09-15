--Days With More than Average Transaction
CREATE VIEW Vw_OutlierAnalysis AS
SELECT 
	tanggalpenjualan,
	COUNT(idpenjualan) AS JumlahTransaksi
FROM salestransaction
GROUP BY tanggalpenjualan
HAVING COUNT(idpenjualan) > (SELECT AVG(JumlahTransaksi)
							FROM (SELECT COUNT(idpenjualan) AS JumlahTransaksi
								FROM salestransaction
								GROUP BY tanggalpenjualan) AS Subquery)
--Sum of Sales Last Quarter
CREATE VIEW Vw_LastQuarterSales AS
SELECT 
	YEAR(tanggalpenjualan) AS SalesYear,
    DATEPART(QUARTER, tanggalpenjualan) AS SalesQuarter,
	SUM(CONVERT(INTEGER,nominalpayment)) AS TotalSales
FROM salestransaction st 
JOIN payment p ON st.payment_idpayment = p.idpayment
WHERE tanggalpenjualan >= DATEADD(QUARTER, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0))
	AND tanggalpenjualan < DATEADD(QUARTER, 0, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0))
GROUP BY YEAR(tanggalpenjualan), DATEPART(QUARTER, tanggalpenjualan)

--Count Transaction per Day
CREATE VIEW Vw_DailyTransaction AS
SELECT 
	tanggalpenjualan,
	COUNT(idpenjualan) AS JumlahTransaksi
FROM salestransaction
GROUP BY tanggalpenjualan

--Supplier "Ayam" & "Sosis"
CREATE VIEW Vw_SupplierAyamNSosis AS
SELECT 
	namaproduk,
	namasupplier,
	nomorsupplier,
	alamatsupplier
FROM materialgoods mg
JOIN purchasedetail pd ON mg.idmaterial = pd.mgd_idmaterial
JOIN purchasegoods pg ON pd.pgd_idpembelian = pg.idpembelian
JOIN supplier s ON pg.sup_idsupplier = s.idsupplier
WHERE namaproduk IN ('Ayam','Sosis')

--Customer With the Most Order
CREATE VIEW Vw_MostRoyalCustomer AS
SELECT 
	alamatcustomer,
	COUNT(idpenjualan) AS [Total Transaksi]
FROM customer c
JOIN salestransaction st ON c.idcustomer = st.cus_idcustomer
GROUP BY alamatcustomer
HAVING COUNT(idpenjualan) = (SELECT MAX(TotalTransaksi)
							FROM (SELECT COUNT(idpenjualan) AS TotalTransaksi
							FROM salestransaction 
							GROUP BY cus_idcustomer) AS SUBQUERY)

--Top 5 Most Order Product
CREATE VIEW Vw_WinnersProduct AS
SELECT TOP 5 
	namaproduk,
	COUNT(str_idpenjualan) AS TotalOrder
FROM finishedgoods fg
JOIN salesdetail sd ON fg.idproduk = sd.fgd_idproduk
GROUP BY namaproduk
ORDER BY TotalOrder DESC
