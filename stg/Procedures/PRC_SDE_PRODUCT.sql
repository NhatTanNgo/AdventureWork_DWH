CREATE PROCEDURE [STG].PRC_SDE_PRODUCTION_PRODUCT
    @pLAST_EXTRACT_TIME DATE
  , @p_JobID            INT
AS
BEGIN
    DECLARE @W_EXTRACT_DATE DATETIME = DATEADD(HOUR, 7, GETUTCDATE())

    --Truncate staging table 
    TRUNCATE TABLE [STG].[Product];

    --Extract incremental data
    WITH CTE
    AS (SELECT DISTINCT
               [ProductID]
             , [Name]
             , [ProductNumber]
             , [MakeFlag]
             , [FinishedGoodsFlag]
             , [Color]
             , [SafetyStockLevel]
             , [ReorderPoint]
             , [StandardCost]
             , [ListPrice]
             , [Size]
             , [SizeUnitMeasureCode]
             , [WeightUnitMeasureCode]
             , [Weight]
             , [DaysToManufacture]
             , [ProductLine]
             , [Class]
             , [Style]
             , [ProductSubcategoryID]
             , [ProductModelID]
             , [SellStartDate]
             , [SellEndDate]
             , [DiscontinuedDate]
             , [rowguid]
             , [ModifiedDate]
        FROM [AdventureWorks2019].[Production].[Product]
        WHERE [ModifiedDate] >= CAST(ISNULL(@pLAST_EXTRACT_TIME, [ModifiedDate]) AS DATETIME))

    --INSERT INTO STAGING TABLE
    INSERT INTO [STG].[Product]
    (
        [ProductID]
      , [Name]
      , [ProductNumber]
      , [MakeFlag]
      , [FinishedGoodsFlag]
      , [Color]
      , [SafetyStockLevel]
      , [ReorderPoint]
      , [StandardCost]
      , [ListPrice]
      , [Size]
      , [SizeUnitMeasureCode]
      , [WeightUnitMeasureCode]
      , [Weight]
      , [DaysToManufacture]
      , [ProductLine]
      , [Class]
      , [Style]
      , [ProductSubcategoryID]
      , [ProductModelID]
      , [SellStartDate]
      , [SellEndDate]
      , [DiscontinuedDate]
      , [rowguid]
      , [ModifiedDate]
      , W_EXTRACT_DATE
    )
    SELECT [ProductID]
         , [Name]
         , [ProductNumber]
         , [MakeFlag]
         , [FinishedGoodsFlag]
         , [Color]
         , [SafetyStockLevel]
         , [ReorderPoint]
         , [StandardCost]
         , [ListPrice]
         , [Size]
         , [SizeUnitMeasureCode]
         , [WeightUnitMeasureCode]
         , [Weight]
         , [DaysToManufacture]
         , [ProductLine]
         , [Class]
         , [Style]
         , [ProductSubcategoryID]
         , [ProductModelID]
         , [SellStartDate]
         , [SellEndDate]
         , [DiscontinuedDate]
         , [rowguid]
         , [ModifiedDate]
         , @W_EXTRACT_DATE
    FROM CTE

    SELECT DATEADD(HOUR, 7, GETUTCDATE()) AS LAST_EXTRACT_VALUE;
END