delete bad_rows
from DoctorGPDataControlGroups good_rows

inner join DoctorGPDataControlGroups as bad_rows

on   bad_rows.FieldTitle = good_rows.FieldTitle  and bad_rows.FieldGroup = good_rows.FieldGroup 

and bad_rows.ID>good_rows.ID