select * from reportmaster where ReportID in ( 233 , 239 , 245 , 246 , 248 , 254 )

-- Insert New Report Group
insert into ReportMasterGroup ( ReportGroupID , ReportGroupAr , ReportGroupEn , Visible )
values ( 18 , 'تقارير ضريبة القيمة المضافة ' , 'VAT Reports' , 1 )
-- Update 6 vat reports to Vat Report Group
update ReportMaster set ReportGroupID = 18 where ReportID in ( 233 , 239 , 245 , 246 , 248 , 254 )
update ReportMaster set SPName = 'SpR_VATReport' where ReportID = 233
update ReportMaster set SPName = 'SpR_ZeroVATReportPerCode' where ReportID = 239
update ReportMaster set SPName = 'SpR_VATReportPerInvoice' Where ReportID = 245
update ReportMaster set SPName = 'SpR_ZeroVATReportPerInvoice' Where ReportID = 246
update ReportMaster set SPName = NULL Where ReportID = 248
update ReportMaster set SPName = NULL  Where ReportID = 254

UPDATE ReportMaster set ReportArTitle='

تقرير ملاحظات الائتمان الضريبية', ReportEnTitle = 'TAX Credit Notes Report' where ReportID = 248

-- insert new report ( Refund Amount ) 
insert into ReportMaster ( ReportID , ReportArTitle , ReportEnTitle , Admin , ReportGroupID ,ReportName , Dates , BranchID )
values ( 254 ,'المبالغ المستردة' , 'Refund Amount' , 1 , 18 , 'HTransactionRefund.rpt' , 1 , 1 )


