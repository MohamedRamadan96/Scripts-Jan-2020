USE [ClinicPro]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDoctorGPData_ByFieldTitle_ByVisitID]    Script Date: 05-Jan-20 3:01:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description, ,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetDoctorGPData_ByFieldTitle_ByVisitID]

    @VisitID   int,
    @FieldTitle  nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     dbo.DoctorGPData.DoctorGPDataID, dbo.DoctorGPData.IsHead, dbo.DoctorGPData.ControlGroupID, 
                      dbo.DoctorGPData.FieldTitle
                      , CONVERT(smallint, COALESCE (dbo.DoctorGPData.FieldStatus, 3)) AS FieldStatusID,
                       dbo.DoctorGPData.FieldGroup, 
                      dbo.DoctorGPData.PatientID, COALESCE (dbo.DoctorGPData.ControlName, 'Text') AS ControlName, dbo.DoctorGPData.VisitID, dbo.DoctorGPData.Comment, 
                      dbo.DoctorGPData.SecondID, dbo.DoctorGPData.ChildAffect, dbo.DoctorGPData.ParentID, dbo.DoctorGPData.FieldType, 
                      dbo.DoctorGPData.DropDownGroupID, COALESCE (dbo.DoctorGPData.LookupID, 0) AS LookupID, DoctorGPData.DispalyOrder
FROM                        dbo.DoctorGPData
WHERE     (dbo.DoctorGPData.VisitID = @VisitID ) AND 
                     (dbo.DoctorGPData.FieldGroup = @FieldTitle)
Order By DoctorGPData.DispalyOrder                     



	
END




GO


