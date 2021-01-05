--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      AdventureWorksPurchasingDW.DM1
--
-- Date Created : Thursday, February 06, 2020 11:56:41
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: DimCalendar 
--

CREATE TABLE DimCalendar(
    DateKey                 NUMBER(38, 0)    NOT NULL,
    FullDateAlternateKey    DATE             NOT NULL,
    DayNumberOfWeek         NUMBER(3, 0)     NOT NULL,
    EnglishDayNameOfWeek    NVARCHAR2(10)    NOT NULL,
    DayNumberOfMonth        NUMBER(3, 0)     NOT NULL,
    DayNumberOfYear         SMALLINT         NOT NULL,
    WeekNumberOfYear        NUMBER(3, 0)     NOT NULL,
    EnglishMonthName        NVARCHAR2(10)    NOT NULL,
    MonthNumberOfYear       NUMBER(3, 0)     NOT NULL,
    CalendarQuarter         NUMBER(3, 0)     NOT NULL,
    CalendarYear            SMALLINT         NOT NULL,
    CalendarSemester        NUMBER(3, 0)     NOT NULL,
    FiscalQuarter           NUMBER(3, 0)     NOT NULL,
    FiscalYear              SMALLINT         NOT NULL,
    FiscalSemester          NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK_DimDate_DateKey PRIMARY KEY (DateKey)
)
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeKey_SK                    NUMBER(38, 0)     NOT NULL,
    SalesTerritoryKey                 NUMBER(38, 0),
    ParentEmployeeKey                 NUMBER(38, 0)     NOT NULL,
    VendorKey_SK                      NUMBER(38, 0)     NOT NULL,
    EmployeeNationalIDAlternateKey    NVARCHAR2(15),
    PersonType                        NCHAR(2)          NOT NULL,
    FirstName                         NVARCHAR2(50)     NOT NULL,
    LastName                          NVARCHAR2(50)     NOT NULL,
    MiddleName                        NVARCHAR2(50),
    NameStyle                         NUMBER(1, 0)      NOT NULL,
    Title                             NVARCHAR2(50),
    HireDate                          DATE,
    BirthDate                         DATE,
    LoginID                           NVARCHAR2(256),
    EmailAddress                      NVARCHAR2(50),
    Phone                             NVARCHAR2(25),
    MaritalStatus                     NCHAR(1),
    EmergencyContactName              NVARCHAR2(50),
    EmergencyContactPhone             NVARCHAR2(25),
    SalariedFlag                      NUMBER(1, 0),
    Gender                            NCHAR(1),
    PayFrequency                      NUMBER(3, 0),
    BaseRate                          NUMBER(19, 4),
    VacationHours                     SMALLINT,
    SickLeaveHours                    SMALLINT,
    CurrentFlag                       NUMBER(1, 0)      NOT NULL,
    DepartmentName                    NVARCHAR2(50),
    StartDate                         DATE,
    EndDate                           DATE,
    Status                            NVARCHAR2(50),
    EmployeePhoto                     BLOB,
    CONSTRAINT PK_DimEmployee_EmployeeKey PRIMARY KEY (EmployeeKey_SK)
)
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyKey                NUMBER(38, 0)    NOT NULL,
    SalesTerritoryKey           NUMBER(38, 0),
    City                        NVARCHAR2(30),
    StateProvinceCode           NVARCHAR2(3),
    StateProvinceName           NVARCHAR2(50),
    CountryRegionCode           NVARCHAR2(3),
    EnglishCountryRegionName    NVARCHAR2(50),
    PostalCode                  NVARCHAR2(15),
    CONSTRAINT PK_DimGeography_GeographyKey PRIMARY KEY (GeographyKey)
)
;



-- 
-- TABLE: DimListPriceHistory 
--

CREATE TABLE DimListPriceHistory(
    ListPriceHistory_SK    NUMBER(38, 0)    NOT NULL,
    ProductKey_SK          NUMBER(38, 0)    NOT NULL,
    Effective_Date         TIMESTAMP(6),
    Ineffective_Date       TIMESTAMP(6),
    Current_ListPrice      NUMBER(10, 0),
    Status                 NUMBER(1, 0),
    CONSTRAINT PK7 PRIMARY KEY (ListPriceHistory_SK, ProductKey_SK)
)
;



