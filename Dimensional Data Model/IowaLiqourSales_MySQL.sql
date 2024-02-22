USE iowa_liquors;
--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      IowaLiqourSales_DimModel.DM1
--
-- Date Created : Tuesday, April 04, 2023 02:27:19
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: dim_iowa_city 
--

CREATE TABLE dim_iowa_city(
    City_SK          INT             AUTO_INCREMENT,
    County_SK        INT             NOT NULL,
    City             VARCHAR(255),
    FIPS             INT,
    DI_CreateDate    DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (City_SK, County_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_city_population_by_year 
--

CREATE TABLE dim_iowa_city_population_by_year(
    City_Pop_SK        INT         AUTO_INCREMENT,
    City_SK            INT         NOT NULL,
    County_SK          INT         NOT NULL,
    FIPS               INT,
    DataAsOf           DATETIME,
    Population_Year    INT,
    Population         INT,
    DI_CreateDate      DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (City_Pop_SK, City_SK, County_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_county 
--

CREATE TABLE dim_iowa_county(
    County_SK        INT             AUTO_INCREMENT,
    County           VARCHAR(255),
    FIPS             INT,
    DI_CreateDate    DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (County_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_county_population_by_year 
--

CREATE TABLE dim_iowa_county_population_by_year(
    County_Pop_SK      INT         AUTO_INCREMENT,
    County_SK          INT         NOT NULL,
    DateAsOf           DATE,
    Population_Year    INT,
    Population         INT,
    DI_CreateDate      DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (County_Pop_SK, County_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_liquor_Address 
--

CREATE TABLE dim_iowa_liquor_Address(
    Address_SK       INT              AUTO_INCREMENT,
    Address          VARCHAR(1000),
    Zip_Code         INT,
    County           VARCHAR(255),
    State            VARCHAR(255),
    City             VARCHAR(255),
    Latitude         VARCHAR(255),
    Longitude        VARCHAR(255),
    DI_CreateDate    DATETIME         DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Store_SK         INT              NOT NULL,
    City_SK          INT              NOT NULL,
    County_SK        INT              NOT NULL,
    PRIMARY KEY (Address_SK, Store_SK, City_SK, County_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_liquor_product_categories 
--

CREATE TABLE dim_iowa_liquor_product_categories(
    Category_SK        INT             AUTO_INCREMENT,
    Category_Number    INT             NOT NULL,
    Category_Name      VARCHAR(255),
    DI_CreateDate      DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Category_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_liquor_products 
--

CREATE TABLE dim_iowa_liquor_products(
    Item_SK                INT               NOT NULL,
    Item_Number            INT               NOT NULL,
    Item_Description       VARCHAR(255),
    Category_SK            INT,
    Vendor_SK              INT               NOT NULL,
    Bottle_Volume_ml       INT,
    Pack                   INT,
    Inner_Pack             INT,
    Age                    INT,
    Proof                  INT,
    List_Date              DATE,
    UPC                    VARCHAR(255),
    SCC                    VARCHAR(255),
    State_Bottle_Cost      DECIMAL(19, 4),
    State_Case_Cost        DECIMAL(19, 4),
    State_Bottle_Retail    DECIMAL(19, 4),
    Report_Date            DATE,
    DI_CreateDate          DATETIME          DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Item_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_liquor_stores 
--

CREATE TABLE dim_iowa_liquor_stores(
    Store_SK         INT             NOT NULL,
    Store_ID         INT             NOT NULL,
    Store_Name       VARCHAR(255),
    Store_Status     CHAR(1),
    Report_Date      DATE,
    DI_CreateDate    DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Store_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_liquor_vendors 
--

CREATE TABLE dim_iowa_liquor_vendors(
    Vendor_SK        INT             NOT NULL,
    Vendor_Number    INT             NOT NULL,
    Vendor_Name      VARCHAR(255),
    DI_CreateDate    DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Vendor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fct_iowa_liquor_sales_invoice_header 
--

CREATE TABLE fct_iowa_liquor_sales_invoice_header(
    Invoice_Number                 VARCHAR(100)      NOT NULL,
    Store_SK                       INT,
    Invoice_Date                   DATETIME          NOT NULL,
    Invoice_Bottles_Sold           INT,
    Invoice_Sale_Dollars           DECIMAL(19, 4),
    Invoice_Volume_Sold_Liters     DECIMAL(19, 4),
    Invoice_Volume_Sold_Gallons    DECIMAL(19, 4),
    DI_CreateDate                  DATETIME          DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Invoice_Number)
)ENGINE=MYISAM
;



-- 
-- TABLE: fct_iowa_liquor_sales_invoice_lineitem 
--

CREATE TABLE fct_iowa_liquor_sales_invoice_lineitem(
    Invoice_Item_Number      VARCHAR(100)      NOT NULL,
    Invoice_Number           VARCHAR(100)      NOT NULL,
    Item_SK                  INT               NOT NULL,
    Invoice_Number_LineNo    INT,
    Item_Number              VARCHAR(24),
    Pack                     INT,
    Bottle_Volume_ml         INT,
    State_Bottle_Cost        DECIMAL(19, 4),
    State_Bottle_Retail      DECIMAL(19, 4),
    Bottles_Sold             INT,
    Sale_Dollars             DECIMAL(19, 4),
    Volume_Sold_Liters       DECIMAL(19, 4),
    Volume_Sold_Gallons      DECIMAL(19, 4),
    DI_CreateDate            DATETIME          DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (Invoice_Item_Number)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_iowa_city 
--

ALTER TABLE dim_iowa_city ADD CONSTRAINT Refdim_iowa_county13 
    FOREIGN KEY (County_SK)
    REFERENCES dim_iowa_county(County_SK)
;


-- 
-- TABLE: dim_iowa_city_population_by_year 
--

ALTER TABLE dim_iowa_city_population_by_year ADD CONSTRAINT Refdim_iowa_city16 
    FOREIGN KEY (City_SK, County_SK)
    REFERENCES dim_iowa_city(City_SK, County_SK)
;


-- 
-- TABLE: dim_iowa_county_population_by_year 
--

ALTER TABLE dim_iowa_county_population_by_year ADD CONSTRAINT Refdim_iowa_county15 
    FOREIGN KEY (County_SK)
    REFERENCES dim_iowa_county(County_SK)
;


-- 
-- TABLE: dim_iowa_liquor_Address 
--

ALTER TABLE dim_iowa_liquor_Address ADD CONSTRAINT Refdim_iowa_liquor_stores12 
    FOREIGN KEY (Store_SK)
    REFERENCES dim_iowa_liquor_stores(Store_SK)
;

ALTER TABLE dim_iowa_liquor_Address ADD CONSTRAINT Refdim_iowa_city14 
    FOREIGN KEY (City_SK, County_SK)
    REFERENCES dim_iowa_city(City_SK, County_SK)
;


-- 
-- TABLE: dim_iowa_liquor_products 
--

ALTER TABLE dim_iowa_liquor_products ADD CONSTRAINT Refdim_iowa_liquor_vendors1 
    FOREIGN KEY (Vendor_SK)
    REFERENCES dim_iowa_liquor_vendors(Vendor_SK)
;

ALTER TABLE dim_iowa_liquor_products ADD CONSTRAINT Refdim_iowa_liquor_product_categories9 
    FOREIGN KEY (Category_SK)
    REFERENCES dim_iowa_liquor_product_categories(Category_SK)
;


-- 
-- TABLE: fct_iowa_liquor_sales_invoice_header 
--

ALTER TABLE fct_iowa_liquor_sales_invoice_header ADD CONSTRAINT Refdim_iowa_liquor_stores11 
    FOREIGN KEY (Store_SK)
    REFERENCES dim_iowa_liquor_stores(Store_SK)
;


-- 
-- TABLE: fct_iowa_liquor_sales_invoice_lineitem 
--

ALTER TABLE fct_iowa_liquor_sales_invoice_lineitem ADD CONSTRAINT Reffct_iowa_liquor_sales_invoice_header8 
    FOREIGN KEY (Invoice_Number)
    REFERENCES fct_iowa_liquor_sales_invoice_header(Invoice_Number)
;

ALTER TABLE fct_iowa_liquor_sales_invoice_lineitem ADD CONSTRAINT Refdim_iowa_liquor_products10 
    FOREIGN KEY (Item_SK)
    REFERENCES dim_iowa_liquor_products(Item_SK)
;


