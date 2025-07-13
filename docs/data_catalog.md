# Data Catalog for Bronze Layer

## Overview

The Bronze Layer contains raw, unvalidated data directly ingested from source systems. It serves as a historical archive and a landing zone for subsequent data transformations.

-----

### 1\. **bronze\_crm\_cust\_info**

  - **Purpose:** Raw data from the bronze crm cust info system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| cst\_id | FLOAT | A unique identifier or key for the respective entity in the bronze crm cust info table. |
| cst\_key | NVARCHAR(255) | A unique identifier or key for the respective entity in the bronze crm cust info table. |
| cst\_firstname | NVARCHAR(255) | The first name of an individual, typically a customer. |
| cst\_lastname | NVARCHAR(255) | The last name or surname of an individual, typically a customer. |
| cst\_marital\_status | NVARCHAR(255) | The current status, such as marital status or order status. |
| cst\_gndr | NVARCHAR(255) | The gender of an individual. |
| cst\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 2\. **bronze\_crm\_prd\_info**

  - **Purpose:** Raw data from the bronze crm prd info system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| prd\_id | INT | A unique identifier or key for the respective entity in the bronze crm prd info table. |
| prd\_key | NVARCHAR(255) | A unique identifier or key for the respective entity in the bronze crm prd info table. |
| prd\_nm | NVARCHAR(255) | The descriptive name for the prd. |
| prd\_cost | FLOAT | The cost associated with a product or item. |
| prd\_line | NVARCHAR(255) | The product line or series to which an item belongs. |
| prd\_start\_dt | DATE | The effective start date of a record's validity or product availability. |
| prd\_end\_dt | DATE | The effective end date of a record's validity or product availability. |

-----

### 3\. **bronze\_crm\_sales\_details**

  - **Purpose:** Raw data from the bronze crm sales details system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| sls\_ord\_num | NVARCHAR(255) | Raw data attribute representing the sls ord num as ingested from the source system. |
| sls\_prd\_key | NVARCHAR(255) | Unique identifier for a sales order or transaction line item. |
| sls\_cust\_id | INT | Unique identifier for a sales order or transaction line item. |
| sls\_order\_dt | INT | The date when a sales order was placed. |
| sls\_ship\_dt | INT | The date when a sales order was shipped. |
| sls\_due\_dt | INT | The date when a payment or action related to an order was due. |
| sls\_sales | FLOAT | The total sales amount for a specific line item or transaction. |
| sls\_quantity | INT | The numerical quantity of items or units involved in the sls. |
| sls\_price | FLOAT | The unit price of a product. |

-----

### 4\. **bronze\_erp\_cust\_az12**

  - **Purpose:** Raw data from the bronze erp cust az12 system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| CID | NVARCHAR(255) | A unique identifier or key for the respective entity in the bronze erp cust az12 table. |
| BDATE | DATE | The date of birth for an individual. |
| GEN | NVARCHAR(255) | The gender of an individual. |

-----

### 5\. **bronze\_erp\_loc\_a101**

  - **Purpose:** Raw data from the bronze erp loc a101 system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| CID | NVARCHAR(255) | Unique identifier for a location or related entity. |
| CNTRY | NVARCHAR(255) | The country associated with a customer or location. |

-----

### 6\. **bronze\_erp\_px\_cat\_g1v2**

  - **Purpose:** Raw data from the bronze erp px cat g1v2 system, directly ingested with minimal transformation.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| ID | NVARCHAR(255) | A unique identifier or key for the respective entity in the bronze erp px cat g1v2 table. |
| CAT | NVARCHAR(255) | The high-level category or classification for a product. |
| SUBCAT | NVARCHAR(255) | The high-level category or classification for a product. |
| MAINTENANCE | NVARCHAR(255) | Indicates whether maintenance is required for a product. |

-----

# Data Catalog for Silver Layer

## Overview

The Silver Layer consists of cleansed, conformed, and integrated data. It’s structured for initial analysis and provides a reliable foundation for the Gold Layer.

-----

### 1\. **silver\_crm\_cust\_info**

  - **Purpose:** Curated and cleaned data for silver crm cust info. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| cst\_id | INT | A unique identifier or key for the respective entity in the silver crm cust info table. |
| cst\_key | NVARCHAR(255) | A unique identifier or key for the respective entity in the silver crm cust info table. |
| cst\_firstname | NVARCHAR(255) | The first name of an individual, typically a customer. |
| cst\_lastname | NVARCHAR(255) | The last name or surname of an individual, typically a customer. |
| cst\_marital\_status | NVARCHAR(255) | The current status, such as marital status or order status. |
| cst\_gndr | NVARCHAR(255) | The gender of an individual. |
| cst\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 2\. **silver\_crm\_prd\_info**

  - **Purpose:** Curated and cleaned data for silver crm prd info. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| prd\_id | INT | A unique identifier or key for the respective entity in the silver crm prd info table. |
| cat\_id | NVARCHAR(255) | A unique identifier or key for the respective entity in the silver crm prd info table. |
| prd\_key | NVARCHAR(255) | A unique identifier or key for the respective entity in the silver crm prd info table. |
| prd\_nm | NVARCHAR(255) | The descriptive name for the prd. |
| prd\_cost | INT | The cost associated with a product or item. |
| prd\_line | NVARCHAR(255) | The product line or series to which an item belongs. |
| prd\_start\_dt | DATE | The effective start date of a record's validity or product availability. |
| prd\_end\_dt | DATE | The effective end date of a record's validity or product availability. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 3\. **silver\_crm\_sales\_details**

  - **Purpose:** Curated and cleaned data for silver crm sales details. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| sls\_ord\_num | NVARCHAR(255) | Cleaned and conformed data attribute representing the sls ord num, prepared for further analysis. |
