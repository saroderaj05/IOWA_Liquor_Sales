USE iowa_sales_finalschema;

-- 1. Total Sales
select sum(Invoice_Sale_Dollars) from fct_iowa_liquor_sales_invoice_header;

-- 2.  Total Sales Volume (Gallons)
select sum(Invoice_Volume_Sold_Gallons) from fct_iowa_liquor_sales_invoice_header;

-- 3. Sales Volume (Bottles)
select sum(Invoice_Volume_Sold_Liters) from fct_iowa_liquor_sales_invoice_header;
-- 4. Gross Profit(Retail-cost)
select sum(State_Bottle_Retail - State_Bottle_Cost) 
from fct_iowa_liquor_sales_invoice_lineitem;

-- 5. Sales $ per Capita



-- 6. Liquor Sales by Time(Total)



-- 7. Liquor Sales by Time(Year)

select sum(Invoice_Sale_Dollars),  YEAR('Invoice_Date') AS inv_year
from fct_iowa_liquor_sales_invoice_header 
order by inv_year;

-- 8. Liquor Sales by Time(year, month)

select sum(Invoice_Sales_Dollars),YEAR(Invoice_Date)
 AS year, MONTH(Invoice_Date) AS month 
FROM fct_iowa_liquor_sales_invoice_header
group by year, month;

-- 9. Liquor Sales by Time(year over year)
select sum(Invoice_Sales_Dollars), 
YEAR('Invoice_Date') AS year
from fct_iowa_liquor_sales 
group by year;


-- 10. Liquor sales by dimension store

select sum(Invoice_Sale_Dollars), s.Store_Name
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liquor_stores as s 
on h.Store_SK=s.Store_SK
group by s.Store_Name;


-- 11. Liquor sales by dimension county

select sum(Invoice_Sale_Dollars), a.County
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liquor_stores as s 
on h.Store_SK=s.Store_SK
join dim_iowa_liquor_geo as g
on s.Geo_SK= g.Geo_SK
join dim_iowa_county as a
on g.County_SK= a.County_SK
group by a.County;

-- 12. Liquor sales by dimension city


select sum(Invoice_Sale_Dollars), a.City
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liquor_stores as s 
on h.Store_SK=s.Store_SK
join dim_iowa_liquor_geo as g
on s.Geo_SK= g.Geo_SK
join dim_iowa_city as a
on g.City_SK= a.City_SK
group by a.City;


-- 13. Liquor sales by dimension category

select sum(Invoice_Sale_Dollars), c.Category_Name
from fct_iowa_liquor_sales_invoice_header as h
join fct_iowa_liquor_sales_invoice_lineitem as f 
on h.Invoice_Number=f.Invoice_Number
join dim_iowa_liquor_products as p
on f.Item_SK= p.Item_SK
join dim_iowa_liquor_product_categories as c
on p.Category_SK= c.Category_SK
group by c.Category_Name;

-- 14. Liquor sales by dimension item

select sum(Invoice_Sale_Dollars), p.Item_Number, p.Item_Description
from fct_iowa_liquor_sales_invoice_header as h
join fct_iowa_liquor_sales_invoice_lineitem as f 
on h.Invoice_Number=f.Invoice_Number
join dim_iowa_liquor_products as p
on f.Item_SK= p.Item_SK
group by p.Item_Number, p.Item_Description;



-- 15. Liquor sales by dimension vendor

select sum(Invoice_Sale_Dollars), v.Vendor_Name
from fct_iowa_liquor_sales_invoice_header as h
join fct_iowa_liquor_sales_invoice_lineitem as f 
on h.Invoice_Number=f.Invoice_Number
join dim_iowa_liquor_products as p
on f.Item_SK= p.Item_SK
join dim_iowa_liquor_vendors as v
on p.Vendor_SK= v.Vendor_SK
group by v.Vendor_Name;

-- Yearly sales including 2022 YTD

select sum(Invoice_Sale_Dollars), 
YEAR('Invoice_Date') AS inv_year
from fct_iowa_liquor_sales_invoice_header
group by inv_year;


-- Top 20 stores (all-time)

select sum(Invoice_Sale_Dollars) as Total_Sales, s.Store_Name
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liquor_stores as s 
on h.Store_SK=s.Store_SK
group by s.Store_Name
order by Total_Sales DESC
Limit 20;

-- Top 20 cities (all-time)

select sum(Invoice_Sale_Dollars) as Total_Sales, a.City
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liquor_stores as s 
on h.Store_SK=s.Store_SK
join dim_iowa_liquor_geo as g
on s.Geo_SK= g.Geo_SK
join dim_iowa_city as a
on g.City_SK= a.City_SK
group by a.City
order by Total_Sales DESC
Limit 20;

-- Top 10 counties (all-time)

select sum(Invoice_Sales_Dollars) as Total_Sales, c.County
from fct_iowa_liquor_sales_invoice_header as h
join dim_iowa_liqour_stores as s 
on h.Store_SK=s.Store_SK
join dim_iowa_liquor_geo as g
on s.Geo_SK= g.Geo_SK
join dim_iowa_county as a
on g.County_SK= a.County_SK
group by a.County
order by Total_Sales DESC
Limit 10;


-- Top 20 categories (all-time)


select sum(Invoice_Sales_Dollars) as Total_Sales, c.Category_Name
from fct_iowa_liquor_sales_invoice_header as h
join fct_iowa_liquor_sales_invoice_lineitem as f 
on h.Invoice_Number=f.Invoice_Number
join dim_iowa_liquor_products as p
on f.Item_SK= p.Item_SK
join dim_iowa_liquor_product_categories as c
on p.Category_SK= c.Category_SK
group by c.Category_Name
order by Total_Sales DESC
Limit 20;



-- Top 50 items (all-time)

select sum(Invoice_Sales_Dollars) as Total_Sales, p.Item_Description
from fct_iowa_liquor_sales_invoice_header as h
join fct_iowa_liquor_sales_invoice_lineitem as f 
on h.Invoice_Number=f.Invoice_Number
join dim_iowa_liquor_products as p
on f.Item_SK= p.Item_SK
group by p.Item_Description
order by Total_Sales DESC
Limit 50;
