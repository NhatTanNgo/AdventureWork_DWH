CREATE TABLE [STG].[Location]
(
    [LocationID]   INT          NULL
  , [Name]         NVARCHAR(500)
  , [CostRate]     FLOAT        NULL
  , [Availability] FLOAT        NULL
  , [ModifiedDate] [datetime]   NOT NULL
  , W_EXTRACT_DATE DATETIME
)