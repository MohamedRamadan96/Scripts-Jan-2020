Select dbo.Invoice.PaymentReference  , dbo.invoice.InvoiceID , dbo.Invoice.InvoiceDate , dbo.doctors.name as DoctorName , dbo.invoice.CreditAmount 
 , invoice.TransactionDate , 	datediff(day,(select top 1 InvoiceRemitance.PaymentDate from InvoiceRemitance  where InvoiceRemitance.InvoiceID=Invoice.InvoiceID order by PaymentDate desc),GetDate()) as [Aging]
, (dbo.Invoice.InsurancePaidAmt ) AS ReceivedAmount  ,  (dbo.Invoice.CreditAmount) - (CoalEsce(dbo.Invoice.InsurancePaidAmt,0) ) AS RejectedAmount

from invoice inner join Doctors on invoice.doctorid = doctors.doctorid 
inner join InvoiceRemitance on InvoiceRemitance.InvoiceID = invoice.invoiceid


where dbo.invoice.Resubmit = 1 and InvoiceDate between '2019-01-01' and '2020-01-01'
and datediff(day,(select top 1 InvoiceRemitance.PaymentDate from InvoiceRemitance  where InvoiceRemitance.InvoiceID=Invoice.InvoiceID order by PaymentDate desc),GetDate()) >=40
and datediff(day,(select top 1 InvoiceRemitance.PaymentDate from InvoiceRemitance  where InvoiceRemitance.InvoiceID=Invoice.InvoiceID order by PaymentDate desc),GetDate())<=45
					  