| sls\_prd\_key | NVARCHAR(255) | Unique identifier for a sales order or transaction line item. |
| sls\_cust\_id | INT | Unique identifier for a sales order or transaction line item. |
| sls\_order\_dt | DATE | The date when a sales order was placed. |
| sls\_ship\_dt | DATE | The date when a sales order was shipped. |
| sls\_due\_dt | DATE | The date when a payment or action related to an order was due. |
| sls\_sales | INT | The total sales amount for a specific line item or transaction. |
| sls\_quantity | INT | The numerical quantity of items or units involved in the sls. |
| sls\_price | INT | The unit price of a product. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 4\. **silver\_erp\_cust\_az12**

  - **Purpose:** Curated and cleaned data for silver erp cust az12. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| cid | NVARCHAR(255) | A unique identifier or key for the respective entity in the silver erp cust az12 table. |
| bdate | DATE | The date of birth for an individual. |
| gen | NVARCHAR(255) | The gender of an individual. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 5\. **silver\_erp\_loc\_a101**

  - **Purpose:** Curated and cleaned data for silver erp loc a101. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| cid | NVARCHAR(255) | Unique identifier for a location or related entity. |
| cntry | NVARCHAR(255) | The country associated with a customer or location. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

### 6\. **silver\_erp\_px\_cat\_g1v2**

  - **Purpose:** Curated and cleaned data for silver erp px cat g1v2. This layer integrates data from multiple sources and applies quality checks.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| id | NVARCHAR(255) | A unique identifier or key for the respective entity in the silver erp px cat g1v2 table. |
| cat | NVARCHAR(255) | The high-level category or classification for a product. |
| subcat | NVARCHAR(255) | The high-level category or classification for a product. |
| maintenance | NVARCHAR(255) | Indicates whether maintenance is required for a product. |
| dwh\_create\_date | DATE | The timestamp or date when the record was initially created or ingested. |

-----

# Data Catalog for Gold Layer

## Overview

The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact tables** for specific business metrics.

-----

### 1\. **gold\_dim\_customers**

  - **Purpose:** Stores customer details enriched with demographic and geographic data.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| customer\_key | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| customer\_id | INT | Unique numerical identifier assigned to each customer. |
| customer\_number | NVARCHAR(255) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first\_name | NVARCHAR(255) | The customer's first name, as recorded in the system. |
| last\_name | NVARCHAR(255) | The customer's last name or family name. |
| country | NVARCHAR(255) | The country of residence for the customer (e.g., 'Australia'). |
| marital\_status | NVARCHAR(255) | The marital status of the customer (e.g., 'Married', 'Single'). |
| gender | NVARCHAR(255) | The gender of the customer (e.g., 'Male', 'Female', 'n/a'). |
| create\_date | DATE | The date and time when the customer record was created in the system |
| birthdate | DATE | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06). |

-----

### 2\. **gold\_dim\_products**

  - **Purpose:** Provides information about the products and their attributes.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| product\_key | INT | Surrogate key uniquely identifying each product record in the product dimension table. |
| product\_id | INT | A unique identifier assigned to the product for internal tracking and referencing. |
| product\_number | NVARCHAR(255) | A structured alphanumeric code representing the product, often used for categorization or inventory. |
| product\_name | NVARCHAR(255) | Descriptive name of the product, including key details such as type, color, and size. |
| category\_id | NVARCHAR(255) | A unique identifier for the product's category, linking to its high-level classification. |
| category | NVARCHAR(255) | The broader classification of the product (e.g., Bikes, Components) to group related items. |
| subcategory | NVARCHAR(255) | A more detailed classification of the product within the category, such as product type. |
| maintenance | NVARCHAR(255) | Indicates whether maintenance is required for a product. |
| cost | INT | The cost or base price of the product, measured in monetary units. |
| product\_line | NVARCHAR(255) | The specific product line or series to which the product belongs (e.g., Road, Mountain). |
| start\_date | DATE | The date when the product became available for sale or use, stored in |
| end\_date | FLOAT | The date when the product was no longer available or was retired. |

-----

### 3\. **gold\_fact\_sales**

  - **Purpose:** Stores transactional sales data for analytical purposes.
  - **Columns:**

| Column Name | Data Type | Description |
|---------------|---------------|-----------------------------------------------------------------------------------------------|
| order\_number | NVARCHAR(255) | A unique alphanumeric identifier for each sales order (e.g., 'SO54496'). |
| product\_key | INT | Surrogate key linking the order to the product dimension table. |
| customer\_key | INT | Surrogate key linking the order to the customer dimension table. |
| order\_date | DATE | The date when the order was placed. |
| ship\_date | DATE | The date when a sales order was shipped. |
| due\_date | DATE | The date when the order payment was due. |
| sales\_amount | INT | The total monetary value of the sale for the line item, in whole currency units (e.g., 25). |
| quantity | INT | The number of units of the product ordered for the line item (e.g., 1). |
| price | INT | The price per unit of the product for the line item, in whole currency units (e.g., 25). |

Generated using Gemini
