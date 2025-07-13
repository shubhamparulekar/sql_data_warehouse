/*
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)
    Each view performs transformations and combines data from the Silver layer 
*/

-- Create Dimension: gold.dim_customers

CREATE view gold.dim_customers AS
SELECT
    row_number() over (order by ci.cst_id) as customer_key,
    ci.cst_id as customer_id, 
    ci.cst_key as customer_number, 
    ci.cst_firstname as first_name, 
    ci.cst_lastname as last_name, 
    la.cntry as country,
    ci.cst_marital_status as marital_status, 
    case when ci.cst_gndr != 'n/a' then ci.cst_gndr 
        else COALESCE(ca.gen,'n/a')
        end as gender,
    ci.cst_create_date as create_date,
    ca.bdate as birthdate 
FROM silver.crm_cust_info ci
LEFT join silver.erp_cust_az12 ca 
on ci.cst_key = ca.cid
LEFT join silver.erp_loc_a101 la
on ci.cst_key = la.cid


-- Create Dimension: gold.dim_products
  
CREATE view gold.dim_products AS
SELECT
ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key,
    pn.prd_id as product_id,
    pn.prd_key as product_number,
    pn.prd_nm as product_name,
    pn.cat_id as category_id,
    pc.cat as category,
    pc.subcat as subcategory,
    pc.maintenance,
    pn.prd_cost as cost,
    pn.prd_line as product_line,
    pn.prd_start_dt as start_date,
    pn.prd_end_dt as end_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pn.cat_id = pc.id
where pn.prd_end_dt is NULL


-- Create Fact: gold.fact_sales
  
CREATE view  gold.fact_sales AS
SELECT
    sd.sls_ord_num as order_number,
    pr.product_key as product_key,
    cu.customer_key as customer_key,
    sd.sls_order_dt as order_date,
    sd.sls_ship_dt as ship_date,
    sd.sls_due_dt as due_date,
    sd.sls_sales as sales_amount,
    sd.sls_quantity as quantity,
    sd.sls_price as price
from silver.crm_sales_details sd
left join gold.dim_products pr
on sd.sls_prd_key = pr.product_number
left join gold.dim_customers cu
on sd.sls_cust_id = cu.customer_id
