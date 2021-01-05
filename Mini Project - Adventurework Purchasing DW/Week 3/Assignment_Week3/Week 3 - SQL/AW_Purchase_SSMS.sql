

CREATE TABLE DimCalendar(
    DateKey                 int             NOT NULL,
    FullDateAlternateKey    date            NOT NULL,
    DayNumberOfWeek         tinyint         NOT NULL,
    EnglishDayNameOfWeek    nvarchar(10)    NOT NULL,
    DayNumberOfMonth        tinyint         NOT NULL,
    DayNumberOfYear         smallint        NOT NULL,
    WeekNumberOfYear        tinyint         NOT NULL,
    EnglishMonthName        nvarchar(10)    NOT NULL,
    MonthNumberOfYear       tinyint         NOT NULL,
    CalendarQuarter         tinyint         NOT NULL,
    CalendarYear            smallint        NOT NULL,
    CalendarSemester        tinyint         NOT NULL,
    FiscalQuarter           tinyint         NOT NULL,
    FiscalYear              smallint        NOT NULL,
    FiscalSemester          tinyint         NOT NULL,
    CONSTRAINT PK_DimDate_DateKey PRIMARY KEY NONCLUSTERED (DateKey)
)
go



IF OBJECT_ID('DimCalendar') IS NOT NULL
    PRINT '<<< CREATED TABLE DimCalendar >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimCalendar >>>'
go

/* 
 * TABLE: DimEmployee 
 */

CREATE TABLE DimEmployee(
    EmployeeKey_SK                    int               IDENTITY(1,1),
    SalesTerritoryKey                 int               NULL,
    ParentEmployeeKey                 int               NOT NULL,
    VendorKey_SK                      int               NOT NULL,
    EmployeeNationalIDAlternateKey    nvarchar(15)      NULL,
    PersonType                        nchar(2)          NOT NULL,
    FirstName                         nvarchar(50)      NOT NULL,
    LastName                          nvarchar(50)      NOT NULL,
    MiddleName                        nvarchar(50)      NULL,
    NameStyle                         bit               NOT NULL,
    Title                             nvarchar(50)      NULL,
    HireDate                          date              NULL,
    BirthDate                         date              NULL,
    LoginID                           nvarchar(256)     NULL,
    EmailAddress                      nvarchar(50)      NULL,
    Phone                             nvarchar(25)      NULL,
    MaritalStatus                     nchar(1)          NULL,
    EmergencyContactName              nvarchar(50)      NULL,
    EmergencyContactPhone             nvarchar(25)      NULL,
    SalariedFlag                      bit               NULL,
    Gender                            nchar(1)          NULL,
    PayFrequency                      tinyint           NULL,
    BaseRate                          money             NULL,
    VacationHours                     smallint          NULL,
    SickLeaveHours                    smallint          NULL,
    CurrentFlag                       bit               NOT NULL,
    DepartmentName                    nvarchar(50)      NULL,
    StartDate                         date              NULL,
    EndDate                           date              NULL,
    Status                            nvarchar(50)      NULL,
    EmployeePhoto                     varbinary(max)    NULL,
    CONSTRAINT PK_DimEmployee_EmployeeKey PRIMARY KEY NONCLUSTERED (EmployeeKey_SK)
)
go



IF OBJECT_ID('DimEmployee') IS NOT NULL
    PRINT '<<< CREATED TABLE DimEmployee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimEmployee >>>'
go

/* 
 * TABLE: DimGeography 
 */

CREATE TABLE DimGeography(
    GeographyKey                int             IDENTITY(1,1),
    SalesTerritoryKey           int             NULL,
    City                        nvarchar(30)    NULL,
    StateProvinceCode           nvarchar(3)     NULL,
    StateProvinceName           nvarchar(50)    NULL,
    CountryRegionCode           nvarchar(3)     NULL,
    EnglishCountryRegionName    nvarchar(50)    NULL,
    PostalCode                  nvarchar(15)    NULL,
    CONSTRAINT PK_DimGeography_GeographyKey PRIMARY KEY NONCLUSTERED (GeographyKey)
)
go



IF OBJECT_ID('DimGeography') IS NOT NULL
    PRINT '<<< CREATED TABLE DimGeography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimGeography >>>'
go

/* 
 * TABLE: DimListPriceHistory 
 */

CREATE TABLE DimListPriceHistory(
    ListPriceHistory_SK    int         IDENTITY(1,1),
    ProductKey_SK          int         NOT NULL,
    Effective_Date         datetime    NULL,
    Ineffective_Date       datetime    NULL,
    Current_ListPrice      money       NULL,
    Status                 bit         NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ListPriceHistory_SK, ProductKey_SK)
)
go



