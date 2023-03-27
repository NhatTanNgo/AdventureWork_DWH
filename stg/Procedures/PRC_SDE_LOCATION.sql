CREATE PROCEDURE PRC_SDE_PRODUCTION_LOCATION
    @pLAST_EXTRACT_TIME DATE
  , @p_JobID            INT
AS
BEGIN
    DECLARE @W_EXTRACT_DATE DATETIME = DATEADD(HOUR, 7, GETUTCDATE())

    --Truncate staging table 
    TRUNCATE TABLE [STG].[Location];

    --Extract incremental data
    WITH CTE
    AS (SELECT DISTINCT
               [LocationID]
             , [Name]
             , [CostRate]
             , [Availability]
             , [ModifiedDate]
        FROM [AdventureWorks2019].[Production].[Location]
        WHERE [ModifiedDate] >= CAST(ISNULL(@pLAST_EXTRACT_TIME, [ModifiedDate]) AS DATETIME))

    --INSERT INTO STAGING TABLE
    INSERT INTO [STG].[Location]
    (
        [LocationID]
      , [Name]
      , [CostRate]
      , [Availability]
      , [ModifiedDate]
      , W_EXTRACT_DATE
    )
    SELECT [LocationID]
         , [Name]
         , [CostRate]
         , [Availability]
         , [ModifiedDate]
         , @W_EXTRACT_DATE
    FROM CTE

    SELECT DATEADD(HOUR, 7, GETUTCDATE()) AS LAST_EXTRACT_VALUE;
END