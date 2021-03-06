---Customer_Personal_Information

Create Table Customer_Personal_Info
(
CUSTOMER_ID INT NOT NULL IDENTITY(1,1),
CUSTOMER_NAME VARCHAR(30) NOT NULL,
DATE_OF_BIRTH DATE NULL,
GUARDIAN_NAME VARCHAR(30) NOT NULL,
CUSTOMER_ADDRESS VARCHAR(50) NULL,
CONTACT_NUMBER bigint NULL,
MAIL_ID VARCHAR(30) NULL,
GENDER CHAR(1) NOT NULL,
MARITAL_STATUS VARCHAR(10) NOT NULL,
IDENTIFICATION_DOC_TYPE VARCHAR(20) NOT NULL,
ID_DOC_NO VARCHAR(20) NOT NULL,
CITIZENSHIP VARCHAR(10) NOT NULL,
CONSTRAINT CUST_PERS_INFO_PK PRIMARY KEY(CUSTOMER_ID)
);


Create Table Customer_Reference_Info 
(
CUSTOMER_ID INT NOT NULL IDENTITY(1,1),
REFERENCE_ACC_NAME VARCHAR(20) NOT NULL,
REFERENCE_ACC_NO BIGINT NOT NULL,
REFERENCE_ACC_ADDRESS VARCHAR(50) NOT NULL,
RELATION VARCHAR(25) NOT NULL,
CONSTRAINT PK_Customer_Reference_Info PRIMARY KEY(CUSTOMER_ID),
CONSTRAINT FK_Customer_Reference_Info_Customer_Personal_Info FOREIGN KEY(CUSTOMER_ID) REFERENCES Customer_Personal_Info (CUSTOMER_ID),
);

----BANK INFORMATION TABLE--
CREATE TABLE BANK_INFO
(
BANK_CODE VARCHAR(15),
BANK_NAME VARCHAR(25),
BRANCH_NAME VARCHAR(25),
CONSTRAINT BANK_INFO_PK  PRIMARY KEY(BANK_CODE)
);

------BANK ACCOUNTS TABLE---
CREATE TABLE ACCOUNT_INFO
(
ACCOUNT_NO BIGINT NOT NULL IDENTITY(1,1),
CUSTOMER_ID INT NOT NULL,
ACCOUNT_TYPE VARCHAR(10),
REGISTRATION_DATE DATE,
ACTIVATION_DATE DATE,
BANK_CODE VARCHAR(15),
INTEREST DECIMAL(7,2),
INITIAL_DEPOSIT BIGINT,
CONSTRAINT ACCOUNT_INFO_PK PRIMARY KEY (ACCOUNT_NO),
CONSTRAINT FK_ACCOUNT_INFO_CUSTOMER_PERSONAL_INFO FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER_PERSONAL_INFO(CUSTOMER_ID),
CONSTRAINT FK_ACCOUNT_INFO_BANK_INFO FOREIGN KEY(BANK_CODE) REFERENCES BANK_INFO(BANK_CODE)
);

