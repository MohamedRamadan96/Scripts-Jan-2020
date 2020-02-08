delete bad_rows
from DoctorGPData good_rows

inner join DoctorGPData as bad_rows

on   bad_rows.VisitID = good_rows.VisitID and bad_rows.FieldTitle = good_rows.FieldTitle  and bad_rows.FieldGroup = good_rows.FieldGroup 

and bad_rows.DoctorGPDataID>good_rows.DoctorGPDataID