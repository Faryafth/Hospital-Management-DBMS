-- Create the Section table
CREATE TABLE Section (
    SectionNum INT PRIMARY KEY,
    SName VARCHAR(50) NOT NULL UNIQUE,
    SHead VARCHAR(100)
);

-- Create the Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    PBD DATE NOT NULL,
    PGender CHAR(1) NOT NULL CHECK (PGender IN ('M', 'F')),
    PAddress VARCHAR(255),
    PPhone VARCHAR(15) NOT NULL,
    SectionNum INT NOT NULL,
    FOREIGN KEY (SectionNum) REFERENCES Section(SectionNum)
);

-- Create the Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL,
    DAddress VARCHAR(255),
    DPhone VARCHAR(15) NOT NULL UNIQUE,
    DSpecialty VARCHAR(50) NOT NULL,
    DSchedule VARCHAR(255)
);

-- Create the Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    AStatus VARCHAR(50) NOT NULL CHECK (AStatus IN ('Scheduled', 'Canceled', 'Completed'))
);

-- Create the ReceptionHistory table
CREATE TABLE ReceptionHistory (
    ReceptionNum INT PRIMARY KEY,
    PatientID INT NOT NULL,
    RDate DATE NOT NULL,
    RDischarge DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create the Bed table
CREATE TABLE Bed (
    BedNum INT PRIMARY KEY,
    SectionNum INT NOT NULL,
    BStatus VARCHAR(50) NOT NULL CHECK (BStatus IN ('Available', 'Occupied')),
    FOREIGN KEY (SectionNum) REFERENCES Section(SectionNum)
);

-- Create the Prescription table
CREATE TABLE Prescription (
    PrescriptionNum INT PRIMARY KEY,
    PDate DATE NOT NULL,
    PDose VARCHAR(255)
);

-- Create the Drug table
CREATE TABLE Drug (
    DrugCode INT PRIMARY KEY,
    DrugName VARCHAR(100) NOT NULL,
    DBrand VARCHAR(50),
    DPrescription VARCHAR(255)
);

-- Create the Bill table
CREATE TABLE Bill (
    BillNum INT PRIMARY KEY,
    BAmount DECIMAL(10, 2) NOT NULL CHECK (BAmount >= 0),
    BDate DATE NOT NULL,
    BStatus VARCHAR(50) NOT NULL CHECK (BStatus IN ('Paid', 'Unpaid', 'Pending')),
    PatientID INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create the Insurance table
CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    ICompany VARCHAR(100) NOT NULL,
    IDetails VARCHAR(255),
    IContact VARCHAR(50)
);

-- Create the MakingAppointment table
CREATE TABLE MakingAppointment (
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentID INT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Create the InsuranceCoverage table
CREATE TABLE InsuranceCoverage (
    InsuranceID INT NOT NULL,
    PatientID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create the WritingPrescription table
CREATE TABLE WritingPrescription (
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    PrescriptionNum INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PrescriptionNum) REFERENCES Prescription(PrescriptionNum)
);

-- Create the DrugsList table
CREATE TABLE DrugsList (
    DrugCode INT NOT NULL,
    PrescriptionNum INT NOT NULL,
    FOREIGN KEY (DrugCode) REFERENCES Drug(DrugCode),
    FOREIGN KEY (PrescriptionNum) REFERENCES Prescription(PrescriptionNum)
);