IF OBJECT_ID('DimListPriceHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimListPriceHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimListPriceHistory >>>'
go

/* 
 * TABLE: DimPayHistory 
 */

CREATE TABLE DimPayHistory(
    PayHistory_SK       int         IDENTITY(1,1),
    EmployeeKey_SK      int         NOT NULL,
    EffectiveDate       datetime    NULL,
    IneffectiveDate     datetime    NULL,
    CurrentIndiactor    bit         NULL,
    PayRate             money       NULL,
    PayFrequency        bit         NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (PayHistory_SK, EmployeeKey_SK)
)
go



IF OBJECT_ID('DimPayHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimPayHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimPayHistory >>>'
go

/* 
 * TABLE: DimProduct 
 */

CREATE TABLE DimProduct(
    ProductKey_SK             int              IDENTITY(1,1),
    ProductKey_NK             int              NOT NULL,
    ProductName               nvarchar(50)     NULL,
    ProductNumber             nvarchar(25)     NULL,
    FinishedGoodFlag          bit              NULL,
    Colour                    nvarchar(15)     NULL,
    SafetyStockLevel          smallint         NOT NULL,
    ReorderPoint              smallint         NOT NULL,
    Size                      nvarchar(5)      NULL,
    SizeUnitMeasureCode       nchar(3)         NULL,
    WeightUnitMeasureCode     nchar(3)         NULL,
    Weight                    decimal(8, 2)    NULL,
    DaysToManufacture         int              NULL,
    ProductLine               nchar(2)         NULL,
    Class                     nchar(2)         NULL,
    Style                     nchar(2)         NULL,
    ProductSubCategoryName    nvarchar(50)     NULL,
    ProductCategoryName       nvarchar(50)     NULL,
    ProductModelName          nvarchar(50)     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (ProductKey_SK)
)
go



IF OBJECT_ID('DimProduct') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProduct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProduct >>>'
go

/* 
 * TABLE: DimSalesTerritory 
 */

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             int               IDENTITY(1,1),
    SalesTerritoryAlternateKey    int               NULL,
    SalesTerritoryRegion          nvarchar(50)      NOT NULL,
    SalesTerritoryCountry         nvarchar(50)      NOT NULL,
    SalesTerritoryGroup           nvarchar(50)      NULL,
    SalesTerritoryImage           varbinary(max)    NULL,
    CONSTRAINT PK_DimSalesTerritory_SalesTerritoryKey PRIMARY KEY NONCLUSTERED (SalesTerritoryKey)
)
go



IF OBJECT_ID('DimSalesTerritory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimSalesTerritory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimSalesTerritory >>>'
go

/* 
 * TABLE: DimStandardCostHistory 
 */

CREATE TABLE DimStandardCostHistory(
    StandardCostHistory_SK    int         IDENTITY(1,1),
    ProductKey_SK             int         NOT NULL,
    Effective_Date            datetime    NULL,
    Ineffective_Date          datetime    NULL,
    Current_StandardCost      money       NOT NULL,
    Status                    bit         NULL,
    CONSTRAINT PK7_1 PRIMARY KEY NONCLUSTERED (StandardCostHistory_SK, ProductKey_SK)
)
go



IF OBJECT_ID('DimStandardCostHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimStandardCostHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimStandardCostHistory >>>'
go

/* 
 * TABLE: DimVendor 
 */

CREATE TABLE DimVendor(
    VendorKey_SK               int              IDENTITY(1,1),
    VendorKey_NK               int              NULL,
    AccountNumber              nvarchar(15)     NULL,
    VendorName                 nvarchar(50)     NULL,
    CreditRating               tinyint          NULL,
    PreferredVendorStatus      bit              NULL,
    ActiveFlag                 bit              NULL,
    PurchasingWebServiceURL    nvarchar(120)    NULL,
    GeographyKey               int              NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (VendorKey_SK)
)
go



IF OBJECT_ID('DimVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendor >>>'
go

/* 
 * TABLE: FactProductInventory 
 */

CREATE TABLE FactProductInventory(
    ProductKey_SK    int             NOT NULL,
    Quantity         smallint        IDENTITY(1,1),
    Bin              tinyint         NULL,
    Shelf            nvarchar(12)    NULL,
    LocationName     nvarchar(50)    NULL,
    CONSTRAINT PK_FactProductInventory PRIMARY KEY NONCLUSTERED (ProductKey_SK)
)
go



IF OBJECT_ID('FactProductInventory') IS NOT NULL
    PRINT '<<< CREATED TABLE FactProductInventory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactProductInventory >>>'
go

/* 
 * TABLE: FactProductVendor 
 */

CREATE TABLE FactProductVendor(
    VendorKey_SK          int         NOT NULL,
    ProductKey_SK         int         NOT NULL,
    AverageLeadTime       int         NULL,
    StandardPrice         money       NULL,
    LastReceiptCost       money       NULL,
    LastReceiptDate       datetime    NULL,
    LastReceiptDateKey    int         NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (VendorKey_SK, ProductKey_SK)
)
go



IF OBJECT_ID('FactProductVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE FactProductVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactProductVendor >>>'
go

/* 
 * TABLE: FactPurchase 
 */

CREATE TABLE FactPurchase(
    VendorKey_SK           int              NOT NULL,
    ProductKey_SK          int              NOT NULL,
    EmployeeKey_SK         int              NOT NULL,
    ShippingCompanyName    nvarchar(50)     NULL,
    ShipBase               money            NULL,
    ShipRate               money            NULL,
    PurchaseOrderID        int              NULL,
    ProductKey             int              NULL,
    EmployeeKey            char(10)         NULL,
    PurchaseOrderLineID    int              NULL,
    DueDate                datetime         NULL,
    OrderDate              datetime         NULL,
    ShipDate               datetime         NULL,
    OrderQty               smallint         NULL,
    UnitPrice              money            NULL,
    ReceivedQty            decimal(8, 2)    NULL,
    RejectedQty            decimal(8, 2)    NULL,
    StockedQty             decimal(9, 2)    NULL,
    RevisionNumber         tinyint          NULL,
    SubTotal               money            NULL,
    TaxAm                  money            NULL,
    Freight                money            NULL,
    ProductStandardCost    money            NULL,
    TotalDue               money            NULL,
    ProductTotalCost       money            NULL,
    SalesTerritoryKey      int              NOT NULL,
    DueDateKey             int              NOT NULL,
    ShipDateKey            int              NOT NULL,
    OrderDateKey           int              NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (VendorKey_SK, ProductKey_SK, EmployeeKey_SK)
)
go



IF OBJECT_ID('FactPurchase') IS NOT NULL
    PRINT '<<< CREATED TABLE FactPurchase >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactPurchase >>>'
go

/* 
 * TABLE: DimEmployee 
 */

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimEmployee15 
    FOREIGN KEY (ParentEmployeeKey)
    REFERENCES DimEmployee(EmployeeKey_SK)
go

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimSalesTerritory17 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimVendor31 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
go


/* 
 * TABLE: DimGeography 
 */

ALTER TABLE DimGeography ADD CONSTRAINT RefDimSalesTerritory21 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: DimListPriceHistory 
 */

ALTER TABLE DimListPriceHistory ADD CONSTRAINT RefDimProduct30 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
go


/* 
 * TABLE: DimPayHistory 
 */

ALTER TABLE DimPayHistory ADD CONSTRAINT RefDimEmployee32 
    FOREIGN KEY (EmployeeKey_SK)
    REFERENCES DimEmployee(EmployeeKey_SK)
go


/* 
 * TABLE: DimStandardCostHistory 
 */

ALTER TABLE DimStandardCostHistory ADD CONSTRAINT RefDimProduct8 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
go


/* 
 * TABLE: DimVendor 
 */

ALTER TABLE DimVendor ADD CONSTRAINT RefDimGeography28 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: FactProductInventory 
 */

ALTER TABLE FactProductInventory ADD CONSTRAINT RefDimProduct29 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
go


/* 
 * TABLE: FactProductVendor 
 */

ALTER TABLE FactProductVendor ADD CONSTRAINT RefDimVendor10 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
go

ALTER TABLE FactProductVendor ADD CONSTRAINT RefDimProduct12 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
go


/* 
 * TABLE: FactPurchase 
 */

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimEmployee16 
    FOREIGN KEY (EmployeeKey_SK)
    REFERENCES DimEmployee(EmployeeKey_SK)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimSalesTerritory22 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar25 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimCalendar(DateKey)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar26 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimCalendar(DateKey)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimCalendar27 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimCalendar(DateKey)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimVendor9 
    FOREIGN KEY (VendorKey_SK)
    REFERENCES DimVendor(VendorKey_SK)
go

ALTER TABLE FactPurchase ADD CONSTRAINT RefDimProduct13 
    FOREIGN KEY (ProductKey_SK)
    REFERENCES DimProduct(ProductKey_SK)
go


