USE [ClinicPro]
GO

/****** Object:  View [dbo].[VPatientClaimICD9]    Script Date: 1/15/2019 3:29:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[VPatientClaimICD9]
AS
SELECT     ICD9 AS Code, Diagnosis AS Description,  Type + ' Diagnosis' AS Type, WaitingID,Comment
FROM         dbo.PatientClaimFormDetail
--UNION ALL
--SELECT     ICD9 AS Code, Diagnosis AS Description,  Type + ' Diagnosis' AS Type, WaitingID,'' as Comment
--FROM         dbo.PatientClaimFormDetailDental



GO


