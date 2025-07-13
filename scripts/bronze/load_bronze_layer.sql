CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';
        
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\sql_data_warehouse\datasets\source_crm\cust_info.csv'
        WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\sql_data_warehouse\datasets\source_crm\sales_details.csv'
        WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @start_time = GETDATE();
            TRUNCATE TABLE bronze.crm_prd_info;
            BULK INSERT bronze.crm_prd_info
            FROM 'D:\sql_data_warehouse\datasets\source_crm\prd_info.csv'
            WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\sql_data_warehouse\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\sql_data_warehouse\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\sql_data_warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIELDTERMINATOR = ',',
            TABLOCK,
            FIRSTROW = 2
        );
        SET @end_time = GETDATE();
        PRINT 'Loading time' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' seconds.';

        SET @batch_end_time = GETDATE();
        PRINT 'Batch loading time' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS VARCHAR) + ' seconds.';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH
END;
