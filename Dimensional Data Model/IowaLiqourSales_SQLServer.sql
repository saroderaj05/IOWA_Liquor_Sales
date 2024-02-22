/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      IowaLiqourSales_DimModel.DM1
 *
 * Date Created : Tuesday, April 04, 2023 02:28:57
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: dim_iowa_city 
 */

CREATE TABLE dim_iowa_city(
    City_SK          int             IDENTITY(1,1),
    County_SK        int             NOT NULL,
    City             varchar(255)    NULL,
    FIPS             int             NULL,
    DI_CreateDate    datetime        DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (City_SK, County_SK)
)

go


IF OBJECT_ID('dim_iowa_city') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_city >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_city >>>'
go

/* 
 * TABLE: dim_iowa_city_population_by_year 
 */

CREATE TABLE dim_iowa_city_population_by_year(
    City_Pop_SK        int         IDENTITY(1,1),
    City_SK            int         NOT NULL,
    County_SK          int         NOT NULL,
    FIPS               int         NULL,
    DataAsOf           datetime    NULL,
    Population_Year    int         NULL,
    Population         int         NULL,
    DI_CreateDate      datetime    DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (City_Pop_SK, City_SK, County_SK)
)

go


IF OBJECT_ID('dim_iowa_city_population_by_year') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_city_population_by_year >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_city_population_by_year >>>'
go

/* 
 * TABLE: dim_iowa_county 
 */

CREATE TABLE dim_iowa_county(
    County_SK        int             IDENTITY(1,1),
    County           varchar(255)    NULL,
    FIPS             int             NULL,
    DI_CreateDate    datetime        DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (County_SK)
)

go


IF OBJECT_ID('dim_iowa_county') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_county >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_county >>>'
go

/* 
 * TABLE: dim_iowa_county_population_by_year 
 */

CREATE TABLE dim_iowa_county_population_by_year(
    County_Pop_SK      int         IDENTITY(1,1),
    County_SK          int         NOT NULL,
    DateAsOf           date        NULL,
    Population_Year    int         NULL,
    Population         int         NULL,
    DI_CreateDate      datetime    DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (County_Pop_SK, County_SK)
)

go


IF OBJECT_ID('dim_iowa_county_population_by_year') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_county_population_by_year >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_county_population_by_year >>>'
go

/* 
 * TABLE: dim_iowa_liquor_Address 
 */

CREATE TABLE dim_iowa_liquor_Address(
    Address_SK       int              IDENTITY(1,1),
    Address          varchar(1000)    NULL,
    Zip_Code         int              NULL,
    County           varchar(255)     NULL,
    State            varchar(255)     NULL,
    City             varchar(255)     NULL,
    Latitude         varchar(255)     NULL,
    Longitude        varchar(255)     NULL,
    DI_CreateDate    datetime         DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    Store_SK         int              NOT NULL,
    City_SK          int              NOT NULL,
    County_SK        int              NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Address_SK, Store_SK, City_SK, County_SK)
)

go


IF OBJECT_ID('dim_iowa_liquor_Address') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_liquor_Address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_liquor_Address >>>'
go

/* 
 * TABLE: dim_iowa_liquor_product_categories 
 */

CREATE TABLE dim_iowa_liquor_product_categories(
    Category_SK        int             IDENTITY(1,1),
    Category_Number    int             NOT NULL,
    Category_Name      varchar(255)    NULL,
    DI_CreateDate      datetime        DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Category_SK)
)

go


IF OBJECT_ID('dim_iowa_liquor_product_categories') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_liquor_product_categories >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_liquor_product_categories >>>'
go

/* 
 * TABLE: dim_iowa_liquor_products 
 */

CREATE TABLE dim_iowa_liquor_products(
    Item_SK                int               NOT NULL,
    Item_Number            int               NOT NULL,
    Item_Description       varchar(255)      NULL,
    Category_SK            int               NULL,
    Vendor_SK              int               NOT NULL,
    Bottle_Volume_ml       int               NULL,
    Pack                   int               NULL,
    Inner_Pack             int               NULL,
    Age                    int               NULL,
    Proof                  int               NULL,
    List_Date              date              NULL,
    UPC                    varchar(255)      NULL,
    SCC                    varchar(255)      NULL,
    State_Bottle_Cost      decimal(19, 4)    NULL,
    State_Case_Cost        decimal(19, 4)    NULL,
    State_Bottle_Retail    decimal(19, 4)    NULL,
    Report_Date            date              NULL,
    DI_CreateDate          datetime          DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Item_SK)
)

go


IF OBJECT_ID('dim_iowa_liquor_products') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_liquor_products >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_liquor_products >>>'
go

/* 
 * TABLE: dim_iowa_liquor_stores 
 */

CREATE TABLE dim_iowa_liquor_stores(
    Store_SK         int             NOT NULL,
    Store_ID         int             NOT NULL,
    Store_Name       varchar(255)    NULL,
    Store_Status     char(1)         NULL,
    Report_Date      date            NULL,
    DI_CreateDate    datetime        DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Store_SK)
)

go


IF OBJECT_ID('dim_iowa_liquor_stores') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_liquor_stores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_liquor_stores >>>'
go

/* 
 * TABLE: dim_iowa_liquor_vendors 
 */

CREATE TABLE dim_iowa_liquor_vendors(
    Vendor_SK        int             NOT NULL,
    Vendor_Number    int             NOT NULL,
    Vendor_Name      varchar(255)    NULL,
    DI_CreateDate    datetime        DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Vendor_SK)
)

