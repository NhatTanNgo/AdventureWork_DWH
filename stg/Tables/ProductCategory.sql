CREATE TABLE [STG].[ProductCategory]
(
    [ProductCategoryID] INT           NOT NULL
  , [Name]              NVARCHAR(200) NOT NULL
  , [rowguid]           NVARCHAR(500) NULL
  , [ModifiedDate]      DATETIME      NULL
  , W_EXTRACT_DATE      DATETIME
)