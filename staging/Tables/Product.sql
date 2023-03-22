CREATE TABLE [STG].Product
(
    [ProductID]           INT
  , [Name]                NVARCHAR(500) NULL
  , [ProductNumber]       NVARCHAR(25)  NULL
  , MakeFlag              INT           NULL
  , FinishedGoodsFlag     INT           NULL
  , Color                 NVARCHAR(15)  NULL
  , SafetyStockLevel      SMALLINT      NULL
  , ReorderPoint          SMALLINT      NULL
  , StandardCost          FLOAT         NULL
  , ListPrice             FLOAT         NULL
  , Size                  NVARCHAR(5)   NULL
  , SizeUnitMeasureCode   NCHAR(3)      NULL
  , WeightUnitMeasureCode NCHAR(3)      NULL
  , Weight                FLOAT         NULL
  , DaysToManufacture     INT           NULL
  , ProductLine           NCHAR(2)      NULL
  , Class                 NCHAR(2)      NULL
  , Style                 NCHAR(2)      NULL
  , ProductSubcategoryID  INT           NULL
  , ProductModelID        INT           NULL
  , SellStartDate         DATETIME      NULL
  , SellEndDate           DATETIME      NULL
  , DiscontinuedDate      DATETIME      NULL
  , rowguid               NVARCHAR(500) NULL
  , ModifiedDate          DATETIME      NULL
  , W_EXTRACT_DATE        DATETIME
)