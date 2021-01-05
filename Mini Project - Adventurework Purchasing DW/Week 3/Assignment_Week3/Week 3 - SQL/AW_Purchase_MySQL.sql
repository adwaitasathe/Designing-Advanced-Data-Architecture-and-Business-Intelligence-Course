--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      AdventureWorksPurchasingDW.DM1
--
-- Date Created : Wednesday, February 12, 2020 15:21:47
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DimCalendar 
--

CREATE TABLE DimCalendar(
    DateKey                 INT                     NOT NULL,
    FullDateAlternateKey    DATE                    NOT NULL,
    DayNumberOfWeek         TINYINT                 NOT NULL,
    EnglishDayNameOfWeek    NATIONAL VARCHAR(10)    NOT NULL,
    DayNumberOfMonth        TINYINT                 NOT NULL,
    DayNumberOfYear         SMALLINT                NOT NULL,
    WeekNumberOfYear        TINYINT                 NOT NULL,
    EnglishMonthName        NATIONAL VARCHAR(10)    NOT NULL,
    MonthNumberOfYear       TINYINT                 NOT NULL,
    CalendarQuarter         TINYINT                 NOT NULL,
    CalendarYear            SMALLINT                NOT NULL,
    CalendarSemester        TINYINT                 NOT NULL,
    FiscalQuarter           TINYINT                 NOT NULL,
    FiscalYear              SMALLINT                NOT NULL,
    FiscalSemester          TINYINT                 NOT NULL,
    PRIMARY KEY (DateKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeKey_SK                    INT                      AUTO_INCREMENT,
    SalesTerritoryKey                 INT                      NOT NULL,
    ParentEmployeeKey                 INT                      NOT NULL,
    VendorKey_SK                      INT                      NOT NULL,
    EmployeeNationalIDAlternateKey    NATIONAL VARCHAR(15),
    PersonType                        NATIONAL CHAR(2)         NOT NULL,
    FirstName                         NATIONAL VARCHAR(50)     NOT NULL,
    LastName                          NATIONAL VARCHAR(50)     NOT NULL,
    MiddleName                        NATIONAL VARCHAR(50),
    NameStyle                         BIT(1)                   NOT NULL,
    Title                             NATIONAL VARCHAR(50),
    HireDate                          DATE,
    BirthDate                         DATE,
    LoginID                           NATIONAL VARCHAR(256),
    EmailAddress                      NATIONAL VARCHAR(50),
    Phone                             NATIONAL VARCHAR(25),
    MaritalStatus                     NATIONAL CHAR(1),
    EmergencyContactName              NATIONAL VARCHAR(50),
    EmergencyContactPhone             NATIONAL VARCHAR(25),
    SalariedFlag                      BIT(1),
    Gender                            NATIONAL CHAR(1),
    PayFrequency                      TINYINT,
    BaseRate                          DECIMAL(19, 4),
    VacationHours                     SMALLINT,
    SickLeaveHours                    SMALLINT,
    CurrentFlag                       BIT(1)                   NOT NULL,
    DepartmentName                    NATIONAL VARCHAR(50),
    StartDate                         DATE,
    EndDate                           DATE,
    Status                            NATIONAL VARCHAR(50),
    EmployeePhoto                     VARBINARY(4000),
    GeographyKey                      INT                      NOT NULL,
    PRIMARY KEY (EmployeeKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyKey                INT                     AUTO_INCREMENT,
    SalesTerritoryKey           INT                     NOT NULL,
    City                        NATIONAL VARCHAR(30),
    StateProvinceCode           NATIONAL VARCHAR(3),
    StateProvinceName           NATIONAL VARCHAR(50),
    CountryRegionCode           NATIONAL VARCHAR(3),
    EnglishCountryRegionName    NATIONAL VARCHAR(50),
    PostalCode                  NATIONAL VARCHAR(15),
    PRIMARY KEY (GeographyKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimListPriceHistory 
--

CREATE TABLE DimListPriceHistory(
    ListPriceHistory_SK    INT               AUTO_INCREMENT,
    ProductKey_SK          INT               NOT NULL,
    Effective_Date         DATETIME,
    Ineffective_Date       DATETIME,
    Current_ListPrice      DECIMAL(10, 0),
    Status                 BIT(1),
    PRIMARY KEY (ListPriceHistory_SK, ProductKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimPayHistory 
--

CREATE TABLE DimPayHistory(
    PayHistory_SK       INT               AUTO_INCREMENT,
    EmployeeKey_SK      INT               NOT NULL,
    EffectiveDate       DATETIME,
    IneffectiveDate     DATETIME,
    CurrentIndiactor    BIT(1),
    PayRate             DECIMAL(10, 0),
    PayFrequency        BIT(1),
    PRIMARY KEY (PayHistory_SK, EmployeeKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    ProductKey_SK             INT                     AUTO_INCREMENT,
    ProductKey_NK             INT                     NOT NULL,
    ProductName               NATIONAL VARCHAR(50),
    ProductNumber             NATIONAL VARCHAR(25),
    FinishedGoodFlag          BIT(1),
    Colour                    NATIONAL VARCHAR(15),
    SafetyStockLevel          SMALLINT                NOT NULL,
    ReorderPoint              SMALLINT                NOT NULL,
    Size                      NATIONAL VARCHAR(5),
    SizeUnitMeasureCode       NATIONAL CHAR(3),
    WeightUnitMeasureCode     NATIONAL CHAR(3),
    Weight                    DECIMAL(8, 2),
    DaysToManufacture         INT,
    ProductLine               NATIONAL CHAR(2),
    Class                     NATIONAL CHAR(2),
    Style                     NATIONAL CHAR(2),
    ProductSubCategoryName    NATIONAL VARCHAR(50),
    ProductCategoryName       NATIONAL VARCHAR(50),
    ProductModelName          NATIONAL VARCHAR(50),
    PRIMARY KEY (ProductKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             INT                     AUTO_INCREMENT,
    SalesTerritoryAlternateKey    INT,
    SalesTerritoryRegion          NATIONAL VARCHAR(50)    NOT NULL,
    SalesTerritoryCountry         NATIONAL VARCHAR(50)    NOT NULL,
    SalesTerritoryGroup           NATIONAL VARCHAR(50),
    SalesTerritoryImage           VARBINARY(4000),
    PRIMARY KEY (SalesTerritoryKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimStandardCostHistory 
--

CREATE TABLE DimStandardCostHistory(
    StandardCostHistory_SK    INT               AUTO_INCREMENT,
    ProductKey_SK             INT               NOT NULL,
    Effective_Date            DATETIME,
    Ineffective_Date          DATETIME,
    Current_StandardCost      DECIMAL(10, 0)    NOT NULL,
    Status                    BIT(1),
    PRIMARY KEY (StandardCostHistory_SK, ProductKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    VendorKey_SK               INT                      AUTO_INCREMENT,
    VendorKey_NK               INT,
    AccountNumber              NATIONAL VARCHAR(15),
    VendorName                 NATIONAL VARCHAR(50),
    CreditRating               TINYINT,
    PreferredVendorStatus      BIT(1),
    ActiveFlag                 BIT(1),
    PurchasingWebServiceURL    NATIONAL VARCHAR(120),
    SalesTerritoryKey          INT                      NOT NULL,
    PRIMARY KEY (VendorKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductKey_SK    INT                     NOT NULL,
    Quantity         SMALLINT                NOT NULL,
    Bin              TINYINT,
    Shelf            NATIONAL VARCHAR(12),
    LocationName     NATIONAL VARCHAR(50),
    PRIMARY KEY (ProductKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactProductVendor 
--

CREATE TABLE FactProductVendor(
    VendorKey_SK          INT               NOT NULL,
    ProductKey_SK         INT               NOT NULL,
    AverageLeadTime       INT,
    StandardPrice         DECIMAL(10, 0),
    LastReceiptCost       DECIMAL(10, 0),
    LastReceiptDate       DATETIME,
    LastReceiptDateKey    INT,
    PRIMARY KEY (VendorKey_SK, ProductKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchase 
--

CREATE TABLE FactPurchase(
    VendorKey_SK           INT                     NOT NULL,
    ProductKey_SK          INT                     NOT NULL,
    EmployeeKey_SK         INT                     NOT NULL,
    ShippingCompanyName    NATIONAL VARCHAR(50),
    ShipBase               DECIMAL(10, 0),
    ShipRate               DECIMAL(10, 0),
    PurchaseOrderID        INT,
    ProductKey             INT,
    EmployeeKey            CHAR(10),
    PurchaseOrderLineID    INT,
    DueDate                DATETIME,
    OrderDate              DATETIME,
    ShipDate               DATETIME,
    OrderQty               SMALLINT,
    UnitPrice              DECIMAL(10, 0),
    ReceivedQty            DECIMAL(8, 2),
    RejectedQty            DECIMAL(8, 2),
    StockedQty             DECIMAL(9, 2),
    RevisionNumber         TINYINT,
    SubTotal               DECIMAL(10, 0),
    TaxAm                  DECIMAL(10, 0),
    Freight                DECIMAL(10, 0),
    ProductStandardCost    DECIMAL(10, 0),
    TotalDue               DECIMAL(10, 0),
    ProductTotalCost       DECIMAL(10, 0),
    DueDateKey             INT                     NOT NULL,
    ShipDateKey            INT                     NOT NULL,
    OrderDateKey           INT                     NOT NULL,
    SalesTerritoryKey      INT                     NOT NULL,
    PRIMARY KEY (VendorKey_SK, ProductKey_SK, EmployeeKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimEmployee15 
    FOREIGN KEY (ParentEmployeeKey)
    REFERENCES DimEmployee(EmployeeKey_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimVendor31 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography50 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimSalesTerritory57 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


-- 
-- TABLE: DimGeography 
--

ALTER TABLE DimGeography ADD CONSTRAINT RefDimSalesTerritory48 
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

ALTER TABLE DimVendor ADD CONSTRAINT RefDimSalesTerritory47 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
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

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimEmployee16 
    FOREIGN KEY (EmployeeKey_SK)
    REFERENCES DimEmployee(EmployeeKey_SK)
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

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimVendor9 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimProduct13 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
;

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimSalesTerritory49 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


