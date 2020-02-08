

INSERT INTO [ClinicPro].[dbo].[Observation]
           ([ProcedureType]
           ,[ProcedureCode]
           ,[ProcedureDesc]
           ,[ObservationType]
           ,[ObservationCode]
           --,[ObservationValue]
           ,[ObservationValueType]
           ,[ObservationDesc]
           ,[AlternativeCode]
           ,[Factor])
           
           
  SELECT 
  3
   ,[cptcode]
  ,[testname]
  ,'LOINC'
  ,[LOINC Code]
  ,[LOINC Unit]
  ,[paramname]
  ,[cptcode]
  ,1
  FROM [ClinicProBK].[dbo].[LonicCodesForLab]
 
GO






INSERT INTO [ClinicPro].[dbo].[Observation]
           ([ProcedureType]
           ,[ProcedureCode]
           ,[ProcedureDesc]
           ,[ObservationType]
           ,[ObservationCode]
           --,[ObservationValue]
           ,[ObservationValueType]
           ,[ObservationDesc]
           ,[AlternativeCode]
           ,[Factor])
  values( 
  3
   ,'82947'
  ,'Glucose Fasting (F.B.S.)'
  ,'LOINC'
  ,'14996-3'
  ,'mmol/L'
  ,'Glucose, Fasting'
  ,'82947'
  ,1)
 
 
GO



INSERT INTO [ClinicPro].[dbo].[Observation]
           ([ProcedureType]
           ,[ProcedureCode]
           ,[ProcedureDesc]
           ,[ObservationType]
           ,[ObservationCode]
           --,[ObservationValue]
           ,[ObservationValueType]
           ,[ObservationDesc]
           ,[AlternativeCode]
           ,[Factor])
  values
  ( 
  3
   ,'82947'
  ,'Glucose Fasting (F.B.S.)'
  ,'LOINC'
  ,'14996-3'
  ,'mmol/L'
  ,'Glucose, Random'
  ,'82947'
  ,1
)
 
GO