-- 
-- TABLE: DimPayHistory 
--

CREATE TABLE DimPayHistory(
    PayHistory_SK       NUMBER(38, 0)    NOT NULL,
    EmployeeKey_SK      NUMBER(38, 0)    NOT NULL,
    EffectiveDate       TIMESTAMP(6),
    IneffectiveDate     TIMESTAMP(6),
    CurrentIndiactor    NUMBER(1, 0),
    PayRate             NUMBER(10, 0),
    PayFrequency        NUMBER(1, 0),
    CONSTRAINT PK21 PRIMARY KEY (PayHistory_SK, EmployeeKey_SK)
)
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    ProductKey_SK             NUMBER(38, 0)    NOT NULL,
    ProductKey_NK             NUMBER(38, 0)    NOT NULL,
    ProductName               NVARCHAR2(50),
    ProductNumber             NVARCHAR2(25),
    FinishedGoodFlag          NUMBER(1, 0),
    Colour                    NVARCHAR2(15),
    SafetyStockLevel          SMALLINT         NOT NULL,
    ReorderPoint              SMALLINT         NOT NULL,
    Size                      NVARCHAR2(5),
    SizeUnitMeasureCode       NCHAR(3),
    WeightUnitMeasureCode     NCHAR(3),
    Weight                    NUMBER(8, 2),
    DaysToManufacture         NUMBER(38, 0),
    ProductLine               NCHAR(2),
    Class                     NCHAR(2),
    Style                     NCHAR(2),
    ProductSubCategoryName    NVARCHAR2(50),
    ProductCategoryName       NVARCHAR2(50),
    ProductModelName          NVARCHAR2(50),
    CONSTRAINT PK2 PRIMARY KEY (ProductKey_SK)
)
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             NUMBER(38, 0)    NOT NULL,
    SalesTerritoryAlternateKey    NUMBER(38, 0),
    SalesTerritoryRegion          NVARCHAR2(50)    NOT NULL,
    SalesTerritoryCountry         NVARCHAR2(50)    NOT NULL,
    SalesTerritoryGroup           NVARCHAR2(50),
    SalesTerritoryImage           BLOB,
    CONSTRAINT PK_DimSalesTerritory_SalesTerritoryKey PRIMARY KEY (SalesTerritoryKey)
)
;



-- 
-- TABLE: DimStandardCostHistory 
--

CREATE TABLE DimStandardCostHistory(
    StandardCostHistory_SK    NUMBER(38, 0)    NOT NULL,
    ProductKey_SK             NUMBER(38, 0)    NOT NULL,
    Effective_Date            TIMESTAMP(6),
    Ineffective_Date          TIMESTAMP(6),
    Current_StandardCost      NUMBER(10, 0)    NOT NULL,
    Status                    NUMBER(1, 0),
    CONSTRAINT PK7_1 PRIMARY KEY (StandardCostHistory_SK, ProductKey_SK)
)
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    VendorKey_SK               NUMBER(38, 0)     NOT NULL,
    VendorKey_NK               NUMBER(38, 0),
    AccountNumber              NVARCHAR2(15),
    VendorName                 NVARCHAR2(50),
    CreditRating               NUMBER(3, 0),
    PreferredVendorStatus      NUMBER(1, 0),
    ActiveFlag                 NUMBER(1, 0),
    PurchasingWebServiceURL    NVARCHAR2(120),
    GeographyKey               NUMBER(38, 0)     NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (VendorKey_SK)
)
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductKey_SK    NUMBER(38, 0)    NOT NULL,
    Quantity         SMALLINT         NOT NULL,
    Bin              NUMBER(3, 0),
    Shelf            NVARCHAR2(12),
    LocationName     NVARCHAR2(50),
    CONSTRAINT PK_FactProductInventory PRIMARY KEY (ProductKey_SK)
)
;



-- 
-- TABLE: FactProductVendor 
--