go


IF OBJECT_ID('dim_iowa_liquor_vendors') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_iowa_liquor_vendors >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_iowa_liquor_vendors >>>'
go

/* 
 * TABLE: fct_iowa_liquor_sales_invoice_header 
 */

CREATE TABLE fct_iowa_liquor_sales_invoice_header(
    Invoice_Number                 varchar(255)      NOT NULL,
    Store_SK                       int               NULL,
    Invoice_Date                   datetime          NOT NULL,
    Invoice_Bottles_Sold           int               NULL,
    Invoice_Sale_Dollars           decimal(19, 4)    NULL,
    Invoice_Volume_Sold_Liters     decimal(19, 4)    NULL,
    Invoice_Volume_Sold_Gallons    decimal(19, 4)    NULL,
    DI_CreateDate                  datetime          DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Invoice_Number)
)

go


IF OBJECT_ID('fct_iowa_liquor_sales_invoice_header') IS NOT NULL
    PRINT '<<< CREATED TABLE fct_iowa_liquor_sales_invoice_header >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE fct_iowa_liquor_sales_invoice_header >>>'
go

/* 
 * TABLE: fct_iowa_liquor_sales_invoice_lineitem 
 */

CREATE TABLE fct_iowa_liquor_sales_invoice_lineitem(
    Invoice_Item_Number      varchar(255)      NOT NULL,
    Invoice_Number           varchar(255)      NOT NULL,
    Item_SK                  int               NOT NULL,
    Invoice_Number_LineNo    int               NULL,
    Item_Number              varchar(24)       NULL,
    Pack                     int               NULL,
    Bottle_Volume_ml         int               NULL,
    State_Bottle_Cost        decimal(19, 4)    NULL,
    State_Bottle_Retail      decimal(19, 4)    NULL,
    Bottles_Sold             int               NULL,
    Sale_Dollars             decimal(19, 4)    NULL,
    Volume_Sold_Liters       decimal(19, 4)    NULL,
    Volume_Sold_Gallons      decimal(19, 4)    NULL,
    DI_CreateDate            datetime          DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (Invoice_Item_Number)
)

go


IF OBJECT_ID('fct_iowa_liquor_sales_invoice_lineitem') IS NOT NULL
    PRINT '<<< CREATED TABLE fct_iowa_liquor_sales_invoice_lineitem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE fct_iowa_liquor_sales_invoice_lineitem >>>'
go

/* 
 * TABLE: dim_iowa_city 
 */

ALTER TABLE dim_iowa_city ADD CONSTRAINT Refdim_iowa_county13 
    FOREIGN KEY (County_SK)
    REFERENCES dim_iowa_county(County_SK)
go


/* 
 * TABLE: dim_iowa_city_population_by_year 
 */

ALTER TABLE dim_iowa_city_population_by_year ADD CONSTRAINT Refdim_iowa_city16 
    FOREIGN KEY (City_SK, County_SK)
    REFERENCES dim_iowa_city(City_SK, County_SK)
go


/* 
 * TABLE: dim_iowa_county_population_by_year 
 */

ALTER TABLE dim_iowa_county_population_by_year ADD CONSTRAINT Refdim_iowa_county15 
    FOREIGN KEY (County_SK)
    REFERENCES dim_iowa_county(County_SK)
go


/* 
 * TABLE: dim_iowa_liquor_Address 
 */

ALTER TABLE dim_iowa_liquor_Address ADD CONSTRAINT Refdim_iowa_liquor_stores12 
    FOREIGN KEY (Store_SK)
    REFERENCES dim_iowa_liquor_stores(Store_SK)
go

ALTER TABLE dim_iowa_liquor_Address ADD CONSTRAINT Refdim_iowa_city14 
    FOREIGN KEY (City_SK, County_SK)
    REFERENCES dim_iowa_city(City_SK, County_SK)
go


/* 
 * TABLE: dim_iowa_liquor_products 
 */

ALTER TABLE dim_iowa_liquor_products ADD CONSTRAINT Refdim_iowa_liquor_vendors1 
    FOREIGN KEY (Vendor_SK)
    REFERENCES dim_iowa_liquor_vendors(Vendor_SK)
go

ALTER TABLE dim_iowa_liquor_products ADD CONSTRAINT Refdim_iowa_liquor_product_categories9 
    FOREIGN KEY (Category_SK)
    REFERENCES dim_iowa_liquor_product_categories(Category_SK)
go


/* 
 * TABLE: fct_iowa_liquor_sales_invoice_header 
 */

ALTER TABLE fct_iowa_liquor_sales_invoice_header ADD CONSTRAINT Refdim_iowa_liquor_stores11 
    FOREIGN KEY (Store_SK)
    REFERENCES dim_iowa_liquor_stores(Store_SK)
go


/* 
 * TABLE: fct_iowa_liquor_sales_invoice_lineitem 
 */

ALTER TABLE fct_iowa_liquor_sales_invoice_lineitem ADD CONSTRAINT Reffct_iowa_liquor_sales_invoice_header8 
    FOREIGN KEY (Invoice_Number)
    REFERENCES fct_iowa_liquor_sales_invoice_header(Invoice_Number)
go

ALTER TABLE fct_iowa_liquor_sales_invoice_lineitem ADD CONSTRAINT Refdim_iowa_liquor_products10 
    FOREIGN KEY (Item_SK)
    REFERENCES dim_iowa_liquor_products(Item_SK)
go


