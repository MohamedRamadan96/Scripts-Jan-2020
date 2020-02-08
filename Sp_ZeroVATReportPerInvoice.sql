USE [ClinicPro]
GO

/****** Object:  StoredProcedure [dbo].[Sp_ZeroVATReportPerInvoice]    Script Date: 30-Jan-20 3:43:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Sp_ZeroVATReportPerInvoice]
	-- Add the parameters for the stored procedure here
	@StDate datetime,
        @EndDate  datetime,
        @BranchID  int,
        @ClinicID  nvarchar,
         @DoctorID   nvarchar   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here



SELECT    Invoice.InvoiceDate, Invoice.InvoiceID,Patients.Name as Patient,FeeCategory.Category,

		   substring(
        (
            Select ','+ST1.Description   AS [text()]
            From dbo.invoicedetail ST1
           
            Where ST1.InvoiceID = Invoice.InvoiceID 
            For XML PATH ('')
        ), 2, 1000) [Description]
,

 sum (InvoiceDetail.TotalNet) as NetAmount ,sum (InvoiceDetail.Vat) as Vat 
    ,sum(InvoiceDetail.TotalNet+InvoiceDetail.Vat) as [Total Amount]
          
FROM         
InvoiceDetail INNER JOIN Invoice ON Invoice.Invoiceid=InvoiceDetail.Invoiceid
 INNER JOIN
                      Doctors ON Invoice.DoctorID = Doctors.DoctorID INNER JOIN
                      Clinics ON Invoice.ClinicID = Clinics.CinicID AND Doctors.ClinicID = Clinics.CinicID
					  inner join Patients on Patients.PatientID=Invoice.PatientID
					  inner join FeeCategory  on FeeCategory.CategoryID=Invoice.[Type]



					  where Invoice.InvoiceDate between @StDate and @EndDate  and Doctors.BranchID=@BranchID 
and InvoiceDetail.VAT<=0  and
Invoice.del=0
AND (Invoice.DoctorID = @DoctorID OR @DoctorID = 0)
AND (Invoice.ClinicID = @ClinicID OR @ClinicID = 0)
 group by Invoice.InvoiceID, Invoice.InvoiceDate,Doctors.Name , Clinics.Clinic,Patients.Name,FeeCategory.Category ,Invoice.CashDisc





union ALL

SELECT     Invoice.InvoiceDate,Invoice.InvoiceID, 

Patients.Name as Patient,FeeCategory.Category,
		     substring(
        (
            Select ','+ST1.Description   AS [text()]
            From dbo.invoicedetail ST1
           
            Where ST1.InvoiceID = Invoice.InvoiceID 
            For XML PATH ('')
        ), 2, 1000) [Description]



,sum (InvoiceDetail.RefundAmount)*-1 as NetAmount ,sum (InvoiceDetail.VatRefundAmount)*-1 as Vat 
          ,sum((InvoiceDetail.RefundAmount*-1)+(InvoiceDetail.VatRefundAmount*-1)) as [Total Amount]
           
FROM         
InvoiceDetail INNER JOIN Invoice ON Invoice.Invoiceid=InvoiceDetail.Invoiceid
 INNER JOIN
                      Doctors ON Invoice.DoctorID = Doctors.DoctorID INNER JOIN
                      Clinics ON Invoice.ClinicID = Clinics.CinicID AND Doctors.ClinicID = Clinics.CinicID
             inner join HTransactions on HTransactions.InvoiceNo = Invoice.InvoiceID inner join HTransactionsRefund on
                      HTransactionsRefund.TreansactionID = HTransactions.TreansactionID 

					  inner join Patients on Patients.PatientID=Invoice.PatientID
					  inner join FeeCategory  on FeeCategory.CategoryID=Invoice.[Type]





 where HTransactionsRefund.RefundDate between @StDate and @EndDate  and Doctors.BranchID=@BranchID 
and InvoiceDetail.VAT<=0  and
Invoice.del=0
AND (Invoice.DoctorID = @DoctorID OR @DoctorID = 0)
AND (Invoice.ClinicID = @ClinicID OR @ClinicID = 0)
 group by Invoice.InvoiceID, Invoice.InvoiceDate,Doctors.Name , Clinics.Clinic,Patients.Name,FeeCategory.Category ,Invoice.CashDisc





union ALL

SELECT      Invoice.InvoiceDate,Invoice.InvoiceID,Patients.Name as Patient,FeeCategory.Category,
		     substring(
        (
            Select ','+ST1.Description   AS [text()]
            From dbo.invoicedetail ST1
           
            Where ST1.InvoiceID = Invoice.InvoiceID 
            For XML PATH ('')
        ), 2, 1000) [Description],sum (InvoiceDetail.BadDebit)*-1 as NetAmount ,sum (InvoiceDetail.BadDebitVAT)*-1 as Vat 
          ,sum((InvoiceDetail.BadDebit*-1)+(InvoiceDetail.BadDebitVAT*-1))as [Total Amount]
           



FROM         
InvoiceDetail INNER JOIN Invoice ON Invoice.Invoiceid=InvoiceDetail.Invoiceid
 INNER JOIN
                      Doctors ON Invoice.DoctorID = Doctors.DoctorID INNER JOIN
                      Clinics ON Invoice.ClinicID = Clinics.CinicID AND Doctors.ClinicID = Clinics.CinicID
             inner join InvoiceDetailBadDebit on InvoiceDetailBadDebit.InvoiceID = Invoice.InvoiceID
			 inner join Patients on Patients.PatientID=Invoice.PatientID
					  inner join FeeCategory  on FeeCategory.CategoryID=Invoice.[Type]


 where InvoiceDetailBadDebit.BadDebitDate between @StDate and @EndDate  and Doctors.BranchID=@BranchID 
and InvoiceDetail.VAT<=0  and
Invoice.del=0
AND (Invoice.DoctorID = @DoctorID OR @DoctorID = 0)
AND (Invoice.ClinicID = @ClinicID OR @ClinicID = 0)
 group by Invoice.InvoiceID, Invoice.InvoiceDate,Doctors.Name , Clinics.Clinic,Patients.Name,FeeCategory.Category ,Invoice.CashDisc









END




GO