CREATE TABLE FactProductVendor(
    VendorKey_SK          NUMBER(38, 0)    NOT NULL,
    ProductKey_SK         NUMBER(38, 0)    NOT NULL,
    AverageLeadTime       NUMBER(38, 0),
    StandardPrice         NUMBER(10, 0),
    LastReceiptCost       NUMBER(10, 0),
    LastReceiptDate       TIMESTAMP(6),
    LastReceiptDateKey    NUMBER(38, 0),
    CONSTRAINT PK9 PRIMARY KEY (VendorKey_SK, ProductKey_SK)
)
;



-- 
-- TABLE: FactPurchase 
--

CREATE TABLE FactPurchase(
    VendorKey_SK           NUMBER(38, 0)    NOT NULL,
    ProductKey_SK          NUMBER(38, 0)    NOT NULL,
    EmployeeKey_SK         NUMBER(38, 0)    NOT NULL,
    ShippingCompanyName    NVARCHAR2(50),
    ShipBase               NUMBER(10, 0),
    ShipRate               NUMBER(10, 0),
    PurchaseOrderID        NUMBER(38, 0),
    ProductKey             NUMBER(38, 0),
    EmployeeKey            CHAR(10),
    PurchaseOrderLineID    NUMBER(38, 0),
    DueDate                TIMESTAMP(6),
    OrderDate              TIMESTAMP(6),
    ShipDate               TIMESTAMP(6),
    OrderQty               SMALLINT,
    UnitPrice              NUMBER(10, 0),
    ReceivedQty            NUMBER(8, 2),
    RejectedQty            NUMBER(8, 2),
    StockedQty             NUMBER(9, 2),
    RevisionNumber         NUMBER(3, 0),
    SubTotal               NUMBER(10, 0),
    TaxAm                  NUMBER(10, 0),
    Freight                NUMBER(10, 0),
    ProductStandardCost    NUMBER(10, 0),
    TotalDue               NUMBER(10, 0),
    ProductTotalCost       NUMBER(10, 0),
    SalesTerritoryKey      NUMBER(38, 0)    NOT NULL,
    DueDateKey             NUMBER(38, 0)    NOT NULL,
    ShipDateKey            NUMBER(38, 0)    NOT NULL,
    OrderDateKey           NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (VendorKey_SK, ProductKey_SK, EmployeeKey_SK)
)
;



-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimEmployee15 
    FOREIGN KEY (ParentEmployeeKey)
    REFERENCES DimEmployee(EmployeeKey_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimSalesTerritory17 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimVendor31 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
;


-- 
-- TABLE: DimGeography 
--

ALTER TABLE DimGeography ADD CONSTRAINT RefDimSalesTerritory21 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


-- 
-- TABLE: DimListPriceHistory 
--

ALTER TABLE DimListPriceHistory ADD CONSTRAINT RefDimProduct30 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;


-- 
-- TABLE: DimPayHistory 
--

ALTER TABLE DimPayHistory ADD CONSTRAINT RefDimEmployee32 
    FOREIGN KEY (EmployeeKey_SK)
    REFERENCES DimEmployee(EmployeeKey_SK)
;


-- 
-- TABLE: DimStandardCostHistory 
--

ALTER TABLE DimStandardCostHistory ADD CONSTRAINT RefDimProduct8 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;


-- 
-- TABLE: DimVendor 
--

ALTER TABLE DimVendor ADD CONSTRAINT RefDimGeography28 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
;


-- 
-- TABLE: FactProductInventory 
--

ALTER TABLE FactProductInventory ADD CONSTRAINT RefDimProduct29 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;


-- 
-- TABLE: FactProductVendor 
--

ALTER TABLE FactProductVendor ADD CONSTRAINT RefDimVendor10 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
;

ALTER TABLE FactProductVendor ADD CONSTRAINT RefDimProduct12 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;


-- 
-- TABLE: FactPurchase 
--

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimVendor9 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimProduct13 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimEmployee16 
    FOREIGN KEY (EmployeeKey_SK)
    REFERENCES DimEmployee(EmployeeKey_SK)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimSalesTerritory22 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar25 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimCalendar(DateKey)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar26 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimCalendar(DateKey)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar27 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimCalendar(DateKey)
;


