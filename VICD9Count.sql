USE [ClinicPro]
GO

/****** Object:  View [dbo].[VICD9Count]    Script Date: 1/15/2019 3:13:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[VICD9Count]
AS
SELECT     WaitingID, COUNT(PatientClaimDetailID) AS CountICD9
FROM         dbo.PatientClaimFormDetail
GROUP BY WaitingID
--UNION ALL
--SELECT     WaitingID AS WaitingID, COUNT(WaitingID) AS CountICD9
--FROM         dbo.PatientClaimFormDetailDental
--GROUP BY WaitingID

GO


