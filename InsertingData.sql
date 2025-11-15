INSERT INTO Section (SectionNum, SName, SHead)
VALUES 
(1, 'Cardiology', 'Dr. Smith'),
(2, 'Neurology', 'Dr. Brown'),
(3, 'Pediatrics', 'Dr. Johnson');

INSERT INTO Patient (PatientID, PName, PBD, PGender, PAddress, PPhone, SectionNum)
VALUES
(1, 'John Doe', '1985-06-15', 'M', '123 Main St', '1234567890', 1),
(2, 'Jane Smith', '1990-03-25', 'F', '456 Elm St', '0987654321', 2),
(3, 'Emily Brown', '2005-08-10', 'F', '789 Oak St', '1122334455', 3);

INSERT INTO Doctor (DoctorID, DName, DAddress, DPhone, DSpecialty, DSchedule)
VALUES
(1, 'Dr. Adam White', '12 Park Ave', '5551234567', 'Cardiologist', 'Mon-Fri 9am-5pm'),
(2, 'Dr. Sarah Green', '34 Forest Rd', '5559876543', 'Neurologist', 'Tue-Thu 10am-4pm'),
(3, 'Dr. Chris Black', '56 Maple St', '5556789123', 'Pediatrician', 'Mon-Wed 8am-2pm');

INSERT INTO Appointment (AppointmentID, AStatus)
VALUES
(1, 'Scheduled'),
(2, 'Completed'),
(3, 'Canceled');

INSERT INTO ReceptionHistory (ReceptionNum, PatientID, RDate, RDischarge)
VALUES
(1, 1, '2025-01-01', '2025-01-05'),
(2, 2, '2025-01-03', '2025-01-06'),
(3, 3, '2025-01-07', NULL);

INSERT INTO Bed (BedNum, SectionNum, BStatus)
VALUES
(1, 1, 'Available'),
(2, 1, 'Occupied'),
(3, 2, 'Occupied');

INSERT INTO Prescription (PrescriptionNum, PDate, PDose)
VALUES
(1, '2025-01-02', 'Take 1 tablet daily'),
(2, '2025-01-03', 'Apply twice daily'),
(3, '2025-01-04', 'Take 2 tablets after meals');

INSERT INTO Drug (DrugCode, DrugName, DBrand, DPrescription)
VALUES
(1, 'Aspirin', 'Bayer', 'Pain relief'),
(2, 'Metformin', 'Teva', 'Diabetes treatment'),
(3, 'Amoxicillin', 'Pfizer', 'Antibiotic');

INSERT INTO Bill (BillNum, BAmount, BDate, BStatus, PatientID)
VALUES
(1, 500.00, '2025-01-05', 'Paid', 1),
(2, 300.00, '2025-01-06', 'Unpaid', 2),
(3, 200.00, '2025-01-08', 'Pending', 3);

INSERT INTO Insurance (InsuranceID, ICompany, IDetails, IContact)
VALUES
(1, 'Blue Cross', 'Covers 80% of medical expenses', 'contact@bluecross.com'),
(2, 'United Health', 'Covers 70% of outpatient expenses', 'info@unitedhealth.com'),
(3, 'Aetna', 'Covers 90% of inpatient expenses', 'support@aetna.com');

INSERT INTO MakingAppointment (PatientID, DoctorID, AppointmentID, Date)
VALUES
(1, 1, 1, '2025-01-01'),
(2, 2, 2, '2025-01-03'),
(3, 3, 3, '2025-01-07');

INSERT INTO InsuranceCoverage (InsuranceID, PatientID, StartDate, EndDate)
VALUES
(1, 1, '2025-01-01', '2026-01-01'),
(2, 2, '2025-02-01', '2026-02-01'),
(3, 3, '2025-03-01', '2026-03-01');

INSERT INTO WritingPrescription (PatientID, DoctorID, PrescriptionNum)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO DrugsList (DrugCode, PrescriptionNum)
VALUES
(1, 1),
(2, 2),
(3, 3);

