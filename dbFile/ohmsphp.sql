-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 02:09 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ohmsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`) VALUES
(1, 'Joseph Spector', 'admin@mail.com', 'Password@123', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
`appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(1, 'ONLINE', 1, 3, '2023-01-18', '19:10:00', 4, 'Approved', 'gyn'),
(2, 'ONLINE', 2, 1, '2023-01-18', '19:25:00', 1, 'Approved', ''),
(3, 'ONLINE', 3, 2, '2023-01-18', '19:47:00', 3, 'Approved', ''),
(4, 'ONLINE', 4, 7, '2023-01-18', '19:57:00', 7, 'Approved', 'yb'),
(5, 'ONLINE', 5, 5, '2023-01-18', '20:39:00', 6, 'Approved', '');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE IF NOT EXISTS `billing` (
`billingid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingid`, `patientid`, `appointmentid`, `billingdate`, `billingtime`) VALUES
(1, 3, 3, '2023-01-18', '19:46:08'),
(2, 4, 4, '2023-01-18', '19:55:54'),
(3, 5, 5, '2023-01-18', '20:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE IF NOT EXISTS `billing_records` (
`billingservice_id` int(10) NOT NULL,
  `billingid` int(10) NOT NULL,
  `bill_type_id` int(10) NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_records`
--

INSERT INTO `billing_records` (`billingservice_id`, `billingid`, `bill_type_id`, `bill_type`, `bill_amount`, `bill_date`, `status`) VALUES
(1, 0, 4, 'Consultancy Charge', 36.00, '2023-01-18', 'Active'),
(2, 0, 21, 'Treatment', 70.00, '2023-01-18', 'Active'),
(3, 0, 1, 'Prescription Charge', 0.00, '2023-01-18', 'Active'),
(4, 0, 2, 'Prescription Charge', 78.00, '2023-01-18', 'Active'),
(5, 0, 1, 'Consultancy Charge', 1000.00, '2023-01-18', 'Active'),
(6, 0, 23, 'Treatment', 530.00, '2023-01-18', 'Active'),
(7, 0, 3, 'Prescription Charge', 25.00, '2023-01-18', 'Active'),
(8, 1, 3, 'Consultancy Charge', 500.00, '2023-01-18', 'Active'),
(9, 1, 24, 'Treatment', 318.00, '2023-01-18', 'Active'),
(10, 1, 4, 'Prescription Charge', 36.00, '2023-01-18', 'Active'),
(11, 2, 7, 'Consultancy Charge', 995.00, '2023-01-18', 'Active'),
(12, 2, 24, 'Treatment', 318.00, '2023-01-18', 'Active'),
(13, 2, 5, 'Prescription Charge', 0.00, '2023-01-18', 'Active'),
(14, 3, 6, 'Consultancy Charge', 104.00, '2023-01-18', 'Active'),
(15, 3, 26, 'Treatment', 97560.00, '2023-01-18', 'Active'),
(16, 3, 6, 'Prescription Charge', 104.00, '2023-01-18', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
`departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(1, 'Medicine', 'Medicine', 'Active'),
(2, 'Cardiology', 'Provides medical care to patients who have problems with their heart or circulation.', 'Active'),
(3, 'Gynecology', 'Investigates and treats problems relating to the female urinary tract and reproductive organs, such as Endometriosis, infertility and incontinence', 'Active'),
(4, 'Haematology', 'These hospital services work with the laboratory. In addition doctors treat blood diseases and malignancies related to the blood', 'Active'),
(5, 'Maternity', 'Maternity wards provide antenatal care, delivery of babies and care during childbirth, and postnatal support', 'Active'),
(6, 'Nephrology', 'Monitors and assesses patients with various kidney (renal) problems and conditions', 'Active'),
(7, 'Oncology', 'A branch of medicine that deals with cancer and tumors. A medical professional who practices oncology is an oncologist. The Oncology department provides treatments, including radiotherapy and chemotherapy, for cancerous tumors and blood disorders', 'Active'),
(8, 'Orthopaedics', 'Treats conditions related to the musculoskeletal system, including joints, ligaments, bones, muscles, tendons and nerves', 'Active'),
(9, 'Radiology', 'Deals with the study and application of imaging technology like XRay', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
`doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`) VALUES
(1, 'Carol Bosworth', '7002225650', 1, 'carol@mail.com', 'password', 'Active', 'MBBS', 7.0, 1000.00),
(2, 'Sirena S Rivera', '7023695696', 2, 'rivera', 'password', 'Active', 'DM', 4.0, 400.00),
(3, 'Will Williams', '7014545470', 2, 'wiliams', 'password', 'Active', 'DM', 7.0, 500.00),
(4, 'Thomas Borkowski', '7025558690', 3, 'thomas', 'password', 'Active', 'MD', 4.0, 155.00),
(5, 'Jason Graham', '7854025410', 4, 'jason', 'password', 'Active', 'DM', 5.0, 75.00),
(6, 'Viola McRoy', '7410002540', 5, 'viola', 'password', 'Active', 'MD', 8.0, 4200.00),
(7, 'Logan Fletcher', '7012569990', 7, 'logan', 'password', 'Active', 'MD', 5.0, 995.00),
(8, 'Ben Bernier', '7012225470', 6, 'ben', 'password', 'Active', 'DM', 3.0, 689.00);

--
-- Triggers `doctor`
--
DELIMITER //
CREATE TRIGGER `consultationtrigger` BEFORE UPDATE ON `doctor`
 FOR EACH ROW BEGIN
SET NEW.consultancy_charge = IF(NEW.consultancy_charge < 150, 150, 
                                   IF(NEW.consultancy_charge > 1000, 1000, 
                                      NEW.consultancy_charge));
   INSERT INTO log_table (doctorid, old_charge, new_charge, update_date)
   VALUES (NEW.doctorid, OLD.consultancy_charge, NEW.consultancy_charge, NOW());
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE IF NOT EXISTS `doctor_timings` (
`doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `status`) VALUES
(17, 35, '09:30:00', '13:00:00', 'Active'),
(18, 36, '13:30:00', '17:00:00', 'Active'),
(19, 37, '14:00:00', '18:00:00', 'Active'),
(20, 38, '17:00:00', '21:00:00', 'Active'),
(21, 39, '13:00:00', '19:00:00', 'Active'),
(22, 40, '07:00:00', '11:00:00', 'Active'),
(23, 41, '13:30:00', '16:30:00', 'Active'),
(24, 42, '11:30:00', '14:30:00', 'Active'),
(25, 43, '12:30:00', '16:30:00', 'Active'),
(26, 44, '21:30:00', '12:30:00', 'Active'),
(27, 36, '01:03:00', '13:03:00', 'Active'),
(28, 61, '11:11:00', '19:07:00', 'Active'),
(29, 35, '11:11:00', '16:44:00', 'Active'),
(30, 35, '01:10:00', '16:11:00', 'Active'),
(31, 35, '01:02:00', '15:04:00', 'Active'),
(32, 35, '16:25:00', '01:00:00', 'Active'),
(33, 1, '18:00:00', '00:02:00', 'Active'),
(34, 2, '07:36:00', '15:37:00', 'Active'),
(35, 7, '09:24:00', '16:24:00', 'Active'),
(36, 1, '08:00:00', '11:00:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `log_table`
--

CREATE TABLE IF NOT EXISTS `log_table` (
`log_id` int(11) NOT NULL,
  `doctorid` int(11) NOT NULL,
  `old_charge` decimal(11,2) NOT NULL,
  `new_charge` decimal(11,2) NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_table`
--

INSERT INTO `log_table` (`log_id`, `doctorid`, `old_charge`, `new_charge`, `update_date`) VALUES
(1, 1, '150.00', '150.00', '2023-01-14 16:23:00'),
(2, 1, '150.00', '150.00', '2023-01-14 16:26:49'),
(3, 1, '150.00', '1000.00', '2023-01-14 16:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
`medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`) VALUES
(1, 'Paracetamol', 3.00, 'For fever per day 1 pc', 'Active'),
(2, 'Clotrimazole', 14.00, 'Clotrimazole is an antifungal, prescribed for local fungal infections', 'Active'),
(3, 'Miconazole', 26.00, 'Prescribed for various skin infections such as jockitch and also for vaginal yeast infections', 'Active'),
(4, 'Nystatin', 6.00, 'Antifungal drug, prescribed for fungal infections of the skin mouth vagina and intestinal tract', 'Active'),
(5, 'Lotensin', 3.00, 'prevent your body from forming angiotensin', 'Active'),
(6, 'Cozaan', 5.00, 'ARBs block the effects of angiotensin on your heart.', 'Active'),
(7, 'Lovenox', 59.00, 'may prescribe an anticoagulant to prevent heart attack, stroke, or other serious health problems', 'Active'),
(8, 'Abemaciclib', 278.00, 'drug for the treatment of advanced or metastatic breast cancers.', 'Active'),
(9, 'Cyclophosphamide', 231.00, ' to treat lymphoma, multiple myeloma, leukemia, ovarian cancer, breast cancer, small cell lung cancer', 'Active'),
(10, 'Captopril', 92.00, 'used alone or in combination with other medications to treat high blood pressure and heart failure.', 'Active'),
(11, 'Enalapril', 18.00, 'to treat high blood pressure, diabetic kidney disease, and heart failure', 'Active'),
(12, 'Ramipril', 31.00, 'to treat high blood pressure, diabetic kidney disease', 'Active'),
(13, 'Hydroxyurea', 55.00, 'used in sickle-cell disease, essential thrombocythemia, chronic myelogenous leukemia and cervical cancer', 'Active'),
(14, 'Phenprocoumon', 258.00, 'Used for prevention of thrombosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
`patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(1, 'shreyas', '2023-01-18', '19:07:00', 'bangalore', '7878732323', 'bangalore', '560060', 'shreyas@mail.com', 'shreyas123', 'A-', 'MALE', '2002-04-09', 'Active'),
(2, 'saif', '2023-01-18', '19:22:13', 'delhi', '9864696626', 'delhi', '342342', 'saif@mail.com', 'saif@123', 'B+', 'MALE', '2007-05-09', 'Active'),
(3, 'shrujan', '2023-01-18', '19:44:10', 'ssss', '8542852542', 'dfgc ', '342424', 'shrujan@mail.com', 'shrujan123', 'B-', 'MALE', '2023-01-18', 'Active'),
(4, 'shrujana', '2023-01-18', '19:53:08', 'bang', '4172542452', 'bang', '232323', 'shrujan1@mail.com', 'shrujan123', 'O+', 'MALE', '2004-01-15', 'Active'),
(5, 'arya', '2023-01-18', '20:35:06', 'var', '384284524', 'hsd fc', '734874', 'arya@mail.com', 'arya@123', 'AB+', 'MALE', '2005-04-05', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
`paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `appointmentid`, `paiddate`, `paidtime`, `paidamount`, `status`) VALUES
(1, 3, 3, '2023-01-18', '19:47:48', 854.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
`prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `doctorid`, `patientid`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(1, 0, 4, 1, '2023-01-19', 'Active', 1),
(2, 0, 4, 1, '2023-01-18', 'Active', 1),
(3, 0, 1, 2, '2023-01-18', 'Active', 2),
(4, 0, 3, 3, '2023-01-19', 'Active', 3),
(5, 0, 7, 4, '2023-01-18', 'Active', 4),
(6, 0, 6, 5, '2023-01-18', 'Active', 5);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE IF NOT EXISTS `prescription_records` (
`prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(1, 2, '3', 26.00, 3, '1-0-1', 'Active'),
(2, 3, '6', 5.00, 5, '1-1-1', 'Active'),
(3, 4, '4', 6.00, 6, '1-1-1', 'Active'),
(4, 6, '3', 26.00, 4, '1-1-0', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE IF NOT EXISTS `queries` (
`queryid` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` int(15) NOT NULL,
  `department` varchar(25) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`queryid`, `name`, `email`, `phone`, `department`, `message`) VALUES
(1, 'Asha', 'asha@mail.com', 2147483647, 'Medicine', 'Hello, Can I please know the procedure for Appointment'),
(2, 'Daniel', 'daniel@mail.com', 2147483647, 'cardiology', 'Hi, Can I know the modes to make the hospital payments');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE IF NOT EXISTS `service_type` (
`service_type_id` int(10) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE IF NOT EXISTS `treatment` (
`treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`) VALUES
(20, 'Blood Test', '179.00', 'test checks for levels of 10 different components of every major cell in your blood', 'Active'),
(21, 'Electrocardiogram', '70.00', 'Records the electrical activity of the heart', 'Active'),
(22, 'Echocardiogram', '1750.00', 'Provides an ultrasound picture that shows the structure of the heart chambers and surrounding areas, and it can show how well the heart is working.', 'Active'),
(23, 'Nuclear cardiology', '530.00', 'Nuclear imaging techniques use radioactive materials to study cardiovascular disorders and diseases in a noninvasive way.', 'Active'),
(24, 'Colposcopy', '318.00', 'procedure to visually examine the cervix as well as the vagina and vulva using a colposcope.', 'Active'),
(25, 'Colporrhaphy', '5518.00', 'surgical procedure in humans that repairs a defect in the wall of the vagina.', 'Active'),
(26, 'Spine Surgery', '97560.00', 'This entails opening the operative site with a long incision so the surgeon can view and access the spinal anatomy', 'Active'),
(27, 'Trauma surgery', '25448.00', 'surgical specialty that utilizes both operative and non-operative management to treat traumatic injuries, typically in an acute setting', 'Active'),
(28, 'Diagnostic Tests', '989.00', 'may include MRI, CT, Bone Scan, Ultra sound, blood tests', 'Active'),
(29, 'Chest XRay', '258.00', ' projection radiograph of the chest used to diagnose conditions affecting the chest, its contents, and nearby structures', 'Active'),
(30, 'Ultrasound of the Abdomen', '560.00', 'noninvasive procedure used to assess the organs and structures within the abdomen', 'Active'),
(31, 'Exercise Stress Test', '198.00', 'This test is good for evaluating chest pain to see if your heart is the cause.', 'Active'),
(32, 'Ultrasound of the Pelvis', '520.00', 'noninvasive diagnostic exam that produces images that are used to assess organs and structures within the female pelvis', 'Active'),
(33, 'Chemotherapy and Radiatio', '4850.00', 'Most common types of cancer treatment. They work by destroying these fast-growing cells.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE IF NOT EXISTS `treatment_records` (
`treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `doctorid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(1, 21, 1, 1, 4, 'sas', '9791', '2023-01-18', '19:11:00', 'Active'),
(2, 23, 2, 2, 1, 'eded', '11020', '2023-01-18', '19:27:00', 'Active'),
(3, 24, 3, 3, 3, 'gdggs', '7950', '2023-01-18', '19:48:00', 'Active'),
(4, 24, 4, 4, 7, 'lksjgj', '11567', '2023-01-18', '19:00:00', 'Active'),
(5, 26, 5, 5, 6, 'abc', '24665', '2023-01-18', '20:39:00', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`adminid`), ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
 ADD PRIMARY KEY (`appointmentid`), ADD KEY `patientid` (`patientid`), ADD KEY `departmentid` (`departmentid`), ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
 ADD PRIMARY KEY (`billingid`), ADD KEY `patientid` (`patientid`), ADD KEY `appointmentid` (`appointmentid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
 ADD PRIMARY KEY (`billingservice_id`), ADD KEY `billingid` (`billingid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
 ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
 ADD PRIMARY KEY (`doctorid`), ADD KEY `departmentid` (`departmentid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
 ADD PRIMARY KEY (`doctor_timings_id`), ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `log_table`
--
ALTER TABLE `log_table`
 ADD PRIMARY KEY (`log_id`), ADD UNIQUE KEY `log_id` (`log_id`), ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
 ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
 ADD PRIMARY KEY (`patientid`), ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
 ADD PRIMARY KEY (`paymentid`), ADD KEY `patientid` (`patientid`), ADD KEY `appointmentid` (`appointmentid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
 ADD PRIMARY KEY (`prescriptionid`), ADD KEY `doctorid` (`doctorid`), ADD KEY `patientid` (`patientid`), ADD KEY `appointmentid` (`appointmentid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
 ADD PRIMARY KEY (`prescription_record_id`), ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
 ADD PRIMARY KEY (`queryid`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
 ADD PRIMARY KEY (`service_type_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
 ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
 ADD PRIMARY KEY (`treatment_records_id`), ADD KEY `treatmentid` (`treatmentid`), ADD KEY `appointmentid` (`appointmentid`), ADD KEY `patientid` (`patientid`), ADD KEY `doctorid` (`doctorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
MODIFY `billingid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `billing_records`
--
ALTER TABLE `billing_records`
MODIFY `billingservice_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `log_table`
--
ALTER TABLE `log_table`
MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
MODIFY `paymentid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
MODIFY `queryid` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
MODIFY `service_type_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
ADD CONSTRAINT `forapppat` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fordepapp` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fordocapp` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
ADD CONSTRAINT `forbilapp` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `forbilpat` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
ADD CONSTRAINT `fordocdep` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log_table`
--
ALTER TABLE `log_table`
ADD CONSTRAINT `forlogdoc` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
ADD CONSTRAINT `forpayapp` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `forpaypat` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
ADD CONSTRAINT `forpreapp` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `forpredoc` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `forprepat` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prescription_records`
--
ALTER TABLE `prescription_records`
ADD CONSTRAINT `forprerpre` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescriptionid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `treatment_records`
--
ALTER TABLE `treatment_records`
ADD CONSTRAINT `fortrerapp` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fortrerdoc` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fortrerpat` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fortrertre` FOREIGN KEY (`treatmentid`) REFERENCES `treatment` (`treatmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
