USE [ClinicPro]
GO

/****** Object:  View [dbo].[VClaimFormDetailDentalCPTICD9]    Script Date: 1/15/2019 3:10:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[VClaimFormDetailDentalCPTICD9]
AS
SELECT     ICD9 AS Code, Diagnosis AS Description, WaitingID, 'ICD9' AS Type
FROM         dbo.PatientClaimFormDetail
UNION ALL
SELECT     Code, Description, WaitingID, Type
FROM         dbo.VPatientClaimLab
UNION ALL
SELECT     Code, Description, WaitingID, Type
FROM         dbo.VPatientClaimRadiology
UNION ALL
SELECT     ObservationCode, Notes, WaitingID, 'Observation' AS Type
FROM         dbo.PatientCPTRequestsObservation

GO


