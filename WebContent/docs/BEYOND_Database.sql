-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI_QUOTES,MYSQL323' */;


--
-- Create schema beyond_db
--

CREATE DATABASE IF NOT EXISTS beyond_db;
USE beyond_db;

--
-- Temporary table structure for view "vw_auto_responses"
--
CREATE TABLE "vw_auto_responses" (
  "id" int(10) unsigned,
  "response_type_id" int(10) unsigned,
  "response_type_name" varchar(50),
  "response_html" text,
  "response_subject" varchar(200),
  "profile_id" int(10) unsigned,
  "template_id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_customer_customergroups"
--
CREATE TABLE "vw_customer_customergroups" (
  "id" int(10) unsigned,
  "customer_id" int(10) unsigned,
  "first_name" varchar(60),
  "last_name" varchar(60),
  "email" varchar(100),
  "group_id" int(10) unsigned,
  "group_name" varchar(60),
  "user_id" bigint(11) unsigned,
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_customers"
--
CREATE TABLE "vw_customers" (
  "id" int(10) unsigned,
  "group_id" int(10) unsigned,
  "subscription_status_id" int(10) unsigned,
  "subscription_status" varchar(45),
  "user_id" int(10) unsigned,
  "title" varchar(45),
  "first_name" varchar(60),
  "last_name" varchar(60),
  "email" varchar(100),
  "mobile" varchar(45),
  "landPhone" varchar(45),
  "contact_details" varchar(250),
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_elements"
--
CREATE TABLE "vw_elements" (
  "element_id" int(10) unsigned,
  "template_id" int(10) unsigned,
  "template_name" varchar(45),
  "element_name" varchar(45),
  "element_label" varchar(100),
  "element_order" int(10) unsigned,
  "max_length" int(10) unsigned,
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(10) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_geo_tracker"
--
CREATE TABLE "vw_geo_tracker" (
  "subscriber_count" bigint(21),
  "user_id" int(10) unsigned,
  "country_code" varchar(45),
  "city_code" varchar(45)
);

--
-- Temporary table structure for view "vw_groups_roles"
--
CREATE TABLE "vw_groups_roles" (
  "group_id" int(11),
  "group_name" varchar(100),
  "role_id" int(11),
  "role_name" varchar(100),
  "role_desc" varchar(200),
  "is_active" int(2),
  "created_by" varchar(20),
  "created_on" date,
  "modified_by" varchar(20),
  "modified_on" date,
  "id_created_by" int(11),
  "id_modified_by" int(11)
);

--
-- Temporary table structure for view "vw_groups_users"
--
CREATE TABLE "vw_groups_users" (
  "user_id" int(10) unsigned,
  "user_name" varchar(20),
  "group_id" int(11),
  "group_name" varchar(100),
  "group_desc" varchar(200),
  "is_active" int(11),
  "created_by" varchar(20),
  "created_on" date,
  "modified_by" varchar(20),
  "modified_on" date,
  "id_created_by" int(11),
  "id_modified_by" int(11)
);

--
-- Temporary table structure for view "vw_mailers"
--
CREATE TABLE "vw_mailers" (
  "mailer_id" int(10) unsigned,
  "profile_id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "template_id" varchar(45),
  "template_content" longtext,
  "template_name" varchar(45),
  "mail_subject" varchar(300),
  "date_scheduled" datetime,
  "status_id" int(10) unsigned,
  "sent_on" datetime,
  "group_ids" varchar(300),
  "send_to_groups" int(2) unsigned,
  "responseCount" bigint(21),
  "contactCount" bigint(21),
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_mailers_customers"
--
CREATE TABLE "vw_mailers_customers" (
  "id" int(11),
  "mailer_id" int(11) unsigned,
  "customer_id" int(10) unsigned,
  "status_id" int(11),
  "email_id" varchar(100)
);

--
-- Temporary table structure for view "vw_mailers_delivery_log"
--
CREATE TABLE "vw_mailers_delivery_log" (
  "id" int(11),
  "mailer_id" int(11),
  "template_id" varchar(45),
  "mail_subject" varchar(300),
  "template_name" varchar(45),
  "contact_count" int(10) unsigned,
  "delivery_date" date,
  "delivery_time" timestamp,
  "delivery_status" int(10) unsigned,
  "delivery_status_desc" varchar(45),
  "created_on" date,
  "id_created_by" int(11),
  "modified_on" date,
  "id_modified_by" int(11),
  "error_message" varchar(500),
  "is_active" int(11),
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_mailers_schedule"
--
CREATE TABLE "vw_mailers_schedule" (
  "id" int(10) unsigned,
  "mailer_id" int(10) unsigned,
  "pattern_id" int(10) unsigned,
  "start_date" datetime,
  "time_of_day" timestamp,
  "send_hours" int(10) unsigned,
  "send_minutes" int(10) unsigned,
  "send_ampm" varchar(5),
  "end_date" datetime,
  "exclude_holidays" int(2) unsigned,
  "auto_roll" int(2) unsigned,
  "days_excluded" varchar(45),
  "day_of_week" int(10) unsigned,
  "date_of_month" int(10) unsigned,
  "status_id" int(10) unsigned,
  "next_delivery" datetime,
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_overall_campaign"
--
CREATE TABLE "vw_overall_campaign" (
  "user_id" int(10) unsigned,
  "sent_count" decimal(33,0),
  "open_count" bigint(21)
);

--
-- Temporary table structure for view "vw_pending_instant_mailers"
--
CREATE TABLE "vw_pending_instant_mailers" (
  "mailer_id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "template_id" varchar(45),
  "template_content" longtext,
  "template_name" varchar(45),
  "mail_subject" varchar(300),
  "date_scheduled" datetime,
  "status_id" int(10) unsigned,
  "sent_on" datetime,
  "responseCount" bigint(21),
  "contactCount" bigint(21),
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_pending_schedule"
--
CREATE TABLE "vw_pending_schedule" (
  "id" int(10) unsigned,
  "mailer_id" int(10) unsigned,
  "pattern_id" int(10) unsigned,
  "start_date" datetime,
  "time_of_day" timestamp,
  "end_date" datetime,
  "exclude_holidays" int(2) unsigned,
  "auto_roll" int(2) unsigned,
  "days_excluded" varchar(45),
  "day_of_week" int(10) unsigned,
  "date_of_month" int(10) unsigned,
  "status_id" int(10) unsigned,
  "next_delivery" datetime,
  "created_on" datetime,
  "created_by" int(10) unsigned,
  "modified_on" datetime,
  "modified_by" int(10) unsigned,
  "is_active" int(2) unsigned
);

--
-- Temporary table structure for view "vw_roles_tasks"
--
CREATE TABLE "vw_roles_tasks" (
  "role_id" int(11),
  "role_name" varchar(100),
  "task_id" int(11) unsigned,
  "sub_menu_desc" varchar(500),
  "submenu_order" int(10) unsigned,
  "task_name" varchar(200),
  "task_desc" varchar(500),
  "is_active" int(11),
  "created_by" varchar(20),
  "created_on" date,
  "modified_by" varchar(20),
  "modified_on" date,
  "id_created_by" int(11),
  "id_modified_by" int(11)
);

--
-- Temporary table structure for view "vw_status"
--
CREATE TABLE "vw_status" (
  "type_name" varchar(45),
  "id" int(10) unsigned,
  "status_name" varchar(45),
  "status_desc" varchar(100),
  "status_type_id" varchar(45),
  "created_by" int(10) unsigned,
  "created_on" datetime,
  "modified_by" int(10) unsigned,
  "modified_on" datetime,
  "is_active" int(10) unsigned
);

--
-- Temporary table structure for view "vw_templates"
--
CREATE TABLE "vw_templates" (
  "id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "name" varchar(45),
  "last_sent_on" datetime,
  "content" text,
  "created_on" datetime,
  "is_dynamic" int(2) unsigned,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20),
  "has_elements" int(1),
  "has_responses" int(1),
  "sent_count" bigint(21),
  "response_count" bigint(21)
);

--
-- Temporary table structure for view "vw_user_mailprofiles"
--
CREATE TABLE "vw_user_mailprofiles" (
  "profile_name" varchar(45),
  "id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "smtp_auth" varchar(10),
  "smtp_servername" varchar(100),
  "smtp_username" varchar(100),
  "smtp_password" varchar(24),
  "smtp_port" varchar(5),
  "smtp_type" varchar(45),
  "from_email" varchar(100),
  "from_name" varchar(50),
  "replyto_email" varchar(100),
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Temporary table structure for view "vw_user_menu"
--
CREATE TABLE "vw_user_menu" (
  "user_id" int(10) unsigned,
  "image_link" varchar(200),
  "user_name" varchar(20),
  "main_menu_id" bigint(11),
  "main_menu_name" varchar(50),
  "main_menu_label" varchar(40),
  "main_menu_link" varchar(400),
  "menu_order" bigint(11) unsigned,
  "sub_menu_id" int(11) unsigned,
  "sub_menu_name" varchar(50),
  "sub_menu_desc" varchar(500),
  "sub_menu_label" varchar(200),
  "submenu_order" int(10) unsigned,
  "sub_menu_link" varchar(400)
);

--
-- Temporary table structure for view "vw_users"
--
CREATE TABLE "vw_users" (
  "id" int(10) unsigned,
  "user_name" varchar(20),
  "title" varchar(5),
  "first_name" varchar(45),
  "last_name" varchar(45),
  "user_type_id" int(10) unsigned,
  "email" varchar(40),
  "land_phone" varchar(45),
  "mobile" varchar(45),
  "confirmed" varchar(1),
  "confirm_code" varchar(36),
  "company_name" varchar(100),
  "company_number" varchar(100),
  "company_address" varchar(250),
  "company_phone" varchar(45),
  "has_config" int(1),
  "has_mailconfig" int(1),
  "has_customers" int(1),
  "has_mailers" int(1),
  "has_templates" int(1),
  "created_on" datetime,
  "modified_on" datetime,
  "id_created_by" int(10) unsigned,
  "id_modified_by" int(10) unsigned,
  "created_by" varchar(20),
  "modified_by" varchar(20),
  "is_active" int(2) unsigned
);

--
-- Temporary table structure for view "vw_users_customergroups"
--
CREATE TABLE "vw_users_customergroups" (
  "group_id" int(10) unsigned,
  "user_id" int(10) unsigned,
  "group_name" varchar(60),
  "owners_name" varchar(60),
  "owners_email" varchar(100),
  "replyto_email" varchar(100),
  "notify_owner" int(2) unsigned,
  "is_default" int(2) unsigned,
  "group_desc" text,
  "created_on" datetime,
  "id_created_by" int(10) unsigned,
  "modified_on" datetime,
  "id_modified_by" int(10) unsigned,
  "is_active" int(2) unsigned,
  "customerCount" bigint(21),
  "created_by" varchar(20),
  "modified_by" varchar(20)
);

--
-- Definition of table "QRTZ_BLOB_TRIGGERS"
--
CREATE TABLE "QRTZ_BLOB_TRIGGERS" (
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "BLOB_DATA" blob,
  PRIMARY KEY ("TRIGGER_NAME","TRIGGER_GROUP"),
  KEY "TRIGGER_NAME" ("TRIGGER_NAME","TRIGGER_GROUP"),
  CONSTRAINT "QRTZ_BLOB_TRIGGERS_ibfk_1" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_BLOB_TRIGGERS"
--

/*!40000 ALTER TABLE "QRTZ_BLOB_TRIGGERS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_BLOB_TRIGGERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_CALENDARS"
--
CREATE TABLE "QRTZ_CALENDARS" (
  "CALENDAR_NAME" varchar(200) NOT NULL,
  "CALENDAR" blob NOT NULL,
  PRIMARY KEY ("CALENDAR_NAME")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_CALENDARS"
--

/*!40000 ALTER TABLE "QRTZ_CALENDARS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_CALENDARS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_CRON_TRIGGERS"
--
CREATE TABLE "QRTZ_CRON_TRIGGERS" (
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "CRON_EXPRESSION" varchar(120) NOT NULL,
  "TIME_ZONE_ID" varchar(80) DEFAULT NULL,
  PRIMARY KEY ("TRIGGER_NAME","TRIGGER_GROUP"),
  KEY "TRIGGER_NAME" ("TRIGGER_NAME","TRIGGER_GROUP"),
  CONSTRAINT "QRTZ_CRON_TRIGGERS_ibfk_1" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_CRON_TRIGGERS"
--

/*!40000 ALTER TABLE "QRTZ_CRON_TRIGGERS" DISABLE KEYS */;
INSERT INTO "QRTZ_CRON_TRIGGERS" ("TRIGGER_NAME","TRIGGER_GROUP","CRON_EXPRESSION","TIME_ZONE_ID") VALUES 
 ('MAIL_TRIGGER_107','MAIL_GROUP_8','0 30 17 * MAY-MAY ? 2010-2010','Europe/London'),
 ('MAIL_TRIGGER_137','MAIL_GROUP_28','0 0 8 * MAY-MAY ? 2010-2010','Europe/London'),
 ('MAIL_TRIGGER_139','MAIL_GROUP_8','0 0 8 27 MAY ? 2010','Europe/London'),
 ('MAIL_TRIGGER_92','MAIL_GROUP_8','0 45 8 * MAY-JUN ? 2010-2010','Europe/London'),
 ('MAIL_TRIGGER_94','MAIL_GROUP_8','0 0 7 * MAY-JUN ? 2010-2010','Europe/London');
/*!40000 ALTER TABLE "QRTZ_CRON_TRIGGERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_FIRED_TRIGGERS"
--
CREATE TABLE "QRTZ_FIRED_TRIGGERS" (
  "ENTRY_ID" varchar(95) NOT NULL,
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "IS_VOLATILE" varchar(1) NOT NULL,
  "INSTANCE_NAME" varchar(200) NOT NULL,
  "FIRED_TIME" bigint(13) NOT NULL,
  "PRIORITY" int(11) NOT NULL,
  "STATE" varchar(16) NOT NULL,
  "JOB_NAME" varchar(200) DEFAULT NULL,
  "JOB_GROUP" varchar(200) DEFAULT NULL,
  "IS_STATEFUL" varchar(1) DEFAULT NULL,
  "REQUESTS_RECOVERY" varchar(1) DEFAULT NULL,
  PRIMARY KEY ("ENTRY_ID")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_FIRED_TRIGGERS"
--

/*!40000 ALTER TABLE "QRTZ_FIRED_TRIGGERS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_FIRED_TRIGGERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_JOB_DETAILS"
--
CREATE TABLE "QRTZ_JOB_DETAILS" (
  "JOB_NAME" varchar(200) NOT NULL,
  "JOB_GROUP" varchar(200) NOT NULL,
  "DESCRIPTION" varchar(250) DEFAULT NULL,
  "JOB_CLASS_NAME" varchar(250) NOT NULL,
  "IS_DURABLE" varchar(1) NOT NULL,
  "IS_VOLATILE" varchar(1) NOT NULL,
  "IS_STATEFUL" varchar(1) NOT NULL,
  "REQUESTS_RECOVERY" varchar(1) NOT NULL,
  "JOB_DATA" blob,
  PRIMARY KEY ("JOB_NAME","JOB_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_JOB_DETAILS"
--

/*!40000 ALTER TABLE "QRTZ_JOB_DETAILS" DISABLE KEYS */;
INSERT INTO "QRTZ_JOB_DETAILS" ("JOB_NAME","JOB_GROUP","DESCRIPTION","JOB_CLASS_NAME","IS_DURABLE","IS_VOLATILE","IS_STATEFUL","REQUESTS_RECOVERY","JOB_DATA") VALUES 
 ('MAIL_JOB_107','MAIL_GROUP_8',NULL,'com.beyond.mail.MailJob','0','0','0','0',0x230D0A23536174204D61792031352031373A32383A35372042535420323031300D0A),
 ('MAIL_JOB_137','MAIL_GROUP_28',NULL,'com.beyond.mail.MailJob','0','0','0','0',0x230D0A23547565204D61792031382030373A30313A31302042535420323031300D0A),
 ('MAIL_JOB_139','MAIL_GROUP_8',NULL,'com.beyond.mail.MailJob','0','0','0','0',0x230D0A23546875204D61792032302031393A34333A33342042535420323031300D0A),
 ('MAIL_JOB_92','MAIL_GROUP_8',NULL,'com.beyond.mail.MailJob','0','0','0','0',0x230D0A234D6F6E204D61792030332030383A33363A32372042535420323031300D0A),
 ('MAIL_JOB_94','MAIL_GROUP_8',NULL,'com.beyond.mail.MailJob','0','0','0','0',0x230D0A23547565204D61792030342030363A35333A33332042535420323031300D0A);
/*!40000 ALTER TABLE "QRTZ_JOB_DETAILS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_JOB_LISTENERS"
--
CREATE TABLE "QRTZ_JOB_LISTENERS" (
  "JOB_NAME" varchar(200) NOT NULL,
  "JOB_GROUP" varchar(200) NOT NULL,
  "JOB_LISTENER" varchar(200) NOT NULL,
  PRIMARY KEY ("JOB_NAME","JOB_GROUP","JOB_LISTENER"),
  KEY "JOB_NAME" ("JOB_NAME","JOB_GROUP"),
  CONSTRAINT "QRTZ_JOB_LISTENERS_ibfk_1" FOREIGN KEY ("JOB_NAME", "JOB_GROUP") REFERENCES "QRTZ_JOB_DETAILS" ("JOB_NAME", "JOB_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_JOB_LISTENERS"
--

/*!40000 ALTER TABLE "QRTZ_JOB_LISTENERS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_JOB_LISTENERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_LOCKS"
--
CREATE TABLE "QRTZ_LOCKS" (
  "LOCK_NAME" varchar(40) NOT NULL,
  PRIMARY KEY ("LOCK_NAME")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_LOCKS"
--

/*!40000 ALTER TABLE "QRTZ_LOCKS" DISABLE KEYS */;
INSERT INTO "QRTZ_LOCKS" ("LOCK_NAME") VALUES 
 ('CALENDAR_ACCESS'),
 ('JOB_ACCESS'),
 ('MISFIRE_ACCESS'),
 ('STATE_ACCESS'),
 ('TRIGGER_ACCESS');
/*!40000 ALTER TABLE "QRTZ_LOCKS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_PAUSED_TRIGGER_GRPS"
--
CREATE TABLE "QRTZ_PAUSED_TRIGGER_GRPS" (
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  PRIMARY KEY ("TRIGGER_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_PAUSED_TRIGGER_GRPS"
--

/*!40000 ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_SCHEDULER_STATE"
--
CREATE TABLE "QRTZ_SCHEDULER_STATE" (
  "INSTANCE_NAME" varchar(200) NOT NULL,
  "LAST_CHECKIN_TIME" bigint(13) NOT NULL,
  "CHECKIN_INTERVAL" bigint(13) NOT NULL,
  PRIMARY KEY ("INSTANCE_NAME")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_SCHEDULER_STATE"
--

/*!40000 ALTER TABLE "QRTZ_SCHEDULER_STATE" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_SCHEDULER_STATE" ENABLE KEYS */;


--
-- Definition of table "QRTZ_SIMPLE_TRIGGERS"
--
CREATE TABLE "QRTZ_SIMPLE_TRIGGERS" (
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "REPEAT_COUNT" bigint(7) NOT NULL,
  "REPEAT_INTERVAL" bigint(12) NOT NULL,
  "TIMES_TRIGGERED" bigint(10) NOT NULL,
  PRIMARY KEY ("TRIGGER_NAME","TRIGGER_GROUP"),
  KEY "TRIGGER_NAME" ("TRIGGER_NAME","TRIGGER_GROUP"),
  CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_ibfk_1" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_SIMPLE_TRIGGERS"
--

/*!40000 ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_TRIGGERS"
--
CREATE TABLE "QRTZ_TRIGGERS" (
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "JOB_NAME" varchar(200) NOT NULL,
  "JOB_GROUP" varchar(200) NOT NULL,
  "IS_VOLATILE" varchar(1) NOT NULL,
  "DESCRIPTION" varchar(250) DEFAULT NULL,
  "NEXT_FIRE_TIME" bigint(13) DEFAULT NULL,
  "PREV_FIRE_TIME" bigint(13) DEFAULT NULL,
  "PRIORITY" int(11) DEFAULT NULL,
  "TRIGGER_STATE" varchar(16) NOT NULL,
  "TRIGGER_TYPE" varchar(8) NOT NULL,
  "START_TIME" bigint(13) NOT NULL,
  "END_TIME" bigint(13) DEFAULT NULL,
  "CALENDAR_NAME" varchar(200) DEFAULT NULL,
  "MISFIRE_INSTR" smallint(2) DEFAULT NULL,
  "JOB_DATA" blob,
  PRIMARY KEY ("TRIGGER_NAME","TRIGGER_GROUP"),
  KEY "JOB_NAME" ("JOB_NAME","JOB_GROUP"),
  CONSTRAINT "QRTZ_TRIGGERS_ibfk_1" FOREIGN KEY ("JOB_NAME", "JOB_GROUP") REFERENCES "QRTZ_JOB_DETAILS" ("JOB_NAME", "JOB_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_TRIGGERS"
--

/*!40000 ALTER TABLE "QRTZ_TRIGGERS" DISABLE KEYS */;
INSERT INTO "QRTZ_TRIGGERS" ("TRIGGER_NAME","TRIGGER_GROUP","JOB_NAME","JOB_GROUP","IS_VOLATILE","DESCRIPTION","NEXT_FIRE_TIME","PREV_FIRE_TIME","PRIORITY","TRIGGER_STATE","TRIGGER_TYPE","START_TIME","END_TIME","CALENDAR_NAME","MISFIRE_INSTR","JOB_DATA") VALUES 
 ('MAIL_TRIGGER_107','MAIL_GROUP_8','MAIL_JOB_107','MAIL_GROUP_8','0',NULL,1274805000000,1274771335479,5,'WAITING','CRON',1273940937000,0,NULL,0,''),
 ('MAIL_TRIGGER_137','MAIL_GROUP_28','MAIL_JOB_137','MAIL_GROUP_28','0',NULL,1274857200000,1274771335422,5,'WAITING','CRON',1274162470000,0,NULL,0,''),
 ('MAIL_TRIGGER_139','MAIL_GROUP_8','MAIL_JOB_139','MAIL_GROUP_8','0',NULL,1274943600000,-1,5,'WAITING','CRON',1274381014000,0,NULL,0,''),
 ('MAIL_TRIGGER_92','MAIL_GROUP_8','MAIL_JOB_92','MAIL_GROUP_8','0',NULL,1274773500000,1274771335448,5,'WAITING','CRON',1272872187000,0,NULL,0,''),
 ('MAIL_TRIGGER_94','MAIL_GROUP_8','MAIL_JOB_94','MAIL_GROUP_8','0',NULL,1274853600000,1274771335375,5,'WAITING','CRON',1272952413000,0,NULL,0,'');
/*!40000 ALTER TABLE "QRTZ_TRIGGERS" ENABLE KEYS */;


--
-- Definition of table "QRTZ_TRIGGER_LISTENERS"
--
CREATE TABLE "QRTZ_TRIGGER_LISTENERS" (
  "TRIGGER_NAME" varchar(200) NOT NULL,
  "TRIGGER_GROUP" varchar(200) NOT NULL,
  "TRIGGER_LISTENER" varchar(200) NOT NULL,
  PRIMARY KEY ("TRIGGER_NAME","TRIGGER_GROUP","TRIGGER_LISTENER"),
  KEY "TRIGGER_NAME" ("TRIGGER_NAME","TRIGGER_GROUP"),
  CONSTRAINT "QRTZ_TRIGGER_LISTENERS_ibfk_1" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")
) TYPE=InnoDB;

--
-- Dumping data for table "QRTZ_TRIGGER_LISTENERS"
--

/*!40000 ALTER TABLE "QRTZ_TRIGGER_LISTENERS" DISABLE KEYS */;
/*!40000 ALTER TABLE "QRTZ_TRIGGER_LISTENERS" ENABLE KEYS */;


--
-- Definition of table "auto_response_types"
--
CREATE TABLE "auto_response_types" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "response_type_name" varchar(50) NOT NULL,
  "response_type_desc" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=6;

--
-- Dumping data for table "auto_response_types"
--

/*!40000 ALTER TABLE "auto_response_types" DISABLE KEYS */;
INSERT INTO "auto_response_types" ("id","response_type_name","response_type_desc") VALUES 
 (1,'SubscriptionRequested','User requested for subscription'),
 (2,'SubscriptionAuthentication','Authentication of subscription request'),
 (3,'SubscriptionConfirmation','Confirmation of subscription request'),
 (4,'CancellationRequest','User requested to unsubscribe him from list'),
 (5,'Unsubscribed','User had been removed from all mailing lists');
/*!40000 ALTER TABLE "auto_response_types" ENABLE KEYS */;


--
-- Definition of table "auto_responses"
--
CREATE TABLE "auto_responses" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "response_type_id" int(10) unsigned NOT NULL,
  "response_html" text,
  "user_id" int(10) unsigned NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "modified_on" datetime DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "template_id" int(10) unsigned DEFAULT NULL,
  "response_subject" varchar(200) DEFAULT NULL,
  "profile_id" int(10) unsigned DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_auto_responses_1" ("response_type_id"),
  KEY "FK_auto_responses_2" ("user_id"),
  KEY "FK_auto_responses_3" ("created_by"),
  CONSTRAINT "FK_auto_responses_1" FOREIGN KEY ("response_type_id") REFERENCES "auto_response_types" ("id"),
  CONSTRAINT "FK_auto_responses_2" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
  CONSTRAINT "FK_auto_responses_3" FOREIGN KEY ("created_by") REFERENCES "users" ("id")
) TYPE=InnoDB AUTO_INCREMENT=5;

--
-- Dumping data for table "auto_responses"
--

/*!40000 ALTER TABLE "auto_responses" DISABLE KEYS */;
INSERT INTO "auto_responses" ("id","response_type_id","response_html","user_id","created_by","created_on","modified_by","modified_on","is_active","template_id","response_subject","profile_id") VALUES 
 (1,1,'<div id=\"container\">\n	<div id=\"content\">\n		<b>Hi, Your email subscription is almost complete...</b><br />\n		<br />\n		An email has been sent to the email address you entered. In this email is a confirmation link. Please click on this link to confirm your subscription.<br />\n		<br />\n		Once you&#39;ve done this your subscription will be complete.<br />\n		<br />\n		<a href=\"javascript:history.back()\">? Go Back</a></div>\n</div>\n',8,8,'2010-04-04 00:00:00',8,'2010-05-14 18:44:17',1,0,'Thanks for subscribing to mailing list',NULL),
 (2,2,'<p>\n	<b>Please confirm your subscription</b> <br />\n	<br />\n	Thank you for subscribing to our newsletter.<br />\n	<br />\n	To finalize your subscription, please click on the confirmation link below. Once you&#39;ve done this, your subscription will be complete.<br />\n	<br />\n	<a href=\"%%CONFIRMLINK%%\" target=\"_blank\">Please click here to confirm your subscription</a><br />\n	<br />\n	or copy and paste the following URL into your browser:<br />\n	%%CONFIRMLINK%%</p>\n',8,8,'2010-04-04 00:00:00',8,'2010-05-14 18:50:32',1,0,'Confirmation of Subscription ',NULL),
 (3,3,'<p>\n	<strong>Thank you for subscribing to our newsletter. </strong></p>\n<p>\n	You are now part of our mailing list family. Please feel free to contact us for any queries.</p>\n<p>\n	Regards</p>\n<p>\n	Blah Blah Blah</p>',8,8,'2010-04-04 00:00:00',8,'2010-05-14 18:59:19',1,0,'Your subscription is now activated',NULL),
 (4,4,'Are you sure you want your e-mail address \r\nField:ContactEmail \r\nto be removed from our distribution list?',8,8,'2010-04-04 00:00:00',NULL,NULL,1,NULL,'Regarding: Cancellation of subscription',NULL);
/*!40000 ALTER TABLE "auto_responses" ENABLE KEYS */;


--
-- Definition of table "countries"
--
CREATE TABLE "countries" (
  "id" int(11) NOT NULL,
  "name" varchar(200) NOT NULL,
  "created_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(11) DEFAULT NULL,
  "country_code" varchar(3) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "countries"
--

/*!40000 ALTER TABLE "countries" DISABLE KEYS */;
INSERT INTO "countries" ("id","name","created_by","created_on","modified_by","modified_on","is_active","country_code") VALUES 
 (1,'Afghanistan',1,'2009-08-29',NULL,NULL,NULL,'AF'),
 (2,'Aland Islands',1,'2009-08-29',NULL,NULL,NULL,'AX'),
 (3,'Albania',1,'2009-08-29',NULL,NULL,NULL,'AL'),
 (4,'Algeria',1,'2009-08-29',NULL,NULL,NULL,'DZ'),
 (5,'American Samoa',1,'2009-08-29',NULL,NULL,NULL,'AS'),
 (6,'Andorra',1,'2009-08-29',NULL,NULL,NULL,'AD'),
 (7,'Angola',1,'2009-08-29',NULL,NULL,NULL,'AO'),
 (8,'Anguilla',1,'2009-08-29',NULL,NULL,NULL,'AI'),
 (9,'Antarctica',1,'2009-08-29',NULL,NULL,NULL,'AQ'),
 (10,'Antigua And Barbuda',1,'2009-08-29',NULL,NULL,NULL,'AG'),
 (11,'Argentina',1,'2009-08-29',NULL,NULL,NULL,'AR'),
 (12,'Armenia',1,'2009-08-29',NULL,NULL,NULL,'AM'),
 (13,'Aruba',1,'2009-08-29',NULL,NULL,NULL,'AW'),
 (14,'Australia',1,'2009-08-29',NULL,NULL,NULL,'AU'),
 (15,'Austria',1,'2009-08-29',NULL,NULL,NULL,'AT'),
 (16,'Azerbaijan',1,'2009-08-29',NULL,NULL,NULL,'AZ'),
 (17,'Bahamas',1,'2009-08-29',NULL,NULL,NULL,'BS'),
 (18,'Bahrain',1,'2009-08-29',NULL,NULL,NULL,'BH'),
 (19,'Bangladesh',1,'2009-08-29',NULL,NULL,NULL,'BD'),
 (20,'Barbados',1,'2009-08-29',NULL,NULL,NULL,'BB'),
 (21,'Belarus',1,'2009-08-29',NULL,NULL,NULL,'BY'),
 (22,'Belgium',1,'2009-08-29',NULL,NULL,NULL,'BE'),
 (23,'Belize',1,'2009-08-29',NULL,NULL,NULL,'BZ'),
 (24,'Benin',1,'2009-08-29',NULL,NULL,NULL,'BJ'),
 (25,'Bermuda',1,'2009-08-29',NULL,NULL,NULL,'BM'),
 (26,'Bhutan',1,'2009-08-29',NULL,NULL,NULL,'BT'),
 (27,'Bolivia, Plurinational State Of',1,'2009-08-29',NULL,NULL,NULL,'BO'),
 (28,'Bosnia And Herzegovina',1,'2009-08-29',NULL,NULL,NULL,'BA'),
 (29,'Botswana',1,'2009-08-29',NULL,NULL,NULL,'BW'),
 (30,'Bouvet Island',1,'2009-08-29',NULL,NULL,NULL,'BV'),
 (31,'Brazil',1,'2009-08-29',NULL,NULL,NULL,'BR'),
 (32,'British Indian Ocean Territory',1,'2009-08-29',NULL,NULL,NULL,'IO'),
 (33,'Brunei Darussalam',1,'2009-08-29',NULL,NULL,NULL,'BN'),
 (34,'Bulgaria',1,'2009-08-29',NULL,NULL,NULL,'BG'),
 (35,'Burkina Faso',1,'2009-08-29',NULL,NULL,NULL,'BF'),
 (36,'Burundi',1,'2009-08-29',NULL,NULL,NULL,'BI'),
 (37,'Cambodia',1,'2009-08-29',NULL,NULL,NULL,'KH'),
 (38,'Cameroon',1,'2009-08-29',NULL,NULL,NULL,'CM'),
 (39,'Canada',1,'2009-08-29',NULL,NULL,NULL,'CA'),
 (40,'Cape Verde',1,'2009-08-29',NULL,NULL,NULL,'CV'),
 (41,'Cayman Islands',1,'2009-08-29',NULL,NULL,NULL,'KY'),
 (42,'Central African Republic',1,'2009-08-29',NULL,NULL,NULL,'CF'),
 (43,'Chad',1,'2009-08-29',NULL,NULL,NULL,'TD'),
 (44,'Chile',1,'2009-08-29',NULL,NULL,NULL,'CL'),
 (45,'China',1,'2009-08-29',NULL,NULL,NULL,'CN'),
 (46,'Christmas Island',1,'2009-08-29',NULL,NULL,NULL,'CX'),
 (47,'Cocos (Keeling) Islands',1,'2009-08-29',NULL,NULL,NULL,'CC'),
 (48,'Colombia',1,'2009-08-29',NULL,NULL,NULL,'CO'),
 (49,'Comoros',1,'2009-08-29',NULL,NULL,NULL,'KM'),
 (50,'Congo',1,'2009-08-29',NULL,NULL,NULL,'CG'),
 (51,'Congo, The Democratic Republic Of The',1,'2009-08-29',NULL,NULL,NULL,'CD'),
 (52,'Cook Islands',1,'2009-08-29',NULL,NULL,NULL,'CK'),
 (53,'Costa Rica',1,'2009-08-29',NULL,NULL,NULL,'CR'),
 (54,'Côte D\'Ivoire',1,'2009-08-29',NULL,NULL,NULL,'CI'),
 (55,'Croatia',1,'2009-08-29',NULL,NULL,NULL,'HR'),
 (56,'Cuba',1,'2009-08-29',NULL,NULL,NULL,'CU'),
 (57,'Cyprus',1,'2009-08-29',NULL,NULL,NULL,'CY'),
 (58,'Czech Republic',1,'2009-08-29',NULL,NULL,NULL,'CZ'),
 (60,'Denmark',1,'2009-08-29',NULL,NULL,NULL,'DK'),
 (61,'Djibouti',1,'2009-08-29',NULL,NULL,NULL,'DJ'),
 (62,'Dominica',1,'2009-08-29',NULL,NULL,NULL,'DM'),
 (63,'Dominican Republic',1,'2009-08-29',NULL,NULL,NULL,'DO'),
 (65,'Ecuador',1,'2009-08-29',NULL,NULL,NULL,'EC'),
 (66,'Egypt',1,'2009-08-29',NULL,NULL,NULL,'EG'),
 (67,'El Salvador',1,'2009-08-29',NULL,NULL,NULL,'SV'),
 (68,'Equatorial Guinea',1,'2009-08-29',NULL,NULL,NULL,'GQ'),
 (69,'Eritrea',1,'2009-08-29',NULL,NULL,NULL,'ER'),
 (70,'Estonia',1,'2009-08-29',NULL,NULL,NULL,'EE'),
 (71,'Ethiopia',1,'2009-08-29',NULL,NULL,NULL,'ET'),
 (73,'Falkland Islands (Malvinas)',1,'2009-08-29',NULL,NULL,NULL,'FK'),
 (74,'Faroe Islands',1,'2009-08-29',NULL,NULL,NULL,'FO'),
 (75,'Fiji',1,'2009-08-29',NULL,NULL,NULL,'FJ'),
 (76,'Finland',1,'2009-08-29',NULL,NULL,NULL,'FI'),
 (77,'France',1,'2009-08-29',NULL,NULL,NULL,'FR'),
 (78,'French Guiana',1,'2009-08-29',NULL,NULL,NULL,'GF'),
 (79,'French Polynesia',1,'2009-08-29',NULL,NULL,NULL,'PF'),
 (80,'French Southern Territories',1,'2009-08-29',NULL,NULL,NULL,'TF'),
 (82,'Gabon',1,'2009-08-29',NULL,NULL,NULL,'GA'),
 (83,'Gambia',1,'2009-08-29',NULL,NULL,NULL,'GM'),
 (84,'Georgia',1,'2009-08-29',NULL,NULL,NULL,'GE'),
 (85,'Germany',1,'2009-08-29',NULL,NULL,NULL,'DE'),
 (86,'Ghana',1,'2009-08-29',NULL,NULL,NULL,'GH'),
 (87,'Gibraltar',1,'2009-08-29',NULL,NULL,NULL,'GI'),
 (88,'Greece',1,'2009-08-29',NULL,NULL,NULL,'GR'),
 (89,'Greenland',1,'2009-08-29',NULL,NULL,NULL,'GL'),
 (90,'Grenada',1,'2009-08-29',NULL,NULL,NULL,'GD'),
 (91,'Guadeloupe',1,'2009-08-29',NULL,NULL,NULL,'GP'),
 (92,'Guam',1,'2009-08-29',NULL,NULL,NULL,'GU'),
 (93,'Guatemala',1,'2009-08-29',NULL,NULL,NULL,'GT'),
 (94,'Guernsey',1,'2009-08-29',NULL,NULL,NULL,'GG'),
 (95,'Guinea',1,'2009-08-29',NULL,NULL,NULL,'GN'),
 (96,'Guinea-Bissau',1,'2009-08-29',NULL,NULL,NULL,'GW'),
 (97,'Guyana',1,'2009-08-29',NULL,NULL,NULL,'GY'),
 (99,'Haiti',1,'2009-08-29',NULL,NULL,NULL,'HT'),
 (100,'Heard Island And Mcdonald Islands',1,'2009-08-29',NULL,NULL,NULL,'HM'),
 (101,'Holy See (Vatican City State)',1,'2009-08-29',NULL,NULL,NULL,'VA'),
 (102,'Honduras',1,'2009-08-29',NULL,NULL,NULL,'HN'),
 (103,'Hong Kong',1,'2009-08-29',NULL,NULL,NULL,'HK'),
 (104,'Hungary',1,'2009-08-29',NULL,NULL,NULL,'HU'),
 (106,'Iceland',1,'2009-08-29',NULL,NULL,NULL,'IS'),
 (107,'India',1,'2009-08-29',NULL,NULL,NULL,'IN'),
 (108,'Indonesia',1,'2009-08-29',NULL,NULL,NULL,'ID'),
 (109,'Iran, Islamic Republic Of',1,'2009-08-29',NULL,NULL,NULL,'IR'),
 (110,'Iraq',1,'2009-08-29',NULL,NULL,NULL,'IQ'),
 (111,'Ireland',1,'2009-08-29',NULL,NULL,NULL,'IE'),
 (112,'Isle Of Man',1,'2009-08-29',NULL,NULL,NULL,'IM'),
 (113,'Israel',1,'2009-08-29',NULL,NULL,NULL,'IL'),
 (114,'Italy',1,'2009-08-29',NULL,NULL,NULL,'IT'),
 (116,'Jamaica',1,'2009-08-29',NULL,NULL,NULL,'JM'),
 (117,'Japan',1,'2009-08-29',NULL,NULL,NULL,'JP'),
 (118,'Jersey',1,'2009-08-29',NULL,NULL,NULL,'JE'),
 (119,'Jordan',1,'2009-08-29',NULL,NULL,NULL,'JO'),
 (121,'Kazakhstan',1,'2009-08-29',NULL,NULL,NULL,'KZ'),
 (122,'Kenya',1,'2009-08-29',NULL,NULL,NULL,'KE'),
 (123,'Kiribati',1,'2009-08-29',NULL,NULL,NULL,'KI'),
 (124,'Korea, Democratic People\'S Republic Of',1,'2009-08-29',NULL,NULL,NULL,'KP'),
 (125,'Korea, Republic Of',1,'2009-08-29',NULL,NULL,NULL,'KR'),
 (126,'Kuwait',1,'2009-08-29',NULL,NULL,NULL,'KW'),
 (127,'Kyrgyzstan',1,'2009-08-29',NULL,NULL,NULL,'KG'),
 (129,'Lao People\'S Democratic Republic',1,'2009-08-29',NULL,NULL,NULL,'LA'),
 (130,'Latvia',1,'2009-08-29',NULL,NULL,NULL,'LV'),
 (131,'Lebanon',1,'2009-08-29',NULL,NULL,NULL,'LB'),
 (132,'Lesotho',1,'2009-08-29',NULL,NULL,NULL,'LS'),
 (133,'Liberia',1,'2009-08-29',NULL,NULL,NULL,'LR'),
 (134,'Libyan Arab Jamahiriya',1,'2009-08-29',NULL,NULL,NULL,'LY'),
 (135,'Liechtenstein',1,'2009-08-29',NULL,NULL,NULL,'LI'),
 (136,'Lithuania',1,'2009-08-29',NULL,NULL,NULL,'LT'),
 (137,'Luxembourg',1,'2009-08-29',NULL,NULL,NULL,'LU'),
 (139,'Macao',1,'2009-08-29',NULL,NULL,NULL,'MO'),
 (140,'Macedonia, The Former Yugoslav Republic Of',1,'2009-08-29',NULL,NULL,NULL,'MK'),
 (141,'Madagascar',1,'2009-08-29',NULL,NULL,NULL,'MG'),
 (142,'Malawi',1,'2009-08-29',NULL,NULL,NULL,'MW'),
 (143,'Malaysia',1,'2009-08-29',NULL,NULL,NULL,'MY'),
 (144,'Maldives',1,'2009-08-29',NULL,NULL,NULL,'MV'),
 (145,'Mali',1,'2009-08-29',NULL,NULL,NULL,'ML'),
 (146,'Malta',1,'2009-08-29',NULL,NULL,NULL,'MT'),
 (147,'Marshall Islands',1,'2009-08-29',NULL,NULL,NULL,'MH'),
 (148,'Martinique',1,'2009-08-29',NULL,NULL,NULL,'MQ'),
 (149,'Mauritania',1,'2009-08-29',NULL,NULL,NULL,'MR'),
 (150,'Mauritius',1,'2009-08-29',NULL,NULL,NULL,'MU'),
 (151,'Mayotte',1,'2009-08-29',NULL,NULL,NULL,'YT'),
 (152,'Mexico',1,'2009-08-29',NULL,NULL,NULL,'MX'),
 (153,'Micronesia, Federated States Of',1,'2009-08-29',NULL,NULL,NULL,'FM'),
 (154,'Moldova, Republic Of',1,'2009-08-29',NULL,NULL,NULL,'MD'),
 (155,'Monaco',1,'2009-08-29',NULL,NULL,NULL,'MC'),
 (156,'Mongolia',1,'2009-08-29',NULL,NULL,NULL,'MN'),
 (157,'Montenegro',1,'2009-08-29',NULL,NULL,NULL,'ME'),
 (158,'Montserrat',1,'2009-08-29',NULL,NULL,NULL,'MS'),
 (159,'Morocco',1,'2009-08-29',NULL,NULL,NULL,'MA'),
 (160,'Mozambique',1,'2009-08-29',NULL,NULL,NULL,'MZ'),
 (161,'Myanmar',1,'2009-08-29',NULL,NULL,NULL,'MM'),
 (163,'Namibia',1,'2009-08-29',NULL,NULL,NULL,'NA'),
 (164,'Nauru',1,'2009-08-29',NULL,NULL,NULL,'NR'),
 (165,'Nepal',1,'2009-08-29',NULL,NULL,NULL,'NP'),
 (166,'Netherlands',1,'2009-08-29',NULL,NULL,NULL,'NL'),
 (167,'Netherlands Antilles',1,'2009-08-29',NULL,NULL,NULL,'AN'),
 (168,'New Caledonia',1,'2009-08-29',NULL,NULL,NULL,'NC'),
 (169,'New Zealand',1,'2009-08-29',NULL,NULL,NULL,'NZ'),
 (170,'Nicaragua',1,'2009-08-29',NULL,NULL,NULL,'NI'),
 (171,'Niger',1,'2009-08-29',NULL,NULL,NULL,'NE'),
 (172,'Nigeria',1,'2009-08-29',NULL,NULL,NULL,'NG'),
 (173,'Niue',1,'2009-08-29',NULL,NULL,NULL,'NU'),
 (174,'Norfolk Island',1,'2009-08-29',NULL,NULL,NULL,'NF'),
 (175,'Northern Mariana Islands',1,'2009-08-29',NULL,NULL,NULL,'MP'),
 (176,'Norway',1,'2009-08-29',NULL,NULL,NULL,'NO'),
 (178,'Oman',1,'2009-08-29',NULL,NULL,NULL,'OM'),
 (180,'Pakistan',1,'2009-08-29',NULL,NULL,NULL,'PK'),
 (181,'Palau',1,'2009-08-29',NULL,NULL,NULL,'PW'),
 (182,'Palestinian Territory, Occupied',1,'2009-08-29',NULL,NULL,NULL,'PS'),
 (183,'Panama',1,'2009-08-29',NULL,NULL,NULL,'PA'),
 (184,'Papua New Guinea',1,'2009-08-29',NULL,NULL,NULL,'PG'),
 (185,'Paraguay',1,'2009-08-29',NULL,NULL,NULL,'PY'),
 (186,'Peru',1,'2009-08-29',NULL,NULL,NULL,'PE'),
 (187,'Philippines',1,'2009-08-29',NULL,NULL,NULL,'PH'),
 (188,'Pitcairn',1,'2009-08-29',NULL,NULL,NULL,'PN'),
 (189,'Poland',1,'2009-08-29',NULL,NULL,NULL,'PL'),
 (190,'Portugal',1,'2009-08-29',NULL,NULL,NULL,'PT'),
 (191,'Puerto Rico',1,'2009-08-29',NULL,NULL,NULL,'PR'),
 (193,'Qatar',1,'2009-08-29',NULL,NULL,NULL,'QA'),
 (195,'Réunion',1,'2009-08-29',NULL,NULL,NULL,'RE'),
 (196,'Romania',1,'2009-08-29',NULL,NULL,NULL,'RO'),
 (197,'Russian Federation',1,'2009-08-29',NULL,NULL,NULL,'RU'),
 (198,'Rwanda',1,'2009-08-29',NULL,NULL,NULL,'RW'),
 (200,'Saint Barthélemy',1,'2009-08-29',NULL,NULL,NULL,'BL'),
 (201,'Saint Helena',1,'2009-08-29',NULL,NULL,NULL,'SH'),
 (202,'Saint Kitts And Nevis',1,'2009-08-29',NULL,NULL,NULL,'KN'),
 (203,'Saint Lucia',1,'2009-08-29',NULL,NULL,NULL,'LC'),
 (204,'Saint Martin',1,'2009-08-29',NULL,NULL,NULL,'MF'),
 (205,'Saint Pierre And Miquelon',1,'2009-08-29',NULL,NULL,NULL,'PM'),
 (206,'Saint Vincent And The Grenadines',1,'2009-08-29',NULL,NULL,NULL,'VC'),
 (207,'Samoa',1,'2009-08-29',NULL,NULL,NULL,'WS'),
 (208,'San Marino',1,'2009-08-29',NULL,NULL,NULL,'SM'),
 (209,'Sao Tome And Principe',1,'2009-08-29',NULL,NULL,NULL,'ST'),
 (210,'Saudi Arabia',1,'2009-08-29',NULL,NULL,NULL,'SA'),
 (211,'Senegal',1,'2009-08-29',NULL,NULL,NULL,'SN'),
 (212,'Serbia',1,'2009-08-29',NULL,NULL,NULL,'RS'),
 (213,'Seychelles',1,'2009-08-29',NULL,NULL,NULL,'SC'),
 (214,'Sierra Leone',1,'2009-08-29',NULL,NULL,NULL,'SL'),
 (215,'Singapore',1,'2009-08-29',NULL,NULL,NULL,'SG'),
 (216,'Slovakia',1,'2009-08-29',NULL,NULL,NULL,'SK'),
 (217,'Slovenia',1,'2009-08-29',NULL,NULL,NULL,'SI'),
 (218,'Solomon Islands',1,'2009-08-29',NULL,NULL,NULL,'SB'),
 (219,'Somalia',1,'2009-08-29',NULL,NULL,NULL,'SO'),
 (220,'South Africa',1,'2009-08-29',NULL,NULL,NULL,'ZA'),
 (221,'South Georgia And The South Sandwich Islands',1,'2009-08-29',NULL,NULL,NULL,'GS'),
 (222,'Spain',1,'2009-08-29',NULL,NULL,NULL,'ES'),
 (223,'Sri Lanka',1,'2009-08-29',NULL,NULL,NULL,'LK'),
 (224,'Sudan',1,'2009-08-29',NULL,NULL,NULL,'SD'),
 (225,'Suriname',1,'2009-08-29',NULL,NULL,NULL,'SR'),
 (226,'Svalbard And Jan Mayen',1,'2009-08-29',NULL,NULL,NULL,'SJ'),
 (227,'Swaziland',1,'2009-08-29',NULL,NULL,NULL,'SZ'),
 (228,'Sweden',1,'2009-08-29',NULL,NULL,NULL,'SE'),
 (229,'Switzerland',1,'2009-08-29',NULL,NULL,NULL,'CH'),
 (230,'Syrian Arab Republic',1,'2009-08-29',NULL,NULL,NULL,'SY'),
 (232,'Taiwan, Province Of China',1,'2009-08-29',NULL,NULL,NULL,'TW'),
 (233,'Tajikistan',1,'2009-08-29',NULL,NULL,NULL,'TJ'),
 (234,'Tanzania, United Republic Of',1,'2009-08-29',NULL,NULL,NULL,'TZ'),
 (235,'Thailand',1,'2009-08-29',NULL,NULL,NULL,'TH'),
 (236,'Timor-Leste',1,'2009-08-29',NULL,NULL,NULL,'TL'),
 (237,'Togo',1,'2009-08-29',NULL,NULL,NULL,'TG'),
 (238,'Tokelau',1,'2009-08-29',NULL,NULL,NULL,'TK'),
 (239,'Tonga',1,'2009-08-29',NULL,NULL,NULL,'TO'),
 (240,'Trinidad And Tobago',1,'2009-08-29',NULL,NULL,NULL,'TT'),
 (241,'Tunisia',1,'2009-08-29',NULL,NULL,NULL,'TN'),
 (242,'Turkey',1,'2009-08-29',NULL,NULL,NULL,'TR'),
 (243,'Turkmenistan',1,'2009-08-29',NULL,NULL,NULL,'TM'),
 (244,'Turks And Caicos Islands',1,'2009-08-29',NULL,NULL,NULL,'TC'),
 (245,'Tuvalu',1,'2009-08-29',NULL,NULL,NULL,'TV'),
 (247,'Uganda',1,'2009-08-29',NULL,NULL,NULL,'UG'),
 (248,'Ukraine',1,'2009-08-29',NULL,NULL,NULL,'UA'),
 (249,'United Arab Emirates',1,'2009-08-29',NULL,NULL,NULL,'AE'),
 (250,'United Kingdom',1,'2009-08-29',NULL,NULL,NULL,'GB'),
 (251,'United States',1,'2009-08-29',NULL,NULL,NULL,'US'),
 (252,'United States Minor Outlying Islands',1,'2009-08-29',NULL,NULL,NULL,'UM'),
 (253,'Uruguay',1,'2009-08-29',NULL,NULL,NULL,'UY'),
 (254,'Uzbekistan',1,'2009-08-29',NULL,NULL,NULL,'UZ'),
 (256,'Vanuatu',1,'2009-08-29',NULL,NULL,NULL,'VU'),
 (257,'Venezuela, Bolivarian Republic Of',1,'2009-08-29',NULL,NULL,NULL,'VE'),
 (258,'Viet Nam',1,'2009-08-29',NULL,NULL,NULL,'VN'),
 (259,'Virgin Islands, British',1,'2009-08-29',NULL,NULL,NULL,'VG'),
 (260,'Virgin Islands, U.S.',1,'2009-08-29',NULL,NULL,NULL,'VI'),
 (262,'Wallis And Futuna',1,'2009-08-29',NULL,NULL,NULL,'WF'),
 (263,'Western Sahara',1,'2009-08-29',NULL,NULL,NULL,'EH'),
 (265,'Yemen',1,'2009-08-29',NULL,NULL,NULL,'YE'),
 (267,'Zambia',1,'2009-08-29',NULL,NULL,NULL,'ZM'),
 (268,'Zimbabwe',1,'2009-08-29',NULL,NULL,NULL,'ZW ');
/*!40000 ALTER TABLE "countries" ENABLE KEYS */;


--
-- Definition of table "customer_groups"
--
CREATE TABLE "customer_groups" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "name" varchar(60) NOT NULL,
  "group_desc" text,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "is_dynamic" int(2) unsigned DEFAULT NULL,
  "is_default" int(2) unsigned DEFAULT NULL,
  "owners_name" varchar(60) DEFAULT NULL,
  "owners_email" varchar(100) DEFAULT NULL,
  "replyto_email" varchar(100) DEFAULT NULL,
  "notify_owner" int(2) unsigned DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=37 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "customer_groups"
--

/*!40000 ALTER TABLE "customer_groups" DISABLE KEYS */;
INSERT INTO "customer_groups" ("id","user_id","name","group_desc","created_on","created_by","modified_on","modified_by","is_active","is_dynamic","is_default","owners_name","owners_email","replyto_email","notify_owner") VALUES 
 (1,8,'Mailing List','Users subscribed to mailing list','2010-02-02 00:00:00',8,'2010-05-25 07:16:01',8,1,1,0,'Gowrisankar','gowrisankar.narayan@gmail.com','gowrisankar.narayan@gmail.com',1),
 (3,8,'Privileged',NULL,'2010-02-02 00:00:00',8,'2010-05-23 19:05:35',8,1,NULL,1,NULL,NULL,NULL,NULL),
 (6,9,'MyDefaultGroup',NULL,'2010-03-16 13:25:32',9,'2010-03-16 13:25:32',9,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (7,15,'MyDefaultGroup',NULL,'2010-03-16 13:28:09',15,'2010-03-16 13:28:09',15,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (8,15,'Mydefaultgroup2',NULL,'2010-03-16 13:30:53',15,'2010-03-16 13:30:53',15,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (9,16,'MyDefaultGroup1',NULL,'2010-03-16 13:32:47',16,'2010-03-16 13:32:47',16,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,16,'Mydef 2',NULL,'2010-03-16 13:37:24',16,'2010-03-16 13:37:24',16,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (11,16,'Mydef 3',NULL,'2010-03-16 13:37:52',16,'2010-03-16 13:37:52',16,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (12,16,'def 4',NULL,'2010-03-16 13:38:02',16,'2010-03-16 13:38:02',16,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (13,16,'Long Named Group',NULL,'2010-03-16 13:42:26',16,'2010-03-16 13:42:26',16,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (14,9,'MyDefaultGroup1',NULL,'2010-03-16 20:15:07',9,'2010-03-16 20:15:07',9,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (16,15,'test',NULL,'2010-03-19 11:01:39',15,'2010-03-19 11:01:39',15,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (18,8,'UI Designers','UI Designers List','2010-04-13 20:33:59',8,'2010-05-23 22:51:23',8,1,NULL,0,'','','',0),
 (19,8,'Programmer','Programmers Group','2010-04-13 20:35:53',8,'2010-04-13 20:35:53',8,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (20,23,'Mailing List','mailing list','2010-04-16 15:52:29',23,'2010-04-16 15:52:29',23,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (21,24,'Mailing List','Default Mailing List','2010-04-16 16:01:42',24,'2010-04-16 16:01:42',24,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (22,28,'Mailing List','Default Mailing List Group','2010-04-17 21:30:55',28,'2010-05-19 22:42:31',28,1,NULL,1,NULL,NULL,NULL,NULL),
 (23,29,'Mailing List',' Default Mailing List','2010-04-18 22:10:47',29,'2010-04-18 22:10:47',29,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (24,4,'Mailing List','Mailing List','2010-04-19 21:48:53',4,'2010-04-19 21:48:53',4,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (25,4,'Test Group','Test description','2010-04-20 13:33:46',4,'2010-04-20 13:33:46',4,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (27,8,'Google List','My Google List','2010-05-14 18:54:21',8,'2010-05-23 22:44:44',8,1,NULL,0,'Gowrisankar','gowrisankar.narayan@gmail.com','gowrisankar.narayan@gmail.com',1);
/*!40000 ALTER TABLE "customer_groups" ENABLE KEYS */;


--
-- Definition of table "customers"
--
CREATE TABLE "customers" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "title" varchar(45) DEFAULT NULL,
  "first_name" varchar(60) DEFAULT NULL,
  "last_name" varchar(60) DEFAULT NULL,
  "email" varchar(100) NOT NULL,
  "contact_details" varchar(250) DEFAULT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL DEFAULT '1',
  "mobile" varchar(45) DEFAULT NULL,
  "landPhone" varchar(45) DEFAULT NULL,
  "subscription_status_id" int(10) unsigned NOT NULL DEFAULT '9',
  "email_status_id" int(10) unsigned NOT NULL DEFAULT '11',
  "requested_date" datetime DEFAULT NULL,
  "requested_ip" varchar(45) DEFAULT NULL,
  "confirmed_date" datetime DEFAULT NULL,
  "confirmed_ip" varchar(45) DEFAULT NULL,
  "group_id" int(10) unsigned DEFAULT NULL,
  "country_code" varchar(45) DEFAULT NULL,
  "city_code" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "USER_AND_EMAIL" ("email","user_id"),
  KEY "FK_customers_1" ("group_id"),
  CONSTRAINT "FK_customers_1" FOREIGN KEY ("group_id") REFERENCES "customer_groups" ("id")
) TYPE=InnoDB AUTO_INCREMENT=1422;

--
-- Dumping data for table "customers"
--

/*!40000 ALTER TABLE "customers" DISABLE KEYS */;
INSERT INTO "customers" ("id","user_id","title","first_name","last_name","email","contact_details","created_on","created_by","modified_on","modified_by","is_active","mobile","landPhone","subscription_status_id","email_status_id","requested_date","requested_ip","confirmed_date","confirmed_ip","group_id","country_code","city_code") VALUES 
 (309,8,'Mr & Mrs','Ken & Leanne','Hammond','kenandleanne@aol.com','4 Oak Close  Chapel-en-le-Frith  High Peak  SK23 0NF','2010-01-06 11:39:29',0,'2010-04-11 21:38:45',0,1,'07832130161','090909900',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (311,8,'Mr','Leslie Stephen','Mills','stevemills39@hotmail.com','29 Parkland Avenue  New Mills  Derbyshire  SK22 4DT','2010-01-06 11:39:29',0,NULL,NULL,1,NULL,'01663 746183',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (312,8,'Mr','Lloyd','Davis','d_shirl@yahoo.co.uk','26 Rowton Grange Road  Chapel-en-le-Frith  High Peak  SK23 0LD','2010-01-06 11:39:29',0,'2010-04-16 14:02:03',0,1,'07742731330 mrs davi','01298 816632',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (313,8,'Mr','Mark','Chuwen','mark@labelsplus.co.uk','Unit 22  Botany Business Park  Macclesfield Road  Whaley Bridge  High Peak  SK23 7DQ','2010-01-06 11:39:29',0,NULL,NULL,1,'07979527331','01663 736250',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (316,8,'Mrs','Nancy','Jones','nancyjj@btinternet.com','9a Smalldale  BUXTON  Derbyshire  SK17 8EA','2010-01-06 11:39:29',0,NULL,NULL,1,'07963807952','0129872749',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (317,8,'Miss','Naomi','Chambers','naomi.chambers@mbs.ac.uk','Stanshope Hall  Stanshope  Ashbourne  Derbyshire  DE6 2AD','2010-01-06 11:39:29',0,NULL,NULL,1,NULL,'01335 310278',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (318,8,'Mr','Nicholas Robert','Bostin','nicjnbos@yahoo.co.uk','5 Cherry Tree Court  Chapel-en-le-Frith  High Peak  SK23 9HF','2010-01-06 11:39:29',0,NULL,NULL,1,NULL,'01298811034',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (319,8,'Mr','Nigel','Betts','nigel@chegwin.org','97 Lightwood Road  Buxton  Derbyshire  SK17 7AN','2010-01-06 11:39:29',0,NULL,NULL,1,'07980 349009','01298 25712',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (320,8,'Mr','Paul','May','paulningridmay@gmail.com','14 Thornbrook Road  Chapel-en-le-Frith  High Peak  SK23 0LX','2010-01-06 11:39:29',0,'2010-04-19 07:50:10',0,1,'9898989899','01298814775',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (321,8,'Mr','Peter','Taylor','peterjohntaylor@hotmail.com','Hillside  Coppice Lane  Disley  Stockport  SK12 2LT','2010-01-06 11:39:29',0,NULL,NULL,1,NULL,'01663 762439',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (322,8,'Mr','Philip','Mellor','sharon.mellor@intraining.co.uk','37 Weaver Close  Crich  MATLOCK  Derbyshire  DE4 5ET','2010-01-06 11:39:29',0,NULL,NULL,1,'07837383194 (sharon)',NULL,800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (328,8,'Mr','Steve','Lomas','sjlomas@tiscali.co.uk','19 Crossings Avenue  Chapel-en-le-Frith  High Peak  SK23 9TE','2010-01-06 11:39:30',0,NULL,NULL,1,NULL,'07718 899836',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (329,8,'Mr','Stuart','James','stuart.james@dailystar.co.uk','13 Newby Street  London  SW8 3BQ','2010-01-06 11:39:30',0,NULL,NULL,1,NULL,'0207 498 2437',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (330,8,'Mr','Terence','Williamson','terancewilliamson@hotmail.com','28B Bowden Lane  Chapel-en-le-Frith  High Peak  SK23 0JQ','2010-01-06 11:39:30',0,NULL,NULL,1,NULL,'01298 812900',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (332,8,'Mr','Trevor','Willis','trevor.willis@vwclub.net','Riyadh  Summer Cross  Tideswell  Buxton  Derbyshire  SK17 8HU','2010-01-06 11:39:30',0,NULL,NULL,1,NULL,'01298 871125',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (573,4,'Ms','Acpeugeotin',NULL,'acpeugeotin@peugoetmail.co.uk','inverness','2010-01-12 11:03:38',0,NULL,NULL,1,'01463231536','01463711493',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (574,4,'Ms','Agm.Healy','no name','agm.healy@evanshalshaw.com','edinburgh','2010-01-12 11:03:38',0,'2010-04-20 12:00:18',4,1,'01314536644','01314424175',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (575,4,'Ms','Akanmilne','No Name','akanmilne@peugeotmail.co.uk','elgin','2010-01-12 11:03:38',0,'2010-04-20 11:57:50',4,1,'01343542254','01343535531',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (576,4,'Ms','Allelectrichalesowen',NULL,'allelectrichalesowen@peugeotmail.co.uk','halesowen','2010-01-12 11:03:38',0,NULL,NULL,1,'01215501020','01215042131',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (577,4,'Ms','Allenford',NULL,'allenford@peugoetmail.co.uk','northhampton','2010-01-12 11:03:38',0,NULL,NULL,1,'01604625400','01604625001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (578,4,'Ms','Anthonymotors',NULL,'Anthonymotors@peugeotmail.co.uk','Aberystwyth','2010-01-12 11:03:38',0,NULL,NULL,1,'01970624444','01970625187',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (579,4,'Ms','Arburyleamington',NULL,'arburyleamington@peugoetmail.co.uk','leamingtonspa','2010-01-12 11:03:38',0,NULL,NULL,1,'01926740000','01926740001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (580,4,'Ms','Arburylichfield',NULL,'arburylichfield@peugoetmail.co.uk','lichfield','2010-01-12 11:03:38',0,NULL,NULL,1,'01543414404','01543250927',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (581,4,'Ms','Arburynuneeaton',NULL,'Arburynuneeaton@peugoetmail.co.uk','Bulkington','2010-01-12 11:03:38',0,NULL,NULL,1,'02476313146','02426640505',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (582,4,'Ms','Arnoldclark',NULL,'arnoldclark@peugeotmail.co.uk','edinburgh','2010-01-12 11:03:38',0,NULL,NULL,1,'01316697799','01312284712',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (583,4,'Ms','Arnoldclarkclydebank',NULL,'arnoldclarkclydebank@peugeotmail.co.uk','clydebank','2010-01-12 11:03:38',0,NULL,NULL,1,'01389878666','01389879710',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (584,4,'Ms','Arnoldclarkkilmarnock',NULL,'arnoldclarkkilmarnock@peugoetmail.co.uk','kilmarnock','2010-01-12 11:03:38',0,NULL,NULL,1,'01563541727','01563539638',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (585,4,'Ms','Arnoldclarkkirkcaldy',NULL,'arnoldclarkkirkcaldy@peugoetmail.co.uk','kirkcaldy','2010-01-12 11:03:38',0,NULL,NULL,1,'01592655100','01592653100',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (586,4,'Ms','Ashtonlynemotors',NULL,'Ashtonlynemotors@peugeotmail.co.uk','Ashtonunderlyne','2010-01-12 11:03:38',0,NULL,NULL,1,'016134312333','01613431242',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (587,4,'Ms','Barkersmalton',NULL,'barkersmalton@peugoetmail.co.uk','malton','2010-01-12 11:03:38',0,NULL,NULL,1,'01653600111','01653697437',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (588,4,'Ms','Becksbrighton',NULL,'Becksbrighton@peugoetmail.co.uk','Brighton','2010-01-12 11:03:38',0,NULL,NULL,1,'01273320800','01273208425',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (589,4,'Ms','Becksburgesshill',NULL,'becksburgesshill@peugeotmail.co.uk','burgesshill','2010-01-12 11:03:38',0,NULL,NULL,1,'01444238000','01444238030',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (590,4,'Ms','Beckseastbourne',NULL,'beckseastbourne@peugeotmail.co.uk','eastbourne','2010-01-12 11:03:38',0,NULL,NULL,1,'01323500666','01323500666',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (591,4,'Ms','Beechwoodmotors',NULL,'beechwoodmotors@peugeotmail.co.uk','coventry','2010-01-12 11:03:38',0,NULL,NULL,1,'02476411515','02476692044',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (592,4,'Ms','Bengrys',NULL,'bengrys@peugoetmail.co.uk','leominster','2010-01-12 11:03:38',0,NULL,NULL,1,'01568612337','01568614329',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (593,4,'Ms','Birtwisle',NULL,'birtwisle@peugoetmail.co.uk','northwich','2010-01-12 11:03:38',0,NULL,NULL,1,'01606338338','0160633801',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (594,4,'Ms','Blakes-Chesterfield',NULL,'blakes-chesterfield@peugeotmail.co.uk','chesterfield','2010-01-12 11:03:38',0,NULL,NULL,1,'01246572700','01246572728',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (595,4,'Ms','Bobmullanmotors',NULL,'bobmullanmotors@peugoetmail.co.uk','limavady','2010-01-12 11:03:38',0,NULL,NULL,1,'02877722164','02877722080',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (596,4,'Ms','Bredonmotorco',NULL,'bredonmotorco@peugeotmail.co.uk','Evesham','2010-01-12 11:03:38',0,NULL,NULL,1,'01386443505','01386765232',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (597,4,'Ms','Bristolstreetharlow',NULL,'bristolstreetharlow@peugeotmail.co.uk','harlow','2010-01-12 11:03:38',0,NULL,NULL,1,'01279624190','01279624191',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (598,4,'Ms','Bristolstreetnorthampton',NULL,'bristolstreetnorthampton@peugoetmail.co.uk','northhampton','2010-01-12 11:03:38',0,NULL,NULL,1,'01604401141','01604785187',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (599,4,'Ms','Bristolstreetoxford',NULL,'bristolstreetoxford@peugoetmail.co.uk','oxford','2010-01-12 11:03:38',0,NULL,NULL,1,'01865749000','01865748674',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (600,4,'Ms','Broadbridge',NULL,'broadbridge@peugoetmail.co.uk','horsham','2010-01-12 11:03:38',0,NULL,NULL,1,'01403256383','01403259892',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (601,4,'Ms','Browns',NULL,'browns@peugoetmail.co.uk','louth','2010-01-12 11:03:38',0,NULL,NULL,1,'01507600422','01507609429',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (602,4,'Ms','Brownwatts',NULL,'brownwatts@peugoetmail.co.uk','london','2010-01-12 11:03:38',0,NULL,NULL,1,'02087883593','02087802268',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (603,4,'Ms','Bruce_Motors1',NULL,'bruce_motors1@peugeotmail.co.uk','hawick','2010-01-12 11:03:38',0,NULL,NULL,1,'01450372287','01450378951',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (604,4,'Ms','Bruce_Motors2',NULL,'bruce_motors2@peugeotmail.co.uk','galashiels','2010-01-12 11:03:38',0,NULL,NULL,1,'01896753024','01896751922',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (605,4,'Ms','Bryanbrothers',NULL,'Bryanbrothers@peugoetmail.co.uk','Bristol','2010-01-12 11:03:38',0,NULL,NULL,1,'01179718881','01179713221',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (606,4,'Ms','Campionslincoln',NULL,'campionslincoln@peugoetmail.co.uk','lincolin','2010-01-12 11:03:38',0,NULL,NULL,1,'01522510346','01522511318',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (607,4,'Ms','Canterbury_Motor_Company',NULL,'canterbury_motor_company@peugeotmail.co.uk','canterbury','2010-01-12 11:03:38',0,NULL,NULL,1,'01227451791','01227455786',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (608,4,'Ms','Castlesabbeylane',NULL,'castlesabbeylane@peugoetmail.co.uk','leicester','2010-01-12 11:03:38',0,NULL,NULL,1,'01162688600','01162688666',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (609,4,'Ms','Castlesnorborough',NULL,'castlesnorborough@peugoetmail.co.uk','leicester','2010-01-12 11:03:38',0,NULL,NULL,1,'01162632700','01162632709',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (610,4,'Ms','Castlesstonygate',NULL,'castlesstonygate@peugoetmail.co.uk','leicester','2010-01-12 11:03:38',0,NULL,NULL,1,'01162746800','01162746809',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (611,4,'Ms','Cdbramallblackpool',NULL,'Cdbramallblackpool@peugeotmail.co.uk','Blackpool','2010-01-12 11:03:38',0,NULL,NULL,1,'01253792840','01253768000',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (612,4,'Ms','Cdbramallwestbromwich',NULL,'Cdbramallwestbromwich@peugeotmail.co.uk','Birmingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01215537741','01215006115',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (613,4,'Ms','Charles.Dell',NULL,'charles.dell@peugeotmail.co.uk','downpatrick','2010-01-12 11:03:38',0,NULL,NULL,1,'02844833207','02844833236',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (614,4,'Ms','Charleshurstknock',NULL,'Charleshurstknock@peugeotmail.co.uk','Belfast','2010-01-12 11:03:38',0,NULL,NULL,1,'02890703377','02890401428',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (615,4,'Ms','Charleshurstpeugeot',NULL,'Charleshurstpeugeot@peugeotmail.co.uk','Belfast','2010-01-12 11:03:38',0,NULL,NULL,1,'02890383444','02890661347',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (616,4,'Ms','Charters_Of_Aldershot',NULL,'Charters_of_aldershot@peugeotmail.co.uk','Aldershot','2010-01-12 11:03:38',0,NULL,NULL,1,'01252344878','01252343051',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (617,4,'Ms','Chartersmaidenhead',NULL,'chartersmaidenhead@peugoetmail.co.uk','maidenhead','2010-01-12 11:03:38',0,NULL,NULL,1,'01628630192','01628627957',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (618,4,'Ms','Chartersofcamberley',NULL,'chartersofcamberley@peugeotmail.co.uk','camberley','2010-01-12 11:03:38',0,NULL,NULL,1,'01276691800','01276686294',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (619,4,'Ms','Charterssofaalton',NULL,'Charterssofaalton@peugeotmail.co.uk','Alton','2010-01-12 11:03:38',0,NULL,NULL,1,'01420562354','01420564225',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (620,4,'Ms','Chinesegarage',NULL,'Chinesegarage@peugeotmail.co.uk','Beckenham','2010-01-12 11:03:38',0,NULL,NULL,1,'02086503466','02086633688',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (621,4,'Ms','Chrissoley',NULL,'chrissoley@warners.uk.com','cheltenham','2010-01-12 11:03:38',0,NULL,NULL,1,'01242777700','01242777711',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (622,4,'Ms','Citymotorsgateshead',NULL,'citymotorsgateshead@peugeotmail.co.uk','gateshead','2010-01-12 11:03:38',0,NULL,NULL,1,'01914933500','01914606945',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (623,4,'Ms','Citymotorsliverpool',NULL,'citymotorsliverpool@peugoetmail.co.uk','liverpool','2010-01-12 11:03:38',0,NULL,NULL,1,'01512541010','01512547317',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (624,4,'Ms','Citymotorsnewcastle',NULL,'citymotorsnewcastle@peugoetmail.co.uk','newcastleupontyne','2010-01-12 11:03:38',0,NULL,NULL,1,'01912666361','01912700660',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (625,4,'Ms','Clarkskidderminster',NULL,'clarkskidderminster@peugoetmail.co.uk','kidderminster','2010-01-12 11:03:38',0,NULL,NULL,1,'0156267394','0156267565',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (626,4,'Ms','Clock',NULL,'Clock@peugeotmail.co.uk','Birmingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01217474712','01217494243',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (627,4,'Ms','Cmc',NULL,'cmc@peugeotmail.co.uk','campbeltown','2010-01-12 11:03:38',0,NULL,NULL,1,'01586552030','01586554929',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (628,4,'Ms','Cmgalfreton',NULL,'Cmgalfreton@peugeotmail.co.uk','Alferton','2010-01-12 11:03:38',0,NULL,NULL,1,'01773832572','01773831625',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (629,4,'Ms','Colliers',NULL,'Colliers@peugeotmail.co.uk','Birmingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01213823100','01213772613',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (630,4,'Ms','Concours',NULL,'concours@peugoetmail.co.uk','haslemere','2010-01-12 11:03:38',0,NULL,NULL,1,'01428652551','01428653573',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (631,4,'Ms','Co-Opgrantham',NULL,'co-opgrantham@peugeotmail.co.uk','grantham','2010-01-12 11:03:38',0,NULL,NULL,1,'01476562595','01476590477',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (632,4,'Ms','Corby.Motors',NULL,'corby.motors@peugeotmail.co.uk','corby','2010-01-12 11:03:38',0,NULL,NULL,1,'01536203171','01536402471',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (633,4,'Ms','Corbymotorskettering',NULL,'corbymotorskettering@peugoetmail.co.uk','kettering','2010-01-12 11:03:38',0,NULL,NULL,1,'01536483473','01536481240',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (634,4,'Ms','Crawley.Down',NULL,'crawley.down@peugeotmail.co.uk','crawley','2010-01-12 11:03:38',0,NULL,NULL,1,'01293443322','01293517032',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (635,4,'Ms','Curtis_Peugeot',NULL,'curtis_peugeot@peugeotmail.co.uk','coleraine','2010-01-12 11:03:38',0,NULL,NULL,1,'02870322777','02870322778',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (636,4,'Ms','Curtisnewtownabbey',NULL,'Curtisnewtownabbey@peugeotmail.co.uk','Belfast','2010-01-12 11:03:38',0,NULL,NULL,1,'02890838500','02890838777',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (637,4,'Ms','Dale-Garage',NULL,'dale-garage@peugeotmail.co.uk','hexham','2010-01-12 11:03:38',0,NULL,NULL,1,'01434604527','01434601771',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (638,4,'Ms','David_Kerr_Chelmsford',NULL,'david_kerr_chelmsford@peugeotmail.co.uk','chelmsford','2010-01-12 11:03:38',0,NULL,NULL,1,'01245262162','01245494114',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (639,4,'Ms','Davidhayton',NULL,'davidhayton@peugoetmail.co.uk','penrith','2010-01-12 11:03:38',0,NULL,NULL,1,'01768890870','01768890950',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (640,4,'Ms','Davidhaytonkendal',NULL,'davidhaytonkendal@peugoetmail.co.uk','kendal','2010-01-12 11:03:38',0,NULL,NULL,1,'01539737333','01539737444',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (641,4,'Ms','Davidhaytonlancaster',NULL,'davidhaytonlancaster@peugoetmail.co.uk','morecambe','2010-01-12 11:03:38',0,NULL,NULL,1,'0152462939','0152436163',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (642,4,'Ms','Davids-Of-Harrogate',NULL,'davids-of-harrogate@[eugoetmail.co.uk','harrogate','2010-01-12 11:03:38',0,NULL,NULL,1,'01423818900','01423818901',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (643,4,'Ms','Dixgrimsby',NULL,'dixgrimsby@peugeotmail.co.uk','grimsby','2010-01-12 11:03:38',0,NULL,NULL,1,'01472246247','01472240425',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (644,4,'Ms','Dixon_Of_Doncaster',NULL,'dixon_of_doncaster@peugeotmail.co.uk','doncaster','2010-01-12 11:03:38',0,NULL,NULL,1,'01302303700','01302303701',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (645,4,'Ms','Dixon_Of_Mansfield',NULL,'dixon_of_mansfield@peugoetmail.co.uk','mansfield','2010-01-12 11:03:38',0,NULL,NULL,1,'01623422244','01623662545',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (646,4,'Ms','Donnelly_Tggert',NULL,'donnelly_tggert@peugeotmail.co.uk','eglinton','2010-01-12 11:03:38',0,NULL,NULL,1,'02871813636','02871813001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (647,4,'Ms','Donnellybros.Enniskillen',NULL,'donnellybros.enniskillen@peugeotmail.co.uk','enniskillen','2010-01-12 11:03:38',0,NULL,NULL,1,'02866324411','02866344358',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (648,4,'Ms','Dunstonian',NULL,'dunstonian@peugoetmail.co.uk','orpington','2010-01-12 11:03:38',0,NULL,NULL,1,'01689832545','01689878258',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (649,4,'Ms','Duttonforshaw',NULL,'duttonforshaw@peugeotmail.co.uk','cardiff','2010-01-12 11:03:38',0,NULL,NULL,1,'02920394213','02920239749',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (650,4,'Ms','Duttonforshawcolchave_Cardiff',NULL,'duttonforshawcolchave_cardiff@peugeotmail.co.uk','cardiff','2010-01-12 11:03:38',0,NULL,NULL,1,'02920433800','02920433888',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (651,4,'Ms','Duttonforshawnewport',NULL,'duttonforshawnewport@peugoetmail.co.uk','newport','2010-01-12 11:03:38',0,NULL,NULL,1,'01633280111','01633294450',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (652,4,'Ms','Edwardmcalindenltd',NULL,'edwardmcalindenltd@peugoetmail.co.uk','newry','2010-01-12 11:03:38',0,NULL,NULL,1,'02830262877','02830251328',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (653,4,'Ms','Elimgarage',NULL,'Elimgarage@peugeotmail.co.uk','Anglessy','2010-01-12 11:03:38',0,NULL,NULL,1,'01248750251','01248750293',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (654,4,'Ms','Eltonbury',NULL,'eltonbury@peugeotmail.co.uk','bury','2010-01-12 11:03:38',0,NULL,NULL,1,'01617643366','016176432239',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (655,4,'Ms','Eltonmanchester',NULL,'eltonmanchester@peugoetmail.co.uk','manchester','2010-01-12 11:03:38',0,NULL,NULL,1,'01617088614','01617088621',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (656,4,'Ms','Eltonoldham',NULL,'eltonoldham@peugoetmail.co.uk','oldham','2010-01-12 11:03:38',0,NULL,NULL,1,'01616524422','01616521380',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (657,4,'Ms','Coatbridge',NULL,'emailgivennotvalid','coatbridge','2010-01-12 11:03:38',0,NULL,NULL,1,'01236710008','01236710337',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (658,4,'Ms','Eurocars',NULL,'eurocars@peugeotmail.co.uk','douglas','2010-01-12 11:03:38',0,NULL,NULL,1,'01624611700','01624662363',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (659,4,'Ms','Faringdongarage',NULL,'faringdongarage@peugeotmail.co.uk','faringdon','2010-01-12 11:03:38',0,NULL,NULL,1,'01367241212','01367242645',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (660,4,'Ms','Forestroad',NULL,'forestroad@peugeot.co.uk','coalville','2010-01-12 11:03:38',0,NULL,NULL,1,'01530836114','01530510272',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (661,4,'Ms','Frascraw',NULL,'frascraw@peugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01417750212','01417778376',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (662,4,'Ms','Fussell_Wadman',NULL,'fussell_wadman@peugeotmail.co.uk','devizes','2010-01-12 11:03:38',0,NULL,NULL,1,'01380731970','01380731971',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (663,4,'Ms','Gates',NULL,'Gates@peugoetmail.co.uk','Brockenhurst','2010-01-12 11:03:38',0,NULL,NULL,1,'01590623344','01590623802',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (664,4,'Ms','Gateway',NULL,'gateway@peugeotmail.co.uk','crewe','2010-01-12 11:03:38',0,NULL,NULL,1,'01270587711','01270583231',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (665,4,'Ms','Gavingillies',NULL,'gavingillies@peugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01413363211','01413361195',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (666,4,'Ms','Georgehatell',NULL,'georgehatell@peugeotmail.co.uk','christchurch','2010-01-12 11:03:38',0,NULL,NULL,1,'01202703603','01202296853',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (667,4,'Ms','Georgeheath',NULL,'Georgeheath@peugeotmail.co.uk','Birmingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01217667700','01217668140',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (668,4,'Ms','Gillanders',NULL,'gillanders@peugoetmail.co.uk','peterhead','2010-01-12 11:03:38',0,NULL,NULL,1,'01779479777','0177947731',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (669,4,'Ms','Glenvarigilldundee',NULL,'glenvarigilldundee@peugeotmail.co.uk','dundee','2010-01-12 11:03:38',0,NULL,NULL,1,'01382576000','01382576002',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (670,4,'Ms','Gloversofilikey',NULL,'gloversofilikey@peugoetmail.co.uk','ilikey','2010-01-12 11:03:38',0,NULL,NULL,1,'01943432300','01943816203',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (671,4,'Ms','Griffinmill',NULL,'griffinmill@peugoetmail.co.uk','pontypridd','2010-01-12 11:03:38',0,NULL,NULL,1,'01443842216','01443842584',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (672,4,'Ms','Guyperry',NULL,'Guyperry@peugeotmail.co.uk','Barrow-in-furness','2010-01-12 11:03:38',0,NULL,NULL,1,'01229825580','01229827506',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (673,4,'Ms','Hafrenmotors',NULL,'hafrenmotors@peugoetmail.co.uk','llanidssloes','2010-01-12 11:03:38',0,NULL,NULL,1,'01686412106','01686413681',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (674,4,'Ms','Hallsbrickenhead',NULL,'Hallsbrickenhead@peugeotmail.co.uk','Birkenhead','2010-01-12 11:03:38',0,NULL,NULL,1,'01516473969','01516474170',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (675,4,'Ms','Hardie_Of_Larbert',NULL,'hardie_of_larbert@peugeotmail.co.uk','falkirk','2010-01-12 11:03:38',0,NULL,NULL,1,'01324562799','01324552365',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (676,4,'Ms','Hardieofdunfermline',NULL,'hardieofdunfermline@peugeotmail.co.uk','dunfermline','2010-01-12 11:03:38',0,NULL,NULL,1,'013836214114','013835559901',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (677,4,'Ms','Harrydando',NULL,'harrydando@peugeotmail.co.uk','chippingsodbury','2010-01-12 11:03:38',0,NULL,NULL,1,'01454318311','01454422255',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (678,4,'Ms','Hartwellbath',NULL,'Hartwellbath@peugeotmail.co.uk','Bath','2010-01-12 11:03:38',0,NULL,NULL,1,'08709049170','01225402255',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (679,4,'Ms','Hartwelldunstable',NULL,'hartwelldunstable@peugeotmail.co.uk','dunstable','2010-01-12 11:03:38',0,NULL,NULL,1,'08709049370','01582443567',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (680,4,'Ms','Hartwellferndown',NULL,'hartwellferndown@peugeotmail.co.uk','ferndown','2010-01-12 11:03:38',0,NULL,NULL,1,'01202862286','01202875451',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (681,4,'Ms','Hartwellpoole',NULL,'hartwellpoole@peugoetmail.co.uk','poole','2010-01-12 11:03:38',0,NULL,NULL,1,'01202338400','01202665857',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (682,4,'Ms','Hawkinshayle',NULL,'hawkinshayle@peugeotmail.co.uk','hayle','2010-01-12 11:03:38',0,NULL,NULL,1,'01736753143','01736756347',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (683,4,'Ms','Hawkinsperryn',NULL,'hawkinsperryn@peugoetmail.co.uk','penryn','2010-01-12 11:03:38',0,NULL,NULL,1,'01326377206','01326370040',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (684,4,'Ms','Hjphillips',NULL,'hjphillips@peugoetmail.co.uk','llanelli','2010-01-12 11:03:38',0,NULL,NULL,1,'01554772087','01554754053',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (685,4,'Ms','Hodge-Childs',NULL,'Hodge-childs@peugeotmail.co.uk','Bembridge','2010-01-12 11:03:38',0,NULL,NULL,1,'01983872121','01983872487',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (686,4,'Ms','Horderns',NULL,'horderns@peugeotmail.co.uk','chapel-en-le-frith','2010-01-12 11:03:38',0,NULL,NULL,1,'01298813314','01298815219',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (687,4,'Ms','Howardabram',NULL,'howardabram@peugoetmail.co.uk','portadown','2010-01-12 11:03:38',0,NULL,NULL,1,'02838333344','02838351408',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (688,4,'Ms','Howardscarmarthen',NULL,'howardscarmarthen@peugeotmail.co.uk','carmarthen','2010-01-12 11:03:38',0,NULL,NULL,1,'01267233345','01267235352',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (689,4,'Ms','Howes',NULL,'howes@peugeotmail.co.uk','fakenham','2010-01-12 11:03:38',0,NULL,NULL,1,'01328864035','01328856310',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (690,4,'Ms','Ianrswanney',NULL,'ianrswanney@peugoetmail.co.uk','kirkwall','2010-01-12 11:03:38',0,NULL,NULL,1,'01856872805','01856876395',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (691,4,'Ms','Imperial',NULL,'imperial@peugoetmail.co.uk','haverfordwest','2010-01-12 11:03:38',0,NULL,NULL,1,'01437768000','01437761820',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (692,4,'Ms','Info',NULL,'info@pentagon-group.co.uk','burton-on-trent','2010-01-12 11:03:38',0,NULL,NULL,1,'01283515151','01283511375',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (693,4,'Ms','Jct600Badford',NULL,'Jct600badford@peugeotmail.co.uk','Bradford','2010-01-12 11:03:38',0,NULL,NULL,1,'01274657200','01274651396',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (694,4,'Ms','Jct600Hull',NULL,'jct600hull@peugoetmail.co.uk','hull','2010-01-12 11:03:38',0,NULL,NULL,1,'01482482600','01482482660',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (695,4,'Ms','Jjcookson',NULL,'jjcookson@peugoetmail.co.uk','macclesfield','2010-01-12 11:03:38',0,NULL,NULL,1,'01625422226','01625618863',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (696,4,'Ms','Joblings',NULL,'Joblings@peugeotmail.co.uk','Bicester','2010-01-12 11:03:38',0,NULL,NULL,1,'01869252255','01869246750',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (697,4,'Ms','Johngroseltd',NULL,'johngroseltd@peugoetmail.co.uk','ipswich','2010-01-12 11:03:38',0,NULL,NULL,1,'01473705300','01473715184',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (698,4,'Ms','Johnharrison',NULL,'johnharrison@peugoetmail.co.uk','nottingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01159664112','01159664114',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (699,4,'Ms','Braintree',NULL,'Johnpease@peugoetmail.co.uk','Braintree','2010-01-12 11:03:38',0,NULL,NULL,1,'01376550502','01376552122',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (700,4,'Ms','Johnston',NULL,'johnston@peugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01418428800','01418428844',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (701,4,'Ms','Jsautos',NULL,'Jsautos@peugeotmail.co.uk','Basingstoke','2010-01-12 11:03:38',0,NULL,NULL,1,'01256359994','01256811177',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (702,4,'Ms','Kap',NULL,'kap@peugeotmail.co.uk','folkestone','2010-01-12 11:03:38',0,NULL,NULL,1,'01303228200','01303228222',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (703,4,'Ms','Keithpricegarages',NULL,'Keithpricegarages@peugeotmail.co.uk','Abergavenny','2010-01-12 11:03:38',0,NULL,NULL,1,'01873811555','01873811733',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (704,4,'Ms','Kens_Garage',NULL,'kens_garage@peugoetmail.co.uk','invergordon','2010-01-12 11:03:38',0,NULL,NULL,1,'01862842266','01862842792',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (705,4,'Ms','Ladyacrelanark',NULL,'ladyacrelanark@peugoetmail.co.uk','lanark','2010-01-12 11:03:38',0,NULL,NULL,1,'01555662662','01555665025',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (706,4,'Ms','Lyons-Bros',NULL,'lyons-bros@peugeotmail.co.uk','castlederg','2010-01-12 11:03:38',0,NULL,NULL,1,'02881671972','02881670966',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (707,4,'Ms','Mainbox',NULL,'Mainbox@peugoetmail.co.uk','Bishopsstortford','2010-01-12 11:03:38',0,NULL,NULL,1,'01279653494','01279755594',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (708,4,'Ms','Manoroak.Bridgeofdon',NULL,'Manoroak.bridgeofdon@peugeotmail.co.uk','Aberdeen','2010-01-12 11:03:38',0,NULL,NULL,1,'01224826300','01224823381',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (709,4,'Ms','Marshallbedford',NULL,'Marshallbedford@peugeotmail.co.uk','Bedford','2010-01-12 11:03:38',0,NULL,NULL,1,'01234856161','01234857801',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (710,4,'Ms','Marshallburystemunds',NULL,'marshallburystemunds@peugeotmail.co.uk','burystedmunds','2010-01-12 11:03:38',0,NULL,NULL,1,'01284767344','01284703557',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (711,4,'Ms','Marshallpeterborough',NULL,'marshallpeterborough@peugoetmail.co.uk','peterborough','2010-01-12 11:03:38',0,NULL,NULL,1,'01733896666','01733555635',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (712,4,'Ms','Marshallpeugoethuntingdon',NULL,'marshallpeugoethuntingdon@peugoetmail.co.uk','huntingdon','2010-01-12 11:03:38',0,NULL,NULL,1,'01480435626','01480412640',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (713,4,'Ms','Marshallsnewbury',NULL,'marshallsnewbury@peugoetmail.co.uk','newbury','2010-01-12 11:03:38',0,NULL,NULL,1,'01635572900','01635572901',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (714,4,'Ms','Melvin_Motors',NULL,'melvin_motors@peugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01412482345','01412225917',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (715,4,'Ms','Merrittsamersham',NULL,'merrittsamersham@peugeotmail.co.uk','chesham','2010-01-12 11:03:38',0,NULL,NULL,1,'01494792222','01494791318',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (716,4,'Ms','Mochdre.Llandudno',NULL,'mochdre.llandudno@peugeotmail.co.uk','colwynbay','2010-01-12 11:03:38',0,NULL,NULL,1,'01492544278','01492860211',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (717,4,'Ms','Mochdrellandudno',NULL,'mochdrellandudno@peugoetmail.co.uk','llandudno','2010-01-12 11:03:38',0,NULL,NULL,1,'01492860060','01492860211',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (718,4,'Ms','Motorhaven',NULL,'motorhaven@peugeotmail.co.uk','hastings','2010-01-12 11:03:38',0,NULL,NULL,1,'01424444442','01424718097',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (719,4,'Ms','Motorwaycars',NULL,'Motorwaycars@peugeotmail.co.uk','Bathgate','2010-01-12 11:03:38',0,NULL,NULL,1,'01506655522','01506655799',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (720,4,'Ms','Mountvernon',NULL,'mountvernon@eugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01417787779','01417781131',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (721,4,'Ms','Mrking',NULL,'mrking@peugoetmail.co.uk','lowestoft','2010-01-12 11:03:38',0,NULL,NULL,1,'01502573955','01502587075',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (722,4,'Ms','Msfhuddersfield',NULL,'msfhuddersfield@peugoetmail.co.uk','huddersfield','2010-01-12 11:03:38',0,NULL,NULL,1,'01484550100','01484420822',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (723,4,'Ms','Msfleeds',NULL,'msfleeds@peugoetmail.co.uk','leeds','2010-01-12 11:03:38',0,NULL,NULL,1,'01132800200','01132800212',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (724,4,'Ms','Ngdickens',NULL,'ngdickens@peugeotmail.co.uk','chester','2010-01-12 11:03:38',0,NULL,NULL,1,'01244336565','01244332258',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (725,4,'Ms','Normainlaing',NULL,'Normainlaing@peugeotmail.co.uk','Blairgiwrue','2010-01-12 11:03:38',0,NULL,NULL,1,'01250872333','01250874794',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (726,4,'Ms','Nortonway',NULL,'nortonway@peugoetmail.co.uk','letchworth','2010-01-12 11:03:38',0,NULL,NULL,1,'01462484141','01462485222',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (727,4,'Ms','Olympiccirencester',NULL,'olympiccirencester@peugeotmail.co.uk','cirencester','2010-01-12 11:03:38',0,NULL,NULL,1,'01285626410','01285626411',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (728,4,'Ms','P_And_G',NULL,'p_and_g@peugoetmail.co.uk','newark-on-trent','2010-01-12 11:03:38',0,NULL,NULL,1,'01636673888','01636605251',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (729,4,'Ms','Pat.Lewis',NULL,'pat.lewis@peugeotmail.co.uk','diss','2010-01-12 11:03:38',0,NULL,NULL,1,'01379641100','01379643745',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (730,4,'Ms','Pavilionmotors',NULL,'pavilionmotors@peugeotmail.co.uk','derby','2010-01-12 11:03:38',0,NULL,NULL,1,'01332361626','01332296268',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (731,4,'Ms','Perrysblackburn',NULL,'Perrysblackburn@peugeotmail.co.uk','Blackburn','2010-01-12 11:03:38',0,NULL,NULL,1,'01254661616','01254262117',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (732,4,'Ms','Perrysbolton',NULL,'Perrysbolton@peugeotmail.co.uk','Bolton','2010-01-12 11:03:38',0,NULL,NULL,1,'01204362747','01204359108',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (733,4,'Ms','Perrysclitheroe',NULL,'perrysclitheroe@peugeot.co.uk','clitheroe','2010-01-12 11:03:38',0,NULL,NULL,1,'01200422255','01200428599',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (734,4,'Ms','Perrysmiltonkeynes',NULL,'perrysmiltonkeynes@peugoetmail.co.uk','miltonkeynes','2010-01-12 11:03:38',0,NULL,NULL,1,'01908360200','01908360262',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (735,4,'Ms','Perrysnelson',NULL,'perrysnelson@peugoetmail.co.uk','nelson','2010-01-12 11:03:38',0,NULL,NULL,1,'01282606606','01282614000',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (736,4,'Ms','Peterambroseltd',NULL,'peterambroseltd@peugeotmail.co.uk','castleford','2010-01-12 11:03:38',0,NULL,NULL,1,'01977522800','01977522801',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (737,4,'Ms','Peternashhereford',NULL,'peternashhereford@peugeotmail.co.uk','hereford','2010-01-12 11:03:38',0,NULL,NULL,1,'01432276268','01432359094',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (738,4,'Ms','Platts',NULL,'platts@peugeotmail.co.uk','highwycombe','2010-01-12 11:03:38',0,NULL,NULL,1,'01494474177','01494474217',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (739,4,'Ms','Pobakerssonsltd',NULL,'pobakerssonsltd@peugeotmail.co.uk','gillingham','2010-01-12 11:03:38',0,NULL,NULL,1,'01747822434','01747824250',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (740,4,'Ms','Poolespeugeot',NULL,'poolespeugeot@peugeotmail.co.uk','gosport','2010-01-12 11:03:38',0,NULL,NULL,1,'01329286114','01329822535',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (741,4,'Ms','Portfield',NULL,'portfield@peugeotmail.co.uk','chichester','2010-01-12 11:03:38',0,NULL,NULL,1,'01243782163','01243831210',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (742,4,'Ms','Randersonpeugoet',NULL,'randersonpeugoet@peugoetmail.co.uk','leeds','2010-01-12 11:03:38',0,NULL,NULL,1,'01132583198','01133933445',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (743,4,'Ms','Regal',NULL,'Regal@peugoetmail.co.uk','Bromsgrove','2010-01-12 11:03:38',0,NULL,NULL,1,'01527575157','08704862765',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (744,4,'Ms','Regencycars',NULL,'regencycars@peugoetmail.co.uk','newtownards','2010-01-12 11:03:38',0,NULL,NULL,1,'02891814581','02891817967',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (745,4,'Ms','Renwicksexeter',NULL,'renwicksexeter@peugeotmail.co.uk','exeter','2010-01-12 11:03:38',0,NULL,NULL,1,'01392206206','01392206210',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (746,4,'Ms','Renwickshoniton',NULL,'renwickshoniton@peugoetmail.co.uk','honiton','2010-01-12 11:03:38',0,NULL,NULL,1,'0140444291','014044684',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (747,4,'Ms','Renwicksplymouth',NULL,'renwicksplymouth@peugoetmail.co.uk','plymouth','2010-01-12 11:03:38',0,NULL,NULL,1,'01752206206','01752206210',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (748,4,'Ms','Researchgarage',NULL,'researchgarage@peugeotmail.co.uk','hinckley','2010-01-12 11:03:38',0,NULL,NULL,1,'01455637152','01455615087',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (749,4,'Ms','Richardhardie10',NULL,'richardhardie10@peugeotmail.co.uk','chester-le-street','2010-01-12 11:03:38',0,NULL,NULL,1,'01913700355','01913701749',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (750,4,'Ms','Richardhardie30',NULL,'Richardhardie30@peugeotmail.co.uk','Ashington','2010-01-12 11:03:38',0,NULL,NULL,1,'01670853000','01670810000',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (751,4,'Ms','Richwoodgarage',NULL,'richwoodgarage@peugeotmail.co.uk','goole','2010-01-12 11:03:38',0,NULL,NULL,1,'01405720990','01405765266',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (752,4,'Ms','Roadsidelisburn',NULL,'roadsidelisburn@peugoetmail.co.uk','lisburn','2010-01-12 11:03:38',0,NULL,NULL,1,'02892677412','02892672815',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (753,4,'Ms','Rockingham',NULL,'rockingham@peugoetmail.co.uk','meltonmowbray','2010-01-12 11:03:38',0,NULL,NULL,1,'01664560141','01664410185',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (754,4,'Ms','Rootesmail',NULL,'rootesmail@peugoetmail.co.uk','maidstone','2010-01-12 11:03:38',0,NULL,NULL,1,'01622753333','01622690526',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (755,4,'Ms','Royevans',NULL,'royevans@peugoetmail.co.uk','oswestry','2010-01-12 11:03:38',0,NULL,NULL,1,'01691652301','01691670286',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (756,4,'Ms','Semples',NULL,'Semples@peugeotmail.co.uk','Berwickupontweed','2010-01-12 11:03:38',0,NULL,NULL,1,'01289330707','01289330286',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (757,4,'Ms','Sheildsblantyre',NULL,'sheildsblantyre@peugeotmail.co.uk','hamilton','2010-01-12 11:03:38',0,NULL,NULL,1,'01698711610','01698711612',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (758,4,'Ms','Shieldsglasgow',NULL,'shieldsglasgow@peugeotmail.co.uk','glasgow','2010-01-12 11:03:38',0,NULL,NULL,1,'01418808100','01414292391',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (759,4,'Ms','Shippenham',NULL,'shippenham@peugeotmail.co.uk','chippenham','2010-01-12 11:03:38',0,NULL,NULL,1,'01249446333','01249449930',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (760,4,'Ms','Sidegatemotors',NULL,'sidegatemotors@peugeotmail.co.uk','greatyarmouth','2010-01-12 11:03:38',0,NULL,NULL,1,'01493656841','01493440351',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (761,4,'Ms','Simonbailes',NULL,'simonbailes@peugoetmail.co.uk','northallerton','2010-01-12 11:03:38',0,NULL,NULL,1,'01609780888','01609780495',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (762,4,'Ms','Simonbailes1',NULL,'simonbailes1@peugeotmail.co.uk','guisborough','2010-01-12 11:03:38',0,NULL,NULL,1,'01287610888','01287610555',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (763,4,'Ms','Southgate_Blandford',NULL,'Southgate_blandford@peugeotmail.co.uk','Blandfordforum','2010-01-12 11:03:38',0,NULL,NULL,1,'01258454483','01258480406',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (764,4,'Ms','Southgateanddover',NULL,'Southgateanddover@peugeotmail.co.uk','Andover','2010-01-12 11:03:38',0,NULL,NULL,1,'01264325000','01264325001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (765,4,'Ms','Staceymotors',NULL,'Staceymotors@peugoetmail.co.uk','Bridgwater','2010-01-12 11:03:38',0,NULL,NULL,1,'01278458363','01278453968',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (766,4,'Ms','Staghill',NULL,'staghill@peugeotmail.co.uk','godalming','2010-01-12 11:03:38',0,NULL,NULL,1,'01483414311','01483426974',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (767,4,'Ms','Sterlingkingslynn',NULL,'sterlingkingslynn@peugoetmail.co.uk','kingslynn','2010-01-12 11:03:38',0,NULL,NULL,1,'01553660300','01553769090',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (768,4,'Ms','Sterlingnorthwich',NULL,'sterlingnorthwich@peugoetmail.co.uk','norwich','2010-01-12 11:03:39',0,NULL,NULL,1,'01603219951','01603219951',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (769,4,'Ms','Struanmotors',NULL,'struanmotors@peugoetmail.co.uk','perth','2010-01-12 11:03:39',0,NULL,NULL,1,'01738632222','01738623136',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (770,4,'Ms','Sunwin',NULL,'sunwin@peugeotmail.co.uk','halifax','2010-01-12 11:03:39',0,NULL,NULL,1,'01422344424','01422352770',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (771,4,'Ms','Sunwinilikeston',NULL,'sunwinilikeston@peugoetmail.co.uk','ilikeston','2010-01-12 11:03:39',0,NULL,NULL,1,'01159441333','01159447325',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (772,4,'Ms','Sunwinloughborough',NULL,'sunwinloughborough@peugoetmail.co.uk','loughborough','2010-01-12 11:03:39',0,NULL,NULL,1,'01509611000','01509643099',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (773,4,'Ms','Sunwinmotors',NULL,'sunwinmotors@peugoetmail.co.uk','keighley','2010-01-12 11:03:39',0,NULL,NULL,1,'01535662521','01535690597',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (774,4,'Ms','Taylorsofboston',NULL,'Taylorsofboston@peugoetmail.co.uk','Boston','2010-01-12 11:03:39',0,NULL,NULL,1,'01205355666','01295359148',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (775,4,'Ms','Templegate',NULL,'Templegate@peugoetmail.co.uk','Bristol','2010-01-12 11:03:39',0,NULL,NULL,1,'01179261200','01179261201',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (776,4,'Ms','Templegatenorth',NULL,'Templegatenorth@peugoetmail.co.uk','Bristol','2010-01-12 11:03:39',0,NULL,NULL,1,'01179261200','01173011701',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (777,4,'Ms','Thegrand',NULL,'thegrand@peugoetmail.co.uk','margate','2010-01-12 11:03:39',0,NULL,NULL,1,'01843227933','01843224684',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (778,4,'Ms','Tomgarnermotors',NULL,'tomgarnermotors@peugoetmail.co.uk','manchester','2010-01-12 11:03:39',0,NULL,NULL,1,'01618346677','01618326180',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (779,4,'Ms','Tonduroadmotors',NULL,'Tonduroadmotors@peugoetmail.co.uk','Bridgend','2010-01-12 11:03:39',0,NULL,NULL,1,'01656659141','01656665362',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (780,4,'Ms','Toomeybrentwood',NULL,'Toomeybrentwood@peugeotmail.co.uk','Brentwood','2010-01-12 11:03:39',0,NULL,NULL,1,'01277221401','01268886713',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (781,4,'Ms','Toomeypershow',NULL,'Toomeypershow@peugeotmail.co.uk','Basildon','2010-01-12 11:03:39',0,NULL,NULL,1,'01268407407','01268886715',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (782,4,'Ms','Tounduroadmotors',NULL,'Tounduroadmotors@peugeotmail.co.uk','Bridgnorth','2010-01-12 11:03:39',0,NULL,NULL,1,'01746764424','01746763446',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (783,4,'Ms','Truscotts',NULL,'Truscotts@peugeotmail.co.uk','Barnstaple','2010-01-12 11:03:39',0,NULL,NULL,1,'01271326622','01271326655',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (784,4,'Ms','Truscottshelston',NULL,'truscottshelston@peugeotmail.co.uk','helston','2010-01-12 11:03:39',0,NULL,NULL,1,'01326573001','01326555690',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (785,4,'Ms','Truscottslaunceston',NULL,'truscottslaunceston@peugoetmail.co.uk','launceston','2010-01-12 11:03:39',0,NULL,NULL,1,'01566772277','01566776063',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (786,4,'Ms','Turtlesantrim',NULL,'Turtlesantrim@peugeotmail.co.uk','Antrim','2010-01-12 11:03:39',0,NULL,NULL,1,'02894469607','02894467107',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (787,4,'Ms','Underwoods',NULL,'underwoods@peugeot.co.uk','colchester','2010-01-12 11:03:39',0,NULL,NULL,1,'01206791177','01206794423',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (788,4,'Ms','Vikingbasingstoke',NULL,'Vikingbasingstoke@peugeotmail.co.uk','Basingstoke','2010-01-12 11:03:39',0,NULL,NULL,1,'01256697700','01256471303',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (789,4,'Ms','Vilton_Win',NULL,'vilton_win@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02083641500','02083641412',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (790,4,'Ms','Wallkingswinford',NULL,'wallkingswinford@peugoetmail.co.uk','kingswinford','2010-01-12 11:03:39',0,NULL,NULL,1,'01384288333','01384294332',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (791,4,'Ms','Warnerspeugeotgloucester',NULL,'warnerspeugeotgloucester@peugeotmail.co.uk','gloucester','2010-01-12 11:03:39',0,NULL,NULL,1,'01452529755','01452309306',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (792,4,'Ms','Warwick_Wright_Croydon',NULL,'warwick_wright_croydon@peugeotmail.co.uk','croydon','2010-01-12 11:03:39',0,NULL,NULL,1,'02086685435','02086688146',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (793,4,'Ms','Warwick-Wright-Chiswick',NULL,'warwick-wright-chiswick@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02089573000','02089573001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (794,4,'Ms','Waters_Hat',NULL,'waters_hat@peugoetmail.co.uk','hatfield','2010-01-12 11:03:39',0,NULL,NULL,1,'01707624521','01707251139',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (795,4,'Ms','Waters_Her',NULL,'waters_her@peugeotmail.co.uk','hertford','2010-01-12 11:03:39',0,NULL,NULL,1,'01992583044','01992558720',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (796,4,'Ms','Waterschingford',NULL,'waterschingford@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02085297972','02085299595',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (797,4,'Ms','Westheath',NULL,'westheath@peugeotmail.co.uk','farnborough','2010-01-12 11:03:39',0,NULL,NULL,1,'01252541294','01252375642',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (798,4,'Ms','Caernarfon',NULL,'','caernarfon','2010-01-12 11:03:39',0,NULL,NULL,1,'01286673372','01286675153',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (799,4,'Ms','Willoughbygroup',NULL,'willoughbygroup@peugoetmail.co.uk','nottingham','2010-01-12 11:03:39',0,NULL,NULL,1,'01159258282','01159229414',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (800,4,'Ms','Willoughbypeugoet',NULL,'willoughbypeugoet@peugoetmail.co.uk','nottingham','2010-01-12 11:03:39',0,NULL,NULL,1,'01159626467','01159691153',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (801,4,'Ms','Wilsonsepsom',NULL,'wilsonsepsom@peugeotmail.co.uk','epsom','2010-01-12 11:03:39',0,NULL,NULL,1,'01372747444','01372747979',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (802,4,'Ms','Wjkingdartford',NULL,'wjkingdartford@peugeotmail.co.uk','dartford','2010-01-12 11:03:39',0,NULL,NULL,1,'01322222171','01322227517',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (803,4,'Ms','Woodkirkgarage',NULL,'woodkirkgarage@peugeotmail.co.uk','dewsbury','2010-01-12 11:03:39',0,NULL,NULL,1,'01924444655','01924441332',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (804,4,'Ms','Wwbrentcross',NULL,'wwbrentcross@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02084520041','02084505487',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (805,4,'Ms','Wwcity',NULL,'wwcity@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02077919000','02077919001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (806,4,'Ms','Wwclapham',NULL,'wwclapham@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02077205151','02076224986',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (807,4,'Ms','Wwealing',NULL,'wwealing@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02088321900','02088403293',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (808,4,'Ms','Wwedgware',NULL,'wwedgware@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02087311000','02087311001',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (809,4,'Ms','Wwilford',NULL,'wwilford@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02085189600','02085189601',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (810,4,'Ms','Wwmorden',NULL,'wwmorden@peugoetmail.co.uk','london','2010-01-12 11:03:39',0,NULL,NULL,1,'02085448100','02085448101',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (811,4,'Ms','Wycliffe',NULL,'wycliffe@peugoetmail.co.uk','lutterworth','2010-01-12 11:03:39',0,NULL,NULL,1,'01455552177','01455559035',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (812,4,'Mr','Gowrisankar','Narayan','gowri@softwaresystemseurope.com','test','2010-01-12 11:18:24',4,'2010-01-12 11:18:24',4,1,'07850151413','234252',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (813,4,'Mr','A Test','Test','neverexistingmail','TEST','2010-01-12 16:23:43',4,'2010-01-12 16:23:43',4,1,'3252525','25325',800,900,NULL,NULL,NULL,NULL,24,'INDIA',NULL),
 (972,1,'Ms','Acpeugeotin','','acpeugeotin@peugoetmail.co.uk','01463 711493','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01463 231536',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (973,1,'Ms','Agm.Healy','','agm.healy@evanshalshaw.com','0131 442 4175','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0131 453 6644',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (974,1,'Ms','Akanmilne','','akanmilne@peugeotmail.co.uk','01343 535531','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01343 542254',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (975,1,'Ms','Allelectrichalesowen','','allelectrichalesowen@peugeotmail.co.uk','0121 504 2131','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0121 550 1020',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (976,1,'Ms','Allenford','','allenford@peugoetmail.co.uk','01604 625001','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01604 625400',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (977,1,'Ms','Anthonymotors','','Anthonymotors@peugeotmail.co.uk','01970 625187','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01970 624444',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (978,1,'Ms','Arburyleamington','','arburyleamington@peugoetmail.co.uk','01926 740001','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01926 740000',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (979,1,'Ms','Arburylichfield','','arburylichfield@peugoetmail.co.uk','01543 250927','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01543 414404',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (980,1,'Ms','Arburynuneeaton','','Arburynuneeaton@peugoetmail.co.uk','024 2664 0505','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'024 7631 3146',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (981,1,'Ms','Arnoldclark','','arnoldclark@peugeotmail.co.uk','0131 228 4712','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0131 669 7799',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (982,1,'Ms','Arnoldclarkclydebank','Test','arnoldclarkclydebank@peugeotmail.co.uk','01389 879710','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01389 878666',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (983,1,'Ms','Arnoldclarkkilmarnock','','arnoldclarkkilmarnock@peugoetmail.co.uk','01563 539638','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01563 541727',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (984,1,'Ms','Arnoldclarkkirkcaldy','','arnoldclarkkirkcaldy@peugoetmail.co.uk','01592 653100','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01592 655100',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (985,1,'Ms','Ashtonlynemotors','','Ashtonlynemotors@peugeotmail.co.uk','0161 3431242','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0161 34312333',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (986,1,'Ms','Barkersmalton','','barkersmalton@peugoetmail.co.uk','01653 697437','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01653 600111',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (987,1,'Ms','Becksbrighton','','Becksbrighton@peugoetmail.co.uk','01273 208425','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01273 320800',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (988,1,'Ms','Becksburgesshill','','becksburgesshill@peugeotmail.co.uk','01444 238030','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01444 238000',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (989,1,'Ms','Beckseastbourne','','beckseastbourne@peugeotmail.co.uk','01323 500666','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01323 500666',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (990,1,'Ms','Beechwoodmotors','','beechwoodmotors@peugeotmail.co.uk','024 7669 2044','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'024 7641 1515',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (991,1,'Ms','Bengrys','','bengrys@peugoetmail.co.uk','01568 614329','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01568 612337',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (992,1,'Ms','Birtwisle','','birtwisle@peugoetmail.co.uk','01606 33801','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01606 338338',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (993,1,'Ms','Blakes-Chesterfield','','blakes-chesterfield@peugeotmail.co.uk','01246 572728','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01246 572700',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (994,1,'Ms','Bobmullanmotors','','bobmullanmotors@peugoetmail.co.uk','028 7772 2080','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'028 7772 2164',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (995,1,'Ms','Bredonmotorco','','bredonmotorco@peugeotmail.co.uk','01386 765232','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01386 443505',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (996,1,'Ms','Bristolstreetharlow','','bristolstreetharlow@peugeotmail.co.uk','01279 624191','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01279 624190',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (997,1,'Ms','Bristolstreetnorthampton','','bristolstreetnorthampton@peugoetmail.co.uk','01604 785187','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01604 401141',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (998,1,'Ms','Bristolstreetoxford','','bristolstreetoxford@peugoetmail.co.uk','01865 748674','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01865 749000',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (999,1,'Ms','Broadbridge','','broadbridge@peugoetmail.co.uk','01403 259892','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01403 256383',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1000,1,'Ms','Browns','','browns@peugoetmail.co.uk','01507 609429','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01507 600422',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1001,1,'Ms','Brownwatts','','brownwatts@peugoetmail.co.uk','0208 780 2268','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0208 788 3593',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1002,1,'Ms','Bruce_Motors1','','bruce_motors1@peugeotmail.co.uk','01450 378951','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01450 372287',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1003,1,'Ms','Bruce_Motors2','','bruce_motors2@peugeotmail.co.uk','01896 751922','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01896 753024',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1004,1,'Ms','Bryanbrothers','','Bryanbrothers@peugoetmail.co.uk','0117 971 3221','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0117 971 8881',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1005,1,'Ms','Campionslincoln','','campionslincoln@peugoetmail.co.uk','01522 511318','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01522 510346',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1006,1,'Ms','Canterbury_Motor_Company','','canterbury_motor_company@peugeotmail.co.uk','01227 455786','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01227 451791',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1007,1,'Ms','Castlesabbeylane','','castlesabbeylane@peugoetmail.co.uk','0116 268 8666','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0116 268 8600',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1008,1,'Ms','Castlesnorborough','','castlesnorborough@peugoetmail.co.uk','0116 263 2709','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0116 263 2700',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1009,1,'Ms','Castlesstonygate','','castlesstonygate@peugoetmail.co.uk','0116 274 6809','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0116 274 6800',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1010,1,'Ms','Cdbramallblackpool','','Cdbramallblackpool@peugeotmail.co.uk','01253 768000','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01253 792840',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1011,1,'Ms','Cdbramallwestbromwich','','Cdbramallwestbromwich@peugeotmail.co.uk','0121 5006115','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0121 5537741',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1012,1,'Ms','Charles.Dell','','charles.dell@peugeotmail.co.uk','028 4483 3236','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'028 4483 3207',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1013,1,'Ms','Charleshurstknock','','Charleshurstknock@peugeotmail.co.uk','028 9040 1428','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'028 9070 3377',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1014,1,'Ms','Charleshurstpeugeot','','Charleshurstpeugeot@peugeotmail.co.uk','028 9066 1347','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'028 9038 3444',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1015,1,'Ms','Charters_Of_Aldershot','','Charters_of_aldershot@peugeotmail.co.uk','01252 343051','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01252 344878',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1016,1,'Ms','Chartersmaidenhead','','chartersmaidenhead@peugoetmail.co.uk','01628 627957','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01628 630192',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1017,1,'Ms','Chartersofcamberley','','chartersofcamberley@peugeotmail.co.uk','01276 686294','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01276 691800',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1018,1,'Ms','Charterssofaalton','','Charterssofaalton@peugeotmail.co.uk','01420 564225','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01420 562354',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1019,1,'Ms','Chinesegarage','','Chinesegarage@peugeotmail.co.uk','020 8663 3688','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'020 8650 3466',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1020,1,'Ms','Chrissoley','','chrissoley@warners.uk.com','01242 777711','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01242 777700',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1021,1,'Ms','Citymotorsgateshead','','citymotorsgateshead@peugeotmail.co.uk','0191 460 6945','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0191 493 3500',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1022,1,'Ms','Citymotorsliverpool','','citymotorsliverpool@peugoetmail.co.uk','0151 254 7317','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0151 254 1010',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1023,1,'Ms','Citymotorsnewcastle','','citymotorsnewcastle@peugoetmail.co.uk','0191 270 0660','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0191 266 6361',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1024,1,'Ms','Clarkskidderminster','','clarkskidderminster@peugoetmail.co.uk','01562 67565','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01562 67394',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1025,1,'Ms','Clock','','Clock@peugeotmail.co.uk','0121 749 4243','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'0121 747 4712',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1026,1,'Ms','Cmc','','cmc@peugeotmail.co.uk','01586 554929','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01586 552030',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1027,1,'Ms','Cmgalfreton','','Cmgalfreton@peugeotmail.co.uk','01773 831625','2010-01-14 15:24:08',1,'2010-01-14 15:24:08',1,1,NULL,'01773 832572',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1028,1,'Ms','Colliers','','Colliers@peugeotmail.co.uk','0121 3772613','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'0121 3823100',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1029,1,'Ms','Concours','','concours@peugoetmail.co.uk','01428 653573','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01428 652551',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1030,1,'Ms','Co-Opgrantham','','co-opgrantham@peugeotmail.co.uk','01476 590477','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01476 562595',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1031,1,'Ms','Corby.Motors','','corby.motors@peugeotmail.co.uk','01536 402471','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01536 203171',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1032,1,'Ms','Corbymotorskettering','','corbymotorskettering@peugoetmail.co.uk','01536 481240','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01536 483473',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1033,1,'Ms','Crawley.Down','','crawley.down@peugeotmail.co.uk','01293 517032','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01293 443322',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1034,1,'Ms','Curtis_Peugeot','','curtis_peugeot@peugeotmail.co.uk','028 70322778','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'028 7032 2777',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1035,1,'Ms','Curtisnewtownabbey','','Curtisnewtownabbey@peugeotmail.co.uk','028 9083 8777','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'028 9083 8500',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1036,1,'Ms','Dale-Garage','','dale-garage@peugeotmail.co.uk','01434 601771','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01434 604527',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1037,1,'Ms','David_Kerr_Chelmsford','','david_kerr_chelmsford@peugeotmail.co.uk','01245 494114','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01245 262162',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1038,1,'Ms','Davidhayton','','davidhayton@peugoetmail.co.uk','01768 890950','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01768 890870 ',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1039,1,'Ms','Davidhaytonkendal','','davidhaytonkendal@peugoetmail.co.uk','01539 737444','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01539 737333',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1040,1,'Ms','Davidhaytonlancaster','','davidhaytonlancaster@peugoetmail.co.uk','01524 36163','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01524 62939',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1041,1,'Ms','Davids-Of-Harrogate','','davids-of-harrogate@[eugoetmail.co.uk','01423 818901','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01423 818900',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1042,1,'Ms','Dixgrimsby','','dixgrimsby@peugeotmail.co.uk','01472 240425','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01472 246247',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1043,1,'Ms','Dixon_Of_Doncaster','','dixon_of_doncaster@peugeotmail.co.uk','01302 303701','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01302 303700',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL);
INSERT INTO "customers" ("id","user_id","title","first_name","last_name","email","contact_details","created_on","created_by","modified_on","modified_by","is_active","mobile","landPhone","subscription_status_id","email_status_id","requested_date","requested_ip","confirmed_date","confirmed_ip","group_id","country_code","city_code") VALUES 
 (1044,1,'Ms','Dixon_Of_Mansfield','','dixon_of_mansfield@peugoetmail.co.uk','01623 662545','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01623 422244',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1045,1,'Ms','Donnelly_Tggert','','donnelly_tggert@peugeotmail.co.uk','028 7181 3001','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'028 7181 3636',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1046,1,'Ms','Donnellybros.Enniskillen','','donnellybros.enniskillen@peugeotmail.co.uk','028 6634 4358','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'028 6632 4411',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1047,1,'Ms','Dunstonian','','dunstonian@peugoetmail.co.uk','01689 878258','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01689 832545',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1048,1,'Ms','Duttonforshaw','','duttonforshaw@peugeotmail.co.uk','029 2023 9749','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'029 2039 4213',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1049,1,'Ms','Duttonforshawcolchave_Cardiff','','duttonforshawcolchave_cardiff@peugeotmail.co.uk','029 2043 3888','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'029 2043 3800',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1050,1,'Ms','Duttonforshawnewport','','duttonforshawnewport@peugoetmail.co.uk','01633 294450','2010-01-14 15:24:09',1,'2010-01-14 15:24:09',1,1,NULL,'01633 280111',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1051,1,'Mr','Gowrisankar','Narayan','gowri@softwaresystemseurope.com','TEST','2010-01-15 14:53:13',1,'2010-01-15 14:53:13',1,1,'07850151413','234252',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1052,1,'Mr','Gowri','Narayana','gowrisankar.narayan@gmail.com','TEST','2010-01-19 11:40:15',1,'2010-01-19 11:40:15',1,1,'07850151413','234252',800,900,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1077,8,'Miss','A','Vetterleine','amanda.vetterlein@adidas_grab.com','3 Blackbrook Glade, Buxton Road, Chapel-En-Le-Frith, High Peak, SK17 6RD','2010-02-17 13:04:37',3,'2010-05-21 16:07:36',8,1,'0161 4192708','07807464278',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1078,8,'Miss','Annaleis','Phillips','annaleis.phillips@derbyshire.gov.uk','3 Hall Bank, BUXTON, Derbyshire, SK17 6EW','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298212461','07807060238',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1079,8,'Mr','Arthur','Mellor','ArthurMellor@aol.com','74 Buxton Road, Dove Holes, BUXTON, High Peak, SK17 8DW','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 77345','07733 211226',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1080,8,'Mr','Martin','Brown','brownleygate@googlemail.com','4 Leygate View, New Mills, High Peak, SK22 3EF','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'07796401049','07796401049',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1081,8,'Ms','Calida','Hartley','calida-h@yahoo.co.uk','11 Meadow Lane, Dove Holes, Buxton, Derbyshire, SK17 8DG','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'','07709418684',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1082,8,'Mrs','Catherine','Storer','cath.storer@hotmail.co.uk','53 Horsefair Ave, Chapel-en-le-Frith, High Peak, SK23 9SQ','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 813190','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1083,8,'Mr','Chris','Clarke','chris.clarke2@virgin.net','3 Stockton Drive, Chinley, High Peak, Derbyshire, SK23 6DG','2010-02-17 13:04:37',3,'2010-05-23 16:05:40',8,1,'01663750464','016148718515',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1084,8,'Mr','Chris','Lapthorne','chris.lapthorne@luxaflex.co.uk','14 Sheraton Way, Buxton, Derbyshire, SK17 6FA','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'','07879481529',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1085,8,'Mrs','Christine','Goodfellow','christinegoodfellow@hotmail.com','4 Burnside Ave, Chapel-en-le-Frith, High Peak, SK23 0BA','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 816630','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1086,8,'Mr','David','Gordon','d.t.gordon@ntlworld.com','4A Park Road, Romiley, STOCKPORT Cheshire, SK6 4PG','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 22074','07810 123131',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1087,8,'Mrs','Carole','Turner','dolly2teddy@yahoo.com','2 Grange Park Road, Chapel-en-le-Frith, High Peak, SK23 0LJ','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 812190','07788 994288',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1088,8,'Mrs','Elaine','Needham','elaine_needham@hotmail.com','10 New Road, Buxworth, High Peak, SK23 7NH','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01663 732569','07989986195',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1089,8,'Mrs','Suzanne','Gillott','gillottfamily@btinternet.com','3 Main Road, Bamford, Hope Valley, S33 0AY','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01433 651462','07910733086',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1091,8,'Mr','Michael','Hammond','hammondhillside@onetel.com','Hillside, Terrace Road, Tideswell, BUXTON, Derbyshire, SK17 8NA','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 871747','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1092,8,'Mr','Ian Paul','Atkin','ianohd@yahoo.co.uk','115 Dale Road, Buxton, Derbyshire, SK17 6PD','2010-02-17 13:04:37',3,'2010-04-20 10:48:42',8,1,'01298-24946','2345',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1093,8,'Mr','Jonathan','Drayton','info@draytonandellis.co.uk','11 Lea Road, Heald Green, SK8 3RD','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'07973134815','07973134815',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1094,8,'Mrs','Judy','Cooke','judy-cooke@btopenworld.com','Hillside House, Church Lane, Tideswell, Buxton, Derbyshire, SK17','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298872408','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1095,8,'Mrs','Patricia','Dawson','patricia28.dawson@mypostoffice.co.uk','16 Longmeade Drive, Chapel-en-le-Frith, High Peak, SK23 0XP','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'01298 812828','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1096,8,'Mr','Phillip','Berry','phil.berry@federalmogul.com','12 The Crescent, Chapel-en-le-frith, High Peak, Derbyshire, SK23 0JL','2010-02-17 13:04:37',3,'2010-04-20 09:26:07',8,1,'01298 812293','12345',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1097,8,'Mr','Ray','Slack','ray.slack1@virgin.net','2 The Croft, Main Street, Taddington, Buxton, SK17 9TY','2010-02-17 13:04:37',3,'2010-02-17 13:04:37',3,1,'0129885603','',800,900,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1100,16,'Mr','default','contact1','defa@gm.com',NULL,'2010-03-16 13:43:26',16,'2010-03-16 13:43:26',16,1,'99898','98989',9,11,NULL,NULL,NULL,NULL,9,'INDIA',NULL),
 (1101,15,'Mr','Lynne','Holloway','lynneholloway1006@hotmail.co.uk','8 Ainsworth Road  Wolverhampton  West MidlandsWV10 8TA','2010-03-16 13:51:17',15,'2010-03-16 13:51:17',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1102,15,'Mr','Margaret','Boulderstone','m.boulderstone@hotmail.co.uk','54 Wood Street  Glossop  Derbyshire  SK13 8NL','2010-03-16 13:51:17',15,'2010-03-16 13:51:17',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1103,15,'Mr','Debbie','Thompson','mail@tomsonbuxton.co.uk','5-6 Staden Lane  Buxton  Derbyshire  SK17B 9RZ','2010-03-16 13:51:17',15,'2010-03-16 13:51:17',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1104,15,'Mr','Mark','Atkins','mark@mrsatkins.orangehome.co.uk','Brook Bank  Bullock Lane  Sutton  MacclesfieldSK11 0HE','2010-03-16 13:51:17',15,'2010-03-16 13:51:17',15,1,'7768078373','7768078373',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1105,15,'Mr','Margaret','Bristow','mcbristow19@aol.com','19 Brooklands Road  Chapel-en-le-Frith  High Peak  SK23 0PW','2010-03-16 13:51:17',15,'2010-03-16 13:51:17',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1106,15,'Mr','Adam','Connell','connell.s@tiscali.co.uk','4 The Rise  Taxal  Whaley Bridge  High Peak  SK23 7EG','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'7981 994879','07980 994879',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1107,15,'Mr','Anne','Sumner','sumner961@btinternet.com','5 Parkhill Close  New Mills  High Peak  SK22 4EU','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1108,15,'Mr','Brian','James','peakvideo@btinternet.com','1 Mount Villa  Chinley  High Peak  SK23 6DZ','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'7747 769103','07746 769103',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1109,15,'Mr','David','Goodall','david.goodall@peugeotmail.com','93 Mellor Road  New Mills  High Peak  Derbyshire  SK22 4DX','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'7767 650296','07766 650296',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1110,15,'Mr','David','Lawton','david.a.lawton@btinternet.com','42 Fairy Bank Crescent  Hayfield  HIGH PEAK  Derbyshire  SK22 2HR','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'7919 025168','07918 025168',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1111,15,'Mr','Debbie','Green','greenfmark69@yahoo.co.uk','Flat 10 New Park Court  New Mills  High Peak  SK22 4NB','2010-03-16 13:51:18',15,'2010-03-16 13:51:18',15,1,'7901 546867','07900 546867',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1112,15,'Mr','Deborah','Ibbotson','d.j.ibbotson@btinternet.com','Gautrieside Cottage  Sparrow Pit  Buxton  Derbyshire  SK17 8ES','2010-03-16 13:51:19',15,'2010-03-16 13:51:19',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1113,15,'Mr','Douglas','Smith','douglas@douglassmith2.wanadoo.co.uk','7 Hawthorn Close  Chinley  High Peak  SK23 6DD','2010-03-16 13:51:19',15,'2010-03-16 13:51:19',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1114,15,'Mr','Eileen','Rees','eileen.rees@nwt.org.uk','Holywell House  Crossings Road  Chapel-en-le-Frith  High Peak  SK23 9RX','2010-03-16 13:51:19',15,'2010-03-16 13:51:19',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1115,15,'Mr','Geoffery','Hulley','h19nnc5@aol.com','Netherlea  5 Meadow Lane  Dove Holes  Buxton  Derbyshire  SK17 8DG','2010-03-16 13:51:19',15,'2010-03-16 13:51:19',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1116,15,'Mr','George','Edwards','george.edwards@lifetile.co.uk','Unit 17  Molyneaux Business Park  Darley Dale  Matlock  DE4 2HJ','2010-03-16 13:51:19',15,'2010-03-16 13:51:19',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1117,15,'Mr','Heath','Burgin','ljburgin@btinternet.com','52 Manchester Road  Chapel-en-le-Frith  HIGH PEAK  SK23 9TH','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1118,15,'Mr','Helen','Griffith','griffithcelf@btinternet.com','42 Spencer Road  Chapel-en-le-Frith  High Peak  Derbyshire  SK23 9SB','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1119,15,'Mr','Hilary','Holland','hilary.holland1@btinternet.com','43 Hillside View  New Mills  High Peak  SK22 3DF','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1120,15,'Mr','Ian','Laing','ian@lowcross.eclipse.co.uk','Low Cross  Combs  High Peak  SK23 9UX','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1121,15,'Mr','JA','Pope','pope23@talktalk.net','4 Mood Garderns  Hayfield  High Peak  SK22 2HQ','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1122,15,'Mr','Jenna','Mellor','otpalmer@googlemail.com','16 Dakin Avenue  Buxton  Derbyshire  SK17 7EE','2010-03-16 13:51:20',15,'2010-03-16 13:51:20',15,1,'07729612929','07729612929',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1123,15,'Mrs','Jennifer','Maddick','jpmaddick@hotmail.com','16 Rowton Grange Road  Chapel En Le Frith  High Peak  SK23 0LD','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'7971 930401','07970 930401',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1124,15,'Mrs','K','Evison','kevin@medialogic.net','68 Cardoness Road  SHEFFIELD  S10 5RU','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1125,15,'Mrs','Keith','Buttrill','keith@buttrill.freeserve.co.uk','51 Rowton Grange Road  Chapel-en-le-frith  High Peak  Derbyshire  SK23 0LD','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1126,15,'Mrs','Ken & Leanne','Hammond','kenandleanne@aol.com','4 Oak Close  Chapel-en-le-Frith  High Peak  SK23 0NF','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'07832130161','07832130161',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1127,15,'Mrs','L','Grundy','mathew@docsaway.co.uk','','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1128,15,'Mrs','Leslie Stephen','Mills','stevemills39@hotmail.com','29 Parkland Avenue  New Mills  Derbyshire  SK22 4DT','2010-03-16 13:51:21',15,'2010-03-16 13:51:21',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1129,15,'Mrs','Lloyd','Davis','d_shirl@yahoo.co.uk','26 Rowton Grange Road  Chapel-en-le-Frith  High Peak  SK23 0LD','2010-03-16 13:51:22',15,'2010-03-16 13:51:22',15,1,'07742731330 mrs davi','07742731330 mrs davi',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1130,15,'Mrs','Mark','Chuwen','mark@labelsplus.co.uk','Unit 22  Botany Business Park  Macclesfield Road  Whaley Bridge  High Peak  SK23 7DQ','2010-03-16 13:51:22',15,'2010-03-16 13:51:22',15,1,'07979527331','07979527331',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1131,15,'Mrs','Mark','Whelan','mawhelan@tiscali.co.uk','11 Shallcross Mill Road  Whaley Bridge  High Peak  SK23 7JQ','2010-03-16 13:51:22',15,'2010-03-16 13:51:22',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1132,15,'Mrs','Mike','Cousins','mick@cousins2487.freeserve.co.uk','17 Reservoir Road  Whaley Bridge  High Peak  SK23 7BL','2010-03-16 13:51:22',15,'2010-03-16 13:51:22',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1133,15,'Mrs','Nancy','Jones','nancyjj@btinternet.com','9a Smalldale  BUXTON  Derbyshire  SK17 8EA','2010-03-16 13:51:22',15,'2010-03-16 13:51:22',15,1,'07963807952','07963807952',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1134,15,'Mrs','Naomi','Chambers','naomi.chambers@mbs.ac.uk','Stanshope Hall  Stanshope  Ashbourne  Derbyshire  DE6 2AD','2010-03-16 13:51:23',15,'2010-03-16 13:51:23',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1135,15,'Mrs','Nicholas Robert','Bostin','nicjnbos@yahoo.co.uk','5 Cherry Tree Court  Chapel-en-le-Frith  High Peak  SK23 9HF','2010-03-16 13:51:23',15,'2010-03-16 13:51:23',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1136,15,'Mrs','Nigel','Betts','nigel@chegwin.org','97 Lightwood Road  Buxton  Derbyshire  SK17 7AN','2010-03-16 13:51:23',15,'2010-03-16 13:51:23',15,1,'7981 349009','07980 349009',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1137,15,'Mrs','Paul','May','paulningridmay@gmail.com','14 Thornbrook Road  Chapel-en-le-Frith  High Peak  SK23 0LX','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1138,15,'Mrs','Peter','Taylor','peterjohntaylor@hotmail.com','Hillside  Coppice Lane  Disley  Stockport  SK12 2LT','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1139,15,'Mrs','Philip','Mellor','sharon.mellor@intraining.co.uk','37 Weaver Close  Crich  MATLOCK  Derbyshire  DE4 5ET','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'07837383194 (sharon)','07837383194 (sharon)',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1140,15,'Mrs','Rene','Ladiges','rene@user-friendly.org.uk','13 Arundel Street  Glossop  SK13 7AB','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1141,15,'Mrs','Sharon','Kitson','sharon.kitson@peugeotmail.co.uk','4 Gregory Row  Chapel Milton  High Peak  Derbyshire  SK23 0QQ','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'7776 666561','07775 666561',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1142,15,'Mrs','Shelley','Phillips','baby-bear-bb@hotmail.co.uk','37 Manchester RD  Tintwistle  Glossop  SK13 1NF','2010-03-16 13:51:24',15,'2010-03-16 13:51:24',15,1,'07810001809','07810001809',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1143,15,'Mrs','Stephanie','Finlay','steph2finlay@aol.com','8 Vicarage Lane  Hayfield  High Peak  SK22 2HT','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1144,15,'Mrs','Steve','Cocksey','steve@jackoldhamtextile.co.uk','Station Approach  Whaley Bridge  High Peak  SK23 7AF','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1145,15,'Mrs','Steve','Lomas','sjlomas@tiscali.co.uk','19 Crossings Avenue  Chapel-en-le-Frith  High Peak  SK23 9TE','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1146,15,'Miss','Stuart','James','stuart.james@dailystar.co.uk','13 Newby Street  London  SW8 3BQ','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1147,15,'Miss','Terence','Williamson','terancewilliamson@hotmail.com','28B Bowden Lane  Chapel-en-le-Frith  High Peak  SK23 0JQ','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1148,15,'Miss','Trevor','Horrocks','trevor.horrocks@derbyshirecountypct.nhs.uk','PO BOX 1323  SLOUGH PDO  SL1 4YL','2010-03-16 13:51:25',15,'2010-03-16 13:51:25',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1149,15,'Miss','Trevor','Willis','trevor.willis@vwclub.net','Riyadh  Summer Cross  Tideswell  Buxton  Derbyshire  SK17 8HU','2010-03-16 13:51:26',15,'2010-03-16 13:51:26',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1150,15,'Miss','Simon','Coley','ceasark@aol.com','','2010-03-16 13:51:26',15,'2010-03-16 13:51:26',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1151,15,'Miss','A','Vetterlein','amanda.vetterlein@adidas_grab.com','3 Blackbrook Glade, Buxton Road, Chapel-En-Le-Frith, High Peak, SK17 6RD','2010-03-16 13:51:26',15,'2010-03-16 13:51:26',15,1,'162 4192708','0161 4192708',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1152,15,'Miss','Annaleis','Phillips','annaleis.phillips@derbyshire.gov.uk','3 Hall Bank, BUXTON, Derbyshire, SK17 6EW','2010-03-16 13:51:26',15,'2010-03-16 13:51:26',15,1,'01298212462','01298212461',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1153,15,'Miss','Arthur','Mellor','ArthurMellor@aol.com','74 Buxton Road, Dove Holes, BUXTON, High Peak, SK17 8DW','2010-03-16 13:51:26',15,'2010-03-16 13:51:26',15,1,'1299 77345','01298 77345',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1154,15,'Miss','Martin','Brown','brownleygate@googlemail.com','4 Leygate View, New Mills, High Peak, SK22 3EF','2010-03-16 13:51:27',15,'2010-03-16 13:51:27',15,1,'07796401049','07796401049',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1155,15,'Miss','Calida','Hartley','calida-h@yahoo.co.uk','11 Meadow Lane, Dove Holes, Buxton, Derbyshire, SK17 8DG','2010-03-16 13:51:27',15,'2010-03-16 13:51:27',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1156,15,'Mr','Catherine','Storer','cath.storer@hotmail.co.uk','53 Horsefair Ave, Chapel-en-le-Frith, High Peak, SK23 9SQ','2010-03-16 13:51:27',15,'2010-03-16 13:51:27',15,1,'1299 813190','01298 813190',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1157,15,'Mr','Chris','Clarke','chris.clarke2@virgin.net','3 Stockton Drive, Chinley, High Peak, Derbyshire, SK23 6DG','2010-03-16 13:51:27',15,'2010-03-16 13:51:27',15,1,'01663750465','01663750464',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1158,15,'Mr','Chris','Lapthorne','chris.lapthorne@luxaflex.co.uk','14 Sheraton Way, Buxton, Derbyshire, SK17 6FA','2010-03-16 13:51:27',15,'2010-03-16 13:51:27',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1159,15,'Mr','Christine','Goodfellow','christinegoodfellow@hotmail.com','4 Burnside Ave, Chapel-en-le-Frith, High Peak, SK23 0BA','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'1299 816630','01298 816630',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1160,15,'Mr','David','Gordon','d.t.gordon@ntlworld.com','4A Park Road, Romiley, STOCKPORT Cheshire, SK6 4PG','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'1299 22074','01298 22074',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1161,15,'Mr','Carole','Turner','dolly2teddy@yahoo.com','2 Grange Park Road, Chapel-en-le-Frith, High Peak, SK23 0LJ','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'1299 812190','01298 812190',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1162,15,'Mr','Elaine','Needham','elaine_needham@hotmail.com','10 New Road, Buxworth, High Peak, SK23 7NH','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'1664 732569','01663 732569',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1163,15,'Mr','Suzanne','Gillott','gillottfamily@btinternet.com','3 Main Road, Bamford, Hope Valley, S33 0AY','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'1434 651462','01433 651462',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1164,15,'Mr','Helen','Wild','h7hwx@gmail.com','3 Lyme View, Glossop Road, Little Hayfield, HIGH PEAK, SK22 2AT','2010-03-16 13:51:28',15,'2010-03-16 13:51:28',15,1,'','',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1165,15,'Mr','Michael','Hammond','hammondhillside@onetel.com','Hillside, Terrace Road, Tideswell, BUXTON, Derbyshire, SK17 8NA','2010-03-16 13:51:29',15,'2010-03-16 13:51:29',15,1,'1299 871747','01298 871747',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1166,15,'Mr','Ian Paul','Atkin','ianohd@yahoo.co.uk','115 Dale Road, Buxton, Derbyshire, SK17 6PD','2010-03-16 13:51:29',15,'2010-03-16 13:51:29',15,1,'01298-24947','01298-24946',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1167,15,'Mr','Jonathan','Drayton','info@draytonandellis.co.uk','11 Lea Road, Heald Green, SK8 3RD','2010-03-16 13:51:29',15,'2010-03-16 13:51:29',15,1,'07973134815','07973134815',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1168,15,'Mr','Judy','Cooke','judy-cooke@btopenworld.com','Hillside House, Church Lane, Tideswell, Buxton, Derbyshire, SK17','2010-03-16 13:51:29',15,'2010-03-16 13:51:29',15,1,'01298872409','01298872408',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1169,15,'Mr','Patricia','Dawson','patricia28.dawson@mypostoffice.co.uk','16 Longmeade Drive, Chapel-en-le-Frith, High Peak, SK23 0XP','2010-03-16 13:51:29',15,'2010-03-16 13:51:29',15,1,'1299 812828','01298 812828',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1170,15,'Mr','Phillip','Berry','phil.berry@federalmogul.com','12 The Crescent, Chapel-en-le-frith, High Peak, Derbyshire, SK23 0JL','2010-03-16 13:51:30',15,'2010-03-16 13:51:30',15,1,'1299 812293','01298 812293',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1171,15,'Mr','Ray','Slack','ray.slack1@virgin.net','2 The Croft, Main Street, Taddington, Buxton, SK17 9TY','2010-03-16 13:51:30',15,'2010-03-16 13:51:30',15,1,'0129885604','0129885603',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1172,15,'Mr','Roger','Marsden','roger@medialogic.net','68 Cardoness Road, Sheffield, S10 5RU','2010-03-16 13:51:30',15,'2010-03-16 13:51:30',15,1,'115 266 2222','0114 266 2222',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1173,15,'Mr','Widdy','Walker','widdywalker@aol.com','142 Manchester Road, Chapel-en-le-Frith, High Peak, SK23  9TP','2010-03-16 13:51:30',15,'2010-03-16 13:51:30',15,1,'1299 812384','01298 812384',9,11,NULL,NULL,NULL,NULL,NULL,'INDIA',NULL),
 (1174,9,'Mrs','Sai','Baabi','sai.baabi112@gmail.com',NULL,'2010-03-17 20:11:34',9,'2010-03-17 20:11:34',9,1,'01234014','99898989',9,11,NULL,NULL,NULL,NULL,6,'INDIA',NULL),
 (1175,8,'Mrs','Sai','Baabi','sai.baabi@gmail.com','2 Thorpe Hall Grove\nHyde\nCheshire\nSK144JP','2010-04-13 20:34:14',8,'2010-05-14 18:53:14',8,1,'07926256001','998989892',9,11,NULL,NULL,NULL,NULL,18,'INDIA',NULL),
 (1176,8,'Mr','Gowrisankar','Narayan','gowrisankar.narayan@gmail.com','2 Thorpe','2010-04-13 20:35:59',8,'2010-04-22 17:03:09',8,1,'07926256001','99898989',9,11,NULL,NULL,NULL,NULL,19,'INDIA',NULL),
 (1178,23,'Mr','Gowrisankar','narayan','gowrisankar.narayan@gmail.com',NULL,'2010-04-16 15:56:22',23,'2010-04-16 15:56:22',23,1,'07850151413','98989',9,11,NULL,NULL,NULL,NULL,20,'INDIA',NULL),
 (1179,24,'Mr','Gowrisankar','Narayan','gowrisankar.narayan@gmail.com','SM&MS Limited\r\nHuddersfield\r\nHD21GN','2010-04-16 16:02:15',24,'2010-04-17 13:35:42',0,1,'07850151413','98989343434',9,11,NULL,NULL,NULL,NULL,21,'INDIA',NULL),
 (1180,24,'Mrs','Gowri','Narayan','gowrisankar.narayana@sm-ms.biz','SM&MS Limited\nHuddersfield\nHD21GN UK','2010-04-16 16:19:19',24,'2010-04-17 12:50:54',0,1,'07850151413','98989',9,11,NULL,NULL,NULL,NULL,21,'INDIA',NULL),
 (1181,28,'Mrs','Sai','Baabi','narayana.gowrisankar@gmail.com','SK144JP','2010-04-17 21:48:10',28,'2010-05-22 13:07:32',28,1,'07926256001','99898989',9,11,NULL,NULL,NULL,NULL,22,'INDIA',NULL),
 (1182,8,'Mr','Test','Test','testemail@yahoo.com','2 Thorpe Hall Grove\nHyde\nCheshire','2010-04-19 16:46:56',8,'2010-05-14 18:48:23',8,1,'908098089','0980804356',9,11,NULL,NULL,NULL,NULL,1,'INDIA',NULL),
 (1183,8,'Mr','Gary','NG','ggary@joompal.com','2 thorpe hall grove','2010-04-19 16:56:47',8,'2010-05-14 18:48:33',8,1,'07850151413','98989',9,11,NULL,NULL,NULL,NULL,1,'INDIA',NULL),
 (1184,15,'Mrs','Sai','Baabi','sai.baabi@gmail.com','','2010-04-26 07:39:47',15,'2010-04-26 07:39:47',15,1,'07926256001','99898989',9,11,NULL,NULL,NULL,NULL,7,'INDIA',NULL),
 (1185,8,'Mr','abhineshm','','abhineshm@gmail.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1186,8,'Mr','achudada','','achudada@gmail.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1187,8,'Mr','adam.dulmeer','','adam.dulmeer@gmail.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1188,8,'Mr','admin','','admin@joompal.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1189,8,'Mr','aksagar2007','','aksagar2007@gmail.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1190,8,'Mr','alex','','alex@softwaresystemseurope.com','','2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1191,8,'Mr','aman','','aman@southalltravel.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1192,8,'Mr','andarudongaley','','andarudongaley@googlemail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1193,8,'Mr','ankur.16','','ankur.16@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1194,8,'Mr','lebaka.anusha','','lebaka.anusha@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1195,8,'Mr','anu.12590','','anu.12590@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1196,8,'Mr','anu.ammulureddy','','anu.ammulureddy@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1197,8,'Mr','anusha.12590','','anusha.12590@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1198,8,'Mr','artz.ahuja','','artz.ahuja@googlemail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1199,8,'Mr','arulmca.nitt','','arulmca.nitt@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1200,8,'Mr','ashok.mca4u','','ashok.mca4u@gmail.com','','2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1201,8,'Mr','aswanikoduru','','aswanikoduru@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1202,8,'Mr','passion_loki','','passion_loki@yahoo.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1203,8,'Mr','atthilokesh','','atthilokesh@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1204,8,'Mr','b.jyothsna','','b.jyothsna@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1205,8,'Mr','b.thanush','','b.thanush@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1206,8,'Mr','babitha.jayaram','','babitha.jayaram@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1207,8,'Mr','balaprasadmca','','balaprasadmca@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1208,8,'Mr','bandaaru.venu','','bandaaru.venu@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1209,8,'Mr','bca.hemanth','','bca.hemanth@googlemail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1210,8,'Mr','beena.vani','','beena.vani@gmail.com','','2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1211,8,'Mr','beginyourday','','beginyourday@googlemail.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1212,8,'Mr','bestvijay','','bestvijay@gmail.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1213,8,'Mr','bhanuprakash_k','','bhanuprakash_k@spanservices.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1214,8,'Mr','bhanuprakash83','','bhanuprakash83@gmail.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1215,8,'Mr','bharathgbr','','bharathgbr@gmail.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1216,8,'Mr','br_kishore','','br_kishore@yahoo.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1217,8,'Mr','bvenu','','bvenu@saksoft.co.in','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1218,8,'Mr','bvidinli','','bvidinli@gmail.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1219,8,'Mr','cardcare','','cardcare@citi.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1220,8,'Mr','care','','care@whizlabs.com','','2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1221,8,'Mr','kalyan825','','kalyan825@gmail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1222,8,'Mr','chanduinmail','','chanduinmail@gmail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1223,8,'Mr','chidambarasamy','','chidambarasamy@gmail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1224,8,'Mr','citi.care','','citi.care@citi.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1225,8,'Mr','citi.care','','citi.care@citicorp.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1226,8,'Mr','confuse.siva','','confuse.siva@googlemail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1227,8,'Mr','CustomerService','','CustomerService@creditexpert.co.uk','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1228,8,'Mr','cutesaritha','','cutesaritha@gmail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1229,8,'Mr','dannydaman9','','dannydaman9@googlemail.com','','2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1230,8,'Mr','desiresiva','','desiresiva@gmail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1231,8,'Mr','dillimails','','dillimails@gmail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1232,8,'Mr','dilli.babu','','dilli.babu@tcs.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1233,8,'Mr','dinakar.ganesh','','dinakar.ganesh@gmail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1234,8,'Mr','dongalakudonga','','dongalakudonga@googlemail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1235,8,'Mr','dorababu.g','','dorababu.g@mphasis.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1236,8,'Mr','support.response','','support.response@gumtree.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1237,8,'Mr','e.keerthi','','e.keerthi@gmail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1238,8,'Mr','elgoog.revol','','elgoog.revol@googlemail.com','','2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1239,8,'Mr','fahimeul','','fahimeul@gmail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1240,8,'Mr','fahimuel','','fahimuel@googlemail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1241,8,'Mr','ajewole09','','ajewole09@gmail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1242,8,'Mr','flaviacowell','','flaviacowell@hotmail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1243,8,'Mr','info','','info@future-move.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1244,8,'Mr','gary','','gary@crimsongarnet.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1245,8,'Mr','geethashree.puli','','geethashree.puli@googlemail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1246,8,'Mr','gethasree','','gethasree@googlemail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1247,8,'Mr','giridasmart1','','giridasmart1@gmail.com','','2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1248,8,'Mr','girishhere','','girishhere@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1249,8,'Mr','gk.iflex','','gk.iflex@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1250,8,'Mr','gouthamreddy.vanga','','gouthamreddy.vanga@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1251,8,'Mr','gowrishankar.reddy','','gowrishankar.reddy@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1252,8,'Mr','gowri.sankar','','gowri.sankar@barclays.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1253,8,'Mr','gowri','','gowri@softwaresystemseurope.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1254,8,'Mr','gowrisankar.narayan','','gowrisankar.narayan@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1255,8,'Mr','gowrisankar.narayana','','gowrisankar.narayana@sm-ms.biz','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1256,8,'Mr','gowrisankar.narayanan','','gowrisankar.narayanan@gmail.com','','2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1257,8,'Mr','gowrisankar.narayanan','','gowrisankar.narayanan@crimsongarnet.co.uk','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1258,8,'Mr','gowrisankar.narayanan','','gowrisankar.narayanan@iflexsolutions.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1259,8,'Mr','gowthamreddy.vanga','','gowthamreddy.vanga@gmail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1260,8,'Mr','gowthamreddy.vanga','','gowthamreddy.vanga@googlemail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1261,8,'Mr','gpraveenonline','','gpraveenonline@gmail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1262,8,'Mr','greatdesigners','','greatdesigners@googlemail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1263,8,'Mr','greatestdesigns','','greatestdesigns@googlemail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1264,8,'Mr','gskgupta','','gskgupta@gmail.com','','2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1265,8,'Mr','h.s.sareen','','h.s.sareen@hotmail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1266,8,'Mr','harikareddy537','','harikareddy537@gmail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1267,8,'Mr','harinath.reddy09','','harinath.reddy09@googlemail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1268,8,'Mr','harinath.reddy09','','harinath.reddy09@yahoo.co.in','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1269,8,'Mr','harinath.reddy1209','','harinath.reddy1209@googlemail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1270,8,'Mr','harishp81','','harishp81@gmail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1271,8,'Mr','legal.icici','','legal.icici@yahoo.co.in','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1272,8,'Mr','ilovegwt','','ilovegwt@googlemail.com','','2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1273,8,'Mr','Indiacollservice','','Indiacollservice@citi.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1274,8,'Mr','info','','info@maxwellhealthcare.co.uk','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1275,8,'Mr','jawaharlaal.nehru','','jawaharlaal.nehru@googlemail.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1276,8,'Mr','joshnareddy618','','joshnareddy618@gmail.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1277,8,'Mr','kamalesh.mca','','kamalesh.mca@gmail.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1278,8,'Mr','kamalesh.p','','kamalesh.p@tcs.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1279,8,'Mr','kamaleshid4u','','kamaleshid4u@gmail.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1280,8,'Mr','kavita.rajesh','','kavita.rajesh@iflexsolutions.com','','2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1281,8,'Mr','kavita.rajesh','','kavita.rajesh@oracle.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1282,8,'Mr','brkishore0','','brkishore0@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1283,8,'Mr','kkmukesh','','kkmukesh@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1284,8,'Mr','kokila.mg','','kokila.mg@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1285,8,'Mr','konakalarao','','konakalarao@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1286,8,'Mr','koti.reddy2k9','','koti.reddy2k9@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1287,8,'Mr','kotireddy','','kotireddy@thelondonstudents.co.uk','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1288,8,'Mr','kpkurre','','kpkurre@gmail.com','','2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1289,8,'Mr','kris_chillin_4eva','','kris_chillin_4eva@yahoo.co.uk','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1290,8,'Mr','kris_chillin_4eva','','kris_chillin_4eva@yahoo.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1291,8,'Mr','kris.lomas','','kris.lomas@live.co.uk','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1292,8,'Mr','krishna.erigela','','krishna.erigela@gmail.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1293,8,'Mr','ktk.thamarai','','ktk.thamarai@gmail.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1294,8,'Mr','Kumar_Kishore','','Kumar_Kishore@hht.satyam.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1295,8,'Mr','kumar_kishore','','kumar_kishore@satyam.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1296,8,'Mr','lakshminarayana_v','','lakshminarayana_v@spanservices.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1297,8,'Mr','lakshmi.id4u','','lakshmi.id4u@gmail.com','','2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1298,8,'Mr','lakshmi.mre','','lakshmi.mre@gmail.com','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1299,8,'Mr','lysha','','lysha@quirecruitment.co.uk','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1300,8,'Mr','magesh.digavapalli','','magesh.digavapalli@gmail.com','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1301,8,'Mr','matt.holmes','','matt.holmes@redroofestates.co.uk','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1302,8,'Mr','miclauri2000','','miclauri2000@gmail.com','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1303,8,'Mr','mk.kishore3','','mk.kishore3@gmail.com','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1304,8,'Mr','mohandhas.gandhi','','mohandhas.gandhi@googlemail.com','','2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1305,8,'Mr','muralidhar.g.venkat','','muralidhar.g.venkat@ba.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1306,8,'Mr','soft.muruga','','soft.muruga@gmail.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1307,8,'Mr','mzaikin','','mzaikin@gmail.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1308,8,'Mr','nagaa','','nagaa@infics.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1309,8,'Mr','nagasaritha2002','','nagasaritha2002@yahoo.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1310,8,'Mr','nkreddy1983','','nkreddy1983@gmail.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1311,8,'Mr','narayana.gowrisankar','','narayana.gowrisankar@gmail.com','','2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1312,8,'Mr','narsimareddy','','narsimareddy@gmail.com','','2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1313,8,'Mr','neelima.h','','neelima.h@gmail.com','','2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1314,8,'Mr','neha.gandhi','','neha.gandhi@citi.com','','2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1315,8,'Mr','nirmalkumarreddy','','nirmalkumarreddy@gmail.com','','2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1316,8,'Mr','nirmalkumarreddy','','nirmalkumarreddy@hotmail.com','','2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1317,8,'Mr','nirmala.c.k','','nirmala.c.k@gmail.com','','2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1318,8,'Mr','nirmalkumar.bca','','nirmalkumar.bca@gmail.com','','2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1319,8,'Mr','nirmalkumar.rajendran','','nirmalkumar.rajendran@in.ibm.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1320,8,'Mr','nkanakar','','nkanakar@in.ibm.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1321,8,'Mr','nsvagovind','','nsvagovind@gmail.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1322,8,'Mr','p.ganesh','','p.ganesh@hotmail.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1323,8,'Mr','pallavi.sikdar','','pallavi.sikdar@gmail.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1324,8,'Mr','pearltime','','pearltime@msn.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1325,8,'Mr','poola_babu','','poola_babu@yahoo.co.in','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1326,8,'Mr','bodduluripoorna','','bodduluripoorna@googlemail.com','','2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1327,8,'Mr','sreeramula.prasad','','sreeramula.prasad@fmr.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1328,8,'Mr','prasad.sreeramula','','prasad.sreeramula@fmr.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1329,8,'Mr','sindagip','','sindagip@hdfcinsurance.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1330,8,'Mr','pratibhass04','','pratibhass04@gmail.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1331,8,'Mr','roger_schofield','','roger_schofield@btinternet.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1332,8,'Mr','radhika','kandasamy','radhika.kandasamy@gmail.com','','2010-05-15 09:02:59',8,'2010-05-21 06:50:54',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1333,8,'Mr','ragunath.vankayala','','ragunath.vankayala@gmail.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1334,8,'Mr','rajeshthalari','','rajeshthalari@gmail.com','','2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1335,8,'Mr','kabali.ramesh','','kabali.ramesh@gmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1336,8,'Mr','ramesh.vj','','ramesh.vj@gmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1337,8,'Mr','ramkumar.bhaskar','','ramkumar.bhaskar@iflexsolutions.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1338,8,'Mr','ramkumar.bhaskar','','ramkumar.bhaskar@oracle.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1339,8,'Mr','royal.ranjith','','royal.ranjith@gmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1340,8,'Mr','soft.rasheed','','soft.rasheed@gmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1341,8,'Mr','rashmi1bhatt','','rashmi1bhatt@gmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1342,8,'Mr','request','','request@freejavahosting.org','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1343,8,'Mr','richard','','richard@onefinishingtouch.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1344,8,'Mr','richardhutton69','','richardhutton69@hotmail.com','','2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1345,8,'Mr','richard.willms202','','richard.willms202@yahoo.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1346,8,'Mr','richard.willmsen199','','richard.willmsen199@gmail.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1347,8,'Mr','ritu.sharma','','ritu.sharma@whizlabs.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1348,8,'Mr','roudy.geethu','','roudy.geethu@googlemail.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1349,8,'Mr','rpo.hyderabad','','rpo.hyderabad@mea.gov.in','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1350,8,'Mr','ryan.moore','','ryan.moore@acuma.co.uk','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1351,8,'Mr','sachin.mudigere','','sachin.mudigere@oracle.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1352,8,'Mr','sachin.mudigere','','sachin.mudigere@gmail.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1353,8,'Mr','sachin.mudigere','','sachin.mudigere@iflexsolutions.com','','2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1354,8,'Mr','sai.baabi','','sai.baabi@googlemail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1355,8,'Mr','saisravya.reddy','','saisravya.reddy@googlemail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1356,8,'Mr','judith.saldanha','','judith.saldanha@citi.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1357,8,'Mr','sallape','','sallape@gmail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1358,8,'Mr','sanjayghosh1972','','sanjayghosh1972@gmail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1359,8,'Mr','sarathchandra.june10','','sarathchandra.june10@gmail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1360,8,'Mr','saravana.babus','','saravana.babus@gmail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1361,8,'Mr','saritha.araviti','','saritha.araviti@gmail.com','','2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1362,8,'Mr','satishkumar.babu','','satishkumar.babu@gmail.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1363,8,'Mr','SEBASTIAN.CHANDRAN','','SEBASTIAN.CHANDRAN@barclays.net.in','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1364,8,'Mr','seershika','','seershika@gmail.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1365,8,'Mr','shabana.azmin','','shabana.azmin@gmail.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1366,8,'Mr','shantha.kumar','','shantha.kumar@icicibank.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1367,8,'Mr','sherylwilliams','','sherylwilliams@yellgroup.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1368,8,'Mr','shyamkumar.madurantakam','','shyamkumar.madurantakam@gmail.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1369,8,'Mr','shyamkumar.maduranthakam','','shyamkumar.maduranthakam@gmail.com','','2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1370,8,'Mr','simon.coley','','simon.coley@peugeotmail.co.uk','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1371,8,'Mr','megharaj','singh','megharaj.singh@ge.com','','2010-05-15 09:03:04',8,'2010-05-21 06:51:18',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1372,8,'Mr','nsivagovind','','nsivagovind@gmail.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1373,8,'Mr','sivakumar_ra','','sivakumar_ra@infosys.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1374,8,'Mr','anandhanoor','','anandhanoor@virtusa.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1375,8,'Mr','Sivakumarreddy.Armreddy','','Sivakumarreddy.Armreddy@lntinfotech.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1376,8,'Mr','sravan.bitla','','sravan.bitla@gmail.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1377,8,'Mr','sreenu.narayanareddy','','sreenu.narayanareddy@gmail.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1378,8,'Mr','srini.rj','','srini.rj@gmail.com','','2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1379,8,'Mr','srinivas.gupta','','srinivas.gupta@barclays.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1380,8,'Mr','a.srinivasulu','','a.srinivasulu@gmail.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1381,8,'Mr','srinivasulu_8888','','srinivasulu_8888@yahoo.co.in','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1382,8,'Mr','srinivasuluar','','srinivasuluar@gmail.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1383,8,'Mr','ssherylwilliams','','ssherylwilliams@yellgroup.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1384,8,'Mr','ssuneelonline','','ssuneelonline@gmail.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1385,8,'Mr','subesh.vasu','','subesh.vasu@gmail.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1386,8,'Mr','subraja04','','subraja04@gmail.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1387,8,'Mr','sudhakar','','sudhakar@andhraproperties.com','','2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1388,8,'Mr','suhail.deshmukh','','suhail.deshmukh@googlemail.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1389,8,'Mr','suhile.deshmuk','','suhile.deshmuk@gmail.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1390,8,'Mr','sukhee','','sukhee@bains.uk.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1391,8,'Mr','sumaonline','','sumaonline@gmail.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1392,8,'Mr','sunilinline','','sunilinline@gmail.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1393,8,'Mr','support','','support@flabell.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1394,8,'Mr','support','','support@support.uk2.net','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1395,8,'Mr','surendrachowdary.e','','surendrachowdary.e@gmail.com','','2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1396,8,'Mr','sureshbabusk','','sureshbabusk@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1397,8,'Mr','swapna_gangavaram','','swapna_gangavaram@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1398,8,'Mr','swapna.gangavaram','','swapna.gangavaram@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1399,8,'Mr','swathibhargavireddy','','swathibhargavireddy@googlemail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1400,8,'Mr','swethanaidu.g','','swethanaidu.g@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1401,8,'Mr','trilok.chandra1','','trilok.chandra1@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1402,8,'Mr','uday.anamaneni','','uday.anamaneni@gmail.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1403,8,'Mr','uday.anamaneni','','uday.anamaneni@in.ibm.com','','2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1404,8,'Mr','uma_pothula','','uma_pothula@yahoo.co.in','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1405,8,'Mr','velusathish','','velusathish@yahoo.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1406,8,'Mr','murali9g','','murali9g@gmail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1407,8,'Mr','hema.venkatesh','','hema.venkatesh@citi.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1408,8,'Mr','venu.bandaru','','venu.bandaru@gmail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1409,8,'Mr','vijay.chaganty','','vijay.chaganty@gmail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1410,8,'Mr','vismitha.c','','vismitha.c@googlemail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1411,8,'Mr','vpg2006','','vpg2006@gmail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1412,8,'Mr','vrkittaiah','','vrkittaiah@gmail.com','','2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1413,8,'Mr','admin','','admin@xp-dev.com','','2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1414,8,'Mr','yours.lakshu','','yours.lakshu@gmail.com','','2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1415,8,'Mr','yuga.a4','','yuga.a4@gmail.com','','2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1416,8,'Mr','yugamca','','yugamca@gmail.com','','2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1417,8,'Mr','swetha0783','','swetha0783@gmail.com','','2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1,'','',7,11,NULL,NULL,NULL,NULL,27,'INDIA',NULL),
 (1418,28,'Mrs','Gowrisankar','Baabi','gowrisankar.narayanan@gmail.com','','2010-05-17 22:41:51',28,'2010-05-17 22:41:51',28,1,'07926256001','99898989',7,11,NULL,NULL,NULL,NULL,22,'INDIA',NULL),
 (1419,8,'Mr','Gowrisankar','','narayanaa.gowrisankar@gmail.com','','2010-05-22 09:04:53',8,'2010-05-22 09:04:53',8,1,'','',8,11,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1420,8,'Mr','Gowrisankar','','sai.gowrisankar@gmail.com','','2010-05-22 09:05:35',8,'2010-05-22 09:05:35',8,1,'','',8,11,NULL,NULL,NULL,NULL,3,'INDIA',NULL),
 (1421,8,'Mrs','GowrisankarB','Baabi','baabi.narayan@gmail.com','','2010-05-23 16:03:54',8,'2010-05-23 16:04:22',8,1,'','',7,11,'2010-05-23 16:03:54',NULL,'2010-05-23 00:00:00',NULL,1,'INDIA',NULL);
/*!40000 ALTER TABLE "customers" ENABLE KEYS */;


--
-- Definition of table "customers_customergroups"
--
CREATE TABLE "customers_customergroups" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "customer_id" int(10) unsigned NOT NULL,
  "group_id" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_customers_customergroups_1" ("customer_id"),
  KEY "FK_customers_customergroups_2" ("group_id"),
  CONSTRAINT "FK_customers_customergroups_1" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id"),
  CONSTRAINT "FK_customers_customergroups_2" FOREIGN KEY ("group_id") REFERENCES "customer_groups" ("id")
) TYPE=InnoDB AUTO_INCREMENT=2217 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "customers_customergroups"
--

/*!40000 ALTER TABLE "customers_customergroups" DISABLE KEYS */;
INSERT INTO "customers_customergroups" ("id","customer_id","group_id","created_on","created_by","modified_on","modified_by","is_active") VALUES 
 (1667,309,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1669,311,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1670,312,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1671,313,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1674,316,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1675,317,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1676,318,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1677,319,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1678,320,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1679,321,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1680,322,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1686,328,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1687,329,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1688,330,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1690,332,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1692,1077,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1693,1078,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1694,1079,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1695,1080,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1696,1081,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1697,1082,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1698,1083,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1699,1084,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1700,1085,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1701,1086,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1702,1087,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1703,1088,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1704,1089,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1706,1091,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1707,1092,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1708,1093,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1709,1094,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1710,1095,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1711,1096,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1712,1097,3,'2010-03-06 15:47:48',2,NULL,NULL,1),
 (1715,1100,9,'2010-03-16 13:43:27',16,'2010-03-16 13:43:27',16,1),
 (1716,1174,6,'2010-03-17 20:11:34',9,'2010-03-17 20:11:34',9,1),
 (1717,1175,18,'2010-04-13 20:34:14',8,'2010-04-13 20:34:14',8,1),
 (1718,1176,18,'2010-04-13 20:35:59',8,'2010-04-13 20:35:59',8,1),
 (1719,1176,19,'2010-04-13 20:35:59',8,'2010-04-13 20:35:59',8,1),
 (1721,1178,20,'2010-04-16 15:56:22',23,'2010-04-16 15:56:22',23,1),
 (1722,1179,21,'2010-04-16 16:02:16',24,'2010-04-16 16:02:16',24,1),
 (1723,1180,21,'2010-04-16 16:19:19',24,'2010-04-16 16:19:19',24,1),
 (1724,1181,22,'2010-04-17 21:48:10',28,'2010-04-17 21:48:10',28,1),
 (1725,1182,1,'2010-04-19 16:46:56',8,'2010-04-19 16:46:56',8,1),
 (1726,1183,1,'2010-04-19 16:56:47',8,'2010-04-19 16:56:47',8,1),
 (1727,798,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1728,573,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1729,574,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1730,575,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1731,576,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1732,577,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1733,578,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1734,579,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1735,580,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1736,581,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1737,582,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1738,583,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1739,584,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1740,585,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1741,586,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1742,587,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1743,588,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1744,589,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1745,590,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1746,591,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1747,592,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1748,593,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1749,594,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1750,595,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1751,596,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1752,597,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1753,598,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1754,599,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1755,600,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1756,601,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1757,602,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1758,603,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1759,604,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1760,605,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1761,606,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1762,607,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1763,608,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1764,609,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1765,610,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1766,611,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1767,612,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1768,613,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1769,614,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1770,615,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1771,617,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1772,618,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1773,619,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1774,616,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1775,620,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1776,621,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1777,622,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1778,623,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1779,624,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1780,625,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1781,626,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1782,627,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1783,628,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1784,631,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1785,629,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1786,630,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1787,632,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1788,633,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1789,634,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1790,636,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1791,635,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1792,637,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1793,639,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1794,640,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1795,641,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1796,642,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1797,638,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1798,643,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1799,644,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1800,645,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1801,647,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1802,646,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1803,648,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1804,649,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1805,650,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1806,651,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1807,652,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1808,653,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1809,654,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1810,655,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1811,656,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1812,657,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1813,658,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1814,659,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1815,660,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1816,661,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1817,662,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1818,663,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1819,664,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1820,665,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1821,666,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1822,667,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1823,668,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1824,669,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1825,670,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1826,812,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1827,671,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1828,672,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1829,673,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1830,674,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1831,676,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1832,675,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1833,677,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1834,678,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1835,679,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1836,680,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1837,681,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1838,682,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1839,683,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1840,684,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1841,685,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1842,686,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1843,687,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1844,688,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1845,689,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1846,690,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1847,691,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1848,692,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1849,693,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1850,694,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1851,695,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1852,696,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1853,697,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1854,698,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1855,699,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1856,700,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1857,701,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1858,702,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1859,703,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1860,704,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1861,705,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1862,706,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1863,707,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1864,708,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1865,709,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1866,710,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1867,711,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1868,712,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1869,713,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1870,714,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1871,715,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1872,716,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1873,717,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1874,718,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1875,719,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1876,720,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1877,721,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1878,722,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1879,723,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1880,813,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1881,724,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1882,725,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1883,726,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1884,727,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1885,729,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1886,730,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1887,731,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1888,732,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1889,733,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1890,734,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1891,735,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1892,736,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1893,737,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1894,738,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1895,739,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1896,740,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1897,741,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1898,728,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1899,742,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1900,743,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1901,744,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1902,745,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1903,746,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1904,747,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1905,748,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1906,749,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1907,750,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1908,751,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1909,752,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1910,753,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1911,754,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1912,755,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1913,756,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1914,757,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1915,758,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1916,759,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1917,760,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1918,762,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1919,761,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1920,764,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1921,763,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1922,765,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1923,766,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1924,767,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1925,768,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1926,769,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1927,770,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1928,771,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1929,772,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1930,773,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1931,774,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1932,775,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1933,776,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1934,777,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1935,778,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1936,779,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1937,780,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1938,781,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1939,782,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1940,783,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1941,784,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1942,785,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1943,786,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1944,787,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1945,788,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1946,789,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1947,790,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1948,791,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1949,793,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1950,792,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1951,796,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1952,794,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1953,795,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1954,797,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1955,799,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1956,800,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1957,801,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1958,802,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1959,803,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1960,804,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1961,805,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1962,806,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1963,807,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1964,808,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1965,809,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1966,810,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1967,811,24,'2010-04-19 21:52:44',4,NULL,NULL,1),
 (1982,1184,7,'2010-04-26 07:39:47',15,'2010-04-26 07:39:47',15,1),
 (1983,1185,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1984,1186,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1985,1187,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1986,1188,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1987,1189,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1988,1190,27,'2010-05-15 09:02:41',8,'2010-05-15 09:02:41',8,1),
 (1989,1191,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1990,1192,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1991,1193,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1992,1194,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1993,1195,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1994,1196,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1995,1197,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1996,1198,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1997,1199,27,'2010-05-15 09:02:42',8,'2010-05-15 09:02:42',8,1),
 (1998,1200,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (1999,1201,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2000,1202,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2001,1203,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2002,1204,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2003,1205,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2004,1206,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2005,1207,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2006,1208,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2007,1209,27,'2010-05-15 09:02:43',8,'2010-05-15 09:02:43',8,1),
 (2008,1210,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2009,1211,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2010,1212,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2011,1213,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2012,1214,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2013,1215,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2014,1216,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2015,1217,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2016,1218,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2017,1219,27,'2010-05-15 09:02:44',8,'2010-05-15 09:02:44',8,1),
 (2018,1220,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2019,1221,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2020,1222,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2021,1223,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2022,1224,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2023,1225,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2024,1226,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2025,1227,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2026,1228,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2027,1229,27,'2010-05-15 09:02:45',8,'2010-05-15 09:02:45',8,1),
 (2028,1230,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2029,1231,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2030,1232,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2031,1233,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2032,1234,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2033,1235,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2034,1236,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2035,1237,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2036,1238,27,'2010-05-15 09:02:46',8,'2010-05-15 09:02:46',8,1),
 (2037,1239,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2038,1240,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2039,1241,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2040,1242,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2041,1243,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2042,1244,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2043,1245,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2044,1246,27,'2010-05-15 09:02:47',8,'2010-05-15 09:02:47',8,1),
 (2045,1247,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2046,1248,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2047,1249,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2048,1250,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2049,1251,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2050,1252,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2051,1253,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2052,1254,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2053,1255,27,'2010-05-15 09:02:48',8,'2010-05-15 09:02:48',8,1),
 (2054,1256,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2055,1257,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2056,1258,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2057,1259,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2058,1260,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2059,1261,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2060,1262,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2061,1263,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2062,1264,27,'2010-05-15 09:02:49',8,'2010-05-15 09:02:49',8,1),
 (2063,1265,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2064,1266,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2065,1267,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2066,1268,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2067,1269,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2068,1270,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2069,1271,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2070,1272,27,'2010-05-15 09:02:50',8,'2010-05-15 09:02:50',8,1),
 (2071,1273,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2072,1274,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2073,1275,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2074,1276,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2075,1277,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2076,1278,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2077,1279,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2078,1280,27,'2010-05-15 09:02:51',8,'2010-05-15 09:02:51',8,1),
 (2079,1281,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2080,1282,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2081,1283,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2082,1284,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2083,1285,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2084,1286,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2085,1287,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2086,1288,27,'2010-05-15 09:02:52',8,'2010-05-15 09:02:52',8,1),
 (2087,1289,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2088,1290,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2089,1291,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2090,1292,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2091,1293,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2092,1294,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2093,1295,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2094,1296,27,'2010-05-15 09:02:53',8,'2010-05-15 09:02:53',8,1),
 (2095,1297,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2096,1298,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2097,1299,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2098,1300,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2099,1301,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2100,1302,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2101,1303,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2102,1304,27,'2010-05-15 09:02:54',8,'2010-05-15 09:02:54',8,1),
 (2103,1305,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2104,1306,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2105,1307,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2106,1308,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2107,1309,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2108,1310,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2109,1311,27,'2010-05-15 09:02:55',8,'2010-05-15 09:02:55',8,1),
 (2110,1312,27,'2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1),
 (2111,1313,27,'2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1),
 (2112,1314,27,'2010-05-15 09:02:56',8,'2010-05-15 09:02:56',8,1),
 (2113,1315,27,'2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1),
 (2114,1316,27,'2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1),
 (2115,1317,27,'2010-05-15 09:02:57',8,'2010-05-15 09:02:57',8,1),
 (2116,1318,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2117,1319,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2118,1320,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2119,1321,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2120,1322,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2121,1323,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2122,1324,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2123,1325,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2124,1326,27,'2010-05-15 09:02:58',8,'2010-05-15 09:02:58',8,1),
 (2125,1327,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2126,1328,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2127,1329,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2128,1330,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2129,1331,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2130,1332,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2131,1333,27,'2010-05-15 09:02:59',8,'2010-05-15 09:02:59',8,1),
 (2132,1334,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2133,1335,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2134,1336,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2135,1337,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2136,1338,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2137,1339,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2138,1340,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2139,1341,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2140,1342,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2141,1343,27,'2010-05-15 09:03:00',8,'2010-05-15 09:03:00',8,1),
 (2142,1344,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2143,1345,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2144,1346,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2145,1347,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2146,1348,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2147,1349,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2148,1350,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2149,1351,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2150,1352,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2151,1353,27,'2010-05-15 09:03:01',8,'2010-05-15 09:03:01',8,1),
 (2152,1354,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2153,1355,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2154,1356,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2155,1357,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2156,1358,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2157,1359,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2158,1360,27,'2010-05-15 09:03:02',8,'2010-05-15 09:03:02',8,1),
 (2159,1361,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2160,1362,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2161,1363,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2162,1364,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2163,1365,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2164,1366,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2165,1367,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2166,1368,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2167,1369,27,'2010-05-15 09:03:03',8,'2010-05-15 09:03:03',8,1),
 (2168,1370,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2169,1371,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2170,1372,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2171,1373,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2172,1374,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2173,1375,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2174,1376,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2175,1377,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2176,1378,27,'2010-05-15 09:03:04',8,'2010-05-15 09:03:04',8,1),
 (2177,1379,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2178,1380,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2179,1381,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2180,1382,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2181,1383,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2182,1384,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2183,1385,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2184,1386,27,'2010-05-15 09:03:05',8,'2010-05-15 09:03:05',8,1),
 (2185,1387,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2186,1388,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2187,1389,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2188,1390,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2189,1391,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2190,1392,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2191,1393,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2192,1394,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2193,1395,27,'2010-05-15 09:03:06',8,'2010-05-15 09:03:06',8,1),
 (2194,1396,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2195,1397,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2196,1398,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2197,1399,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2198,1400,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2199,1401,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2200,1402,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2201,1403,27,'2010-05-15 09:03:07',8,'2010-05-15 09:03:07',8,1),
 (2202,1404,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2203,1405,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2204,1406,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2205,1407,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2206,1408,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2207,1409,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2208,1410,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2209,1411,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2210,1412,27,'2010-05-15 09:03:08',8,'2010-05-15 09:03:08',8,1),
 (2211,1413,27,'2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1),
 (2212,1414,27,'2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1),
 (2213,1415,27,'2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1),
 (2214,1416,27,'2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1),
 (2215,1417,27,'2010-05-15 09:03:09',8,'2010-05-15 09:03:09',8,1),
 (2216,1418,22,'2010-05-17 22:41:51',28,'2010-05-17 22:41:51',28,1);
/*!40000 ALTER TABLE "customers_customergroups" ENABLE KEYS */;


--
-- Definition of table "delivery_pattern"
--
CREATE TABLE "delivery_pattern" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "pattern_name" varchar(45) NOT NULL,
  "pattern_desc" varchar(75) DEFAULT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "modified_on" datetime DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=801;

--
-- Dumping data for table "delivery_pattern"
--

/*!40000 ALTER TABLE "delivery_pattern" DISABLE KEYS */;
INSERT INTO "delivery_pattern" ("id","pattern_name","pattern_desc","created_by","created_on","modified_by","modified_on","is_active") VALUES 
 (300,'SEND_IMMEDIATE','Send Mail Immediately',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1),
 (400,'SCHEDULE_LATER','Send Mail Later',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1),
 (500,'SEND_DAILY','Send Mail Every Day',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1),
 (600,'SEND_WEEKLY','Send Mail Weekly',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1),
 (700,'SEND_MONTHLY','Send Monthly',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1),
 (800,'SEND_ONCE','Send Mail Just Once',2,'2004-04-10 00:00:00',2,'2004-04-10 00:00:00',1);
/*!40000 ALTER TABLE "delivery_pattern" ENABLE KEYS */;


--
-- Definition of table "dummy"
--
CREATE TABLE "dummy" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "value" varchar(45) NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "dummy"
--

/*!40000 ALTER TABLE "dummy" DISABLE KEYS */;
/*!40000 ALTER TABLE "dummy" ENABLE KEYS */;


--
-- Definition of table "elements"
--
CREATE TABLE "elements" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "name" varchar(45) NOT NULL,
  "label" varchar(100) NOT NULL,
  "element_order" int(10) unsigned NOT NULL,
  "template_id" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(10) unsigned NOT NULL,
  "max_length" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=56 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "elements"
--

/*!40000 ALTER TABLE "elements" DISABLE KEYS */;
INSERT INTO "elements" ("id","name","label","element_order","template_id","created_on","created_by","modified_on","modified_by","is_active","max_length") VALUES 
 (1,'customerName','C',1,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,12),
 (2,'serviceComments','S',2,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,12),
 (3,'helpComments','H',3,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,12),
 (4,'regNumber','R',4,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,124),
 (5,'submit','S',5,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,12),
 (6,'Q1','A',6,53,'2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,24),
 (7,'Q2','Q',7,53,'2010-02-20 09:46:54',8,'2010-02-20 09:46:54',8,1,14),
 (8,'Q3','Q',8,53,'2010-02-20 09:46:54',8,'2010-02-20 09:46:54',8,1,124),
 (9,'customerName','C',1,55,'2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,0),
 (10,'serviceComments','S',2,55,'2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,0),
 (11,'helpComments','H',3,55,'2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,0),
 (12,'regNumber','R',4,55,'2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,0),
 (13,'submit','S',5,55,'2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,0),
 (14,'Q1','Q',6,55,'2010-02-20 20:55:49',9,'2010-02-20 20:55:49',9,1,0),
 (15,'Q2','Q',7,55,'2010-02-20 20:55:49',9,'2010-02-20 20:55:49',9,1,0),
 (16,'Q3','Q',8,55,'2010-02-20 20:55:49',9,'2010-02-20 20:55:49',9,1,0),
 (17,'comm','Service COmments',1,56,'2010-02-26 10:17:34',8,'2010-02-26 10:17:34',8,1,0),
 (18,'uname','User Name',2,56,'2010-02-26 10:17:34',8,'2010-02-26 10:17:34',8,1,0),
 (19,'chk1','Newsletter',3,56,'2010-02-26 10:17:34',8,'2010-02-26 10:17:34',8,1,0),
 (20,'Field3','Field3',1,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (21,'Field2','Field2',2,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (22,'Field4','Field4',3,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (23,'Field7','Field7',4,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (24,'Field6','Field6',5,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (25,'saveForm','',6,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (26,'Field9','Field9',7,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (27,'Field8','Field8',8,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (28,'Field10','Field10',9,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (29,'idstamp','',10,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (30,'Field2-1','Field2_1',11,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (31,'Field1','Field1',12,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (32,'Field0','Field0',13,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (33,'Field2-2','Fied2_2',14,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (34,'Field105','Field105',15,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (35,'currentPage','',16,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (36,'comment','Comment',17,74,'2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,0),
 (54,'Comments','User Comments',1,130,'2010-05-15 11:59:01',28,'2010-05-15 11:59:01',28,1,0),
 (55,'UserName','User Name',2,130,'2010-05-15 11:59:01',28,'2010-05-15 11:59:01',28,1,0);
/*!40000 ALTER TABLE "elements" ENABLE KEYS */;


--
-- Definition of table "groups"
--
CREATE TABLE "groups" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(100) NOT NULL,
  "desc" varchar(200) DEFAULT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=6;

--
-- Dumping data for table "groups"
--

/*!40000 ALTER TABLE "groups" DISABLE KEYS */;
INSERT INTO "groups" ("id","name","desc","created_by","modified_by","created_on","modified_on","is_active") VALUES 
 (1,'Administrator','System Administrator',0,0,NULL,NULL,1),
 (2,'Super User','Super User',2,2,NULL,NULL,1),
 (3,'Template Management Group','Template Management Group',2,2,NULL,NULL,1),
 (4,'Mail Management Group','Mail Management Group',2,2,NULL,NULL,1),
 (5,'Contact Management Group','Contact Management Group',2,2,NULL,NULL,1);
/*!40000 ALTER TABLE "groups" ENABLE KEYS */;


--
-- Definition of table "groups_roles"
--
CREATE TABLE "groups_roles" (
  "group_id" int(11) NOT NULL DEFAULT '0',
  "role_id" int(11) NOT NULL DEFAULT '0',
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(2) DEFAULT NULL,
  PRIMARY KEY ("group_id","role_id"),
  KEY "FK_groups_roles_1" ("role_id"),
  CONSTRAINT "FK_groups_roles_1" FOREIGN KEY ("role_id") REFERENCES "roles" ("id"),
  CONSTRAINT "FK_groups_roles_2" FOREIGN KEY ("group_id") REFERENCES "groups" ("id")
) TYPE=InnoDB ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "groups_roles"
--

/*!40000 ALTER TABLE "groups_roles" DISABLE KEYS */;
INSERT INTO "groups_roles" ("group_id","role_id","created_by","modified_by","created_on","modified_on","is_active") VALUES 
 (1,1,1,1,NULL,NULL,1),
 (2,2,2,2,NULL,NULL,1),
 (2,3,2,2,NULL,NULL,1),
 (2,4,2,2,NULL,NULL,1),
 (2,5,2,2,NULL,NULL,1);
/*!40000 ALTER TABLE "groups_roles" ENABLE KEYS */;


--
-- Definition of table "groups_users"
--
CREATE TABLE "groups_users" (
  "group_id" int(11) NOT NULL DEFAULT '0',
  "user_id" int(11) unsigned NOT NULL DEFAULT '0',
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(2) DEFAULT NULL,
  PRIMARY KEY ("group_id","user_id"),
  KEY "FK_groups_users_2" ("user_id"),
  CONSTRAINT "FK_groups_users_1" FOREIGN KEY ("group_id") REFERENCES "groups" ("id"),
  CONSTRAINT "FK_groups_users_2" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
) TYPE=InnoDB ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "groups_users"
--

/*!40000 ALTER TABLE "groups_users" DISABLE KEYS */;
INSERT INTO "groups_users" ("group_id","user_id","created_by","modified_by","created_on","modified_on","is_active") VALUES 
 (1,2,1,1,NULL,NULL,1),
 (1,9,0,0,'2010-02-20','2010-02-20',1),
 (1,10,0,0,'2010-02-23','2010-02-23',1),
 (1,11,0,0,'2010-02-26','2010-02-26',1),
 (1,12,0,0,'2010-02-28','2010-02-28',1),
 (1,17,0,0,'2010-03-17','2010-03-17',1),
 (1,18,0,0,'2010-03-17','2010-03-17',1),
 (1,19,0,0,'2010-03-17','2010-03-17',1),
 (1,22,0,0,'2010-03-17','2010-03-17',1),
 (2,4,0,0,'2010-04-19','2010-04-19',1),
 (2,8,0,0,'2010-02-18','2010-02-18',1),
 (2,13,0,0,'2010-03-14','2010-03-14',1),
 (2,15,0,0,'2010-03-14','2010-03-14',1),
 (2,16,0,0,'2010-03-16','2010-03-16',1),
 (2,20,0,0,'2010-03-17','2010-03-17',1),
 (2,21,0,0,'2010-03-17','2010-03-17',1),
 (2,23,0,0,'2010-04-16','2010-04-16',1),
 (2,24,0,0,'2010-04-16','2010-04-16',1),
 (2,28,0,0,'2010-04-17','2010-04-17',1),
 (2,29,0,0,'2010-04-18','2010-04-18',1),
 (2,32,0,0,'2010-04-19','2010-04-19',1),
 (2,33,0,0,'2010-05-23','2010-05-23',1);
/*!40000 ALTER TABLE "groups_users" ENABLE KEYS */;


--
-- Definition of table "mail_tracker_log"
--
CREATE TABLE "mail_tracker_log" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "template_id" int(10) unsigned NOT NULL,
  "mailer_id" int(10) unsigned NOT NULL,
  "customer_id" int(10) unsigned NOT NULL,
  "email_id" varchar(100) NOT NULL,
  "received_on" datetime NOT NULL,
  "received_from_ip" varchar(50) NOT NULL,
  "user_agent" varchar(400) NOT NULL,
  "list_id" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=9;

--
-- Dumping data for table "mail_tracker_log"
--

/*!40000 ALTER TABLE "mail_tracker_log" DISABLE KEYS */;
INSERT INTO "mail_tracker_log" ("id","user_id","template_id","mailer_id","customer_id","email_id","received_on","received_from_ip","user_agent","list_id") VALUES 
 (3,8,10,10,100,'test@gmail.com','2010-05-15 21:41:42','127.0.0.1','Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1064 Safari/532.5',0),
 (4,8,147,121,1176,'gowrisankar.narayan@gmail.com','2010-05-15 22:09:01','82.0.85.113','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.78 Safari/532.5',0),
 (5,8,152,126,1176,'gowrisankar.narayan@gmail.com','2010-05-15 23:51:57','82.0.85.113','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.78 Safari/532.5',0),
 (6,8,133,107,1182,'testemail@yahoo.com','2010-05-16 17:41:07','127.0.0.1','Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1064 Safari/532.5',0),
 (7,8,152,126,1254,'gowrisankar.narayan@gmail.com','2010-05-16 18:13:06','82.0.85.113','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.78 Safari/532.5',0),
 (8,8,53,131,1176,'gowrisankar.narayan@gmail.com','2010-05-19 12:08:54','82.0.85.113','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.78 Safari/532.5',0);
/*!40000 ALTER TABLE "mail_tracker_log" ENABLE KEYS */;


--
-- Definition of table "mailers"
--
CREATE TABLE "mailers" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "template_id" varchar(45) NOT NULL,
  "sent_on" datetime NOT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "date_scheduled" datetime DEFAULT NULL,
  "status_id" int(10) unsigned DEFAULT NULL,
  "mail_subject" varchar(300) DEFAULT NULL,
  "mail_config_id" int(10) unsigned DEFAULT NULL,
  "profile_id" int(10) unsigned DEFAULT NULL,
  "group_ids" varchar(300) DEFAULT NULL,
  "send_to_groups" int(2) unsigned DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_mailers_1" ("profile_id"),
  CONSTRAINT "FK_mailers_1" FOREIGN KEY ("profile_id") REFERENCES "user_mailconfig" ("id")
) TYPE=InnoDB AUTO_INCREMENT=141 ROW_FORMAT=FIXED;

--
-- Dumping data for table "mailers"
--

/*!40000 ALTER TABLE "mailers" DISABLE KEYS */;
INSERT INTO "mailers" ("id","user_id","template_id","sent_on","created_on","created_by","modified_on","modified_by","is_active","date_scheduled","status_id","mail_subject","mail_config_id","profile_id","group_ids","send_to_groups") VALUES 
 (78,28,'104','2010-04-25 06:55:03','2010-04-25 06:55:03',28,'2010-04-25 06:55:03',28,1,NULL,1,'About our products - Please read',0,NULL,NULL,NULL),
 (86,28,'112','2010-04-25 21:03:01','2010-04-25 21:03:01',28,'2010-04-25 21:03:01',28,1,NULL,1,'TEST MAIL SUBJECT',NULL,NULL,NULL,NULL),
 (87,28,'113','2010-04-25 21:05:28','2010-04-25 21:05:28',28,'2010-04-25 21:05:28',28,1,NULL,1,'TEST ONCE MAIL',NULL,NULL,NULL,NULL),
 (90,15,'116','2010-04-26 07:44:03','2010-04-26 07:44:03',15,'2010-04-26 07:44:03',15,1,NULL,1,'TEST MESSAGE ABT PRODUCTS',NULL,NULL,NULL,NULL),
 (104,8,'62','2010-05-09 08:20:37','2010-05-09 08:20:37',8,'2010-05-09 08:20:37',8,1,NULL,1,'About our products - Please read',NULL,NULL,'19',1),
 (105,28,'131','2010-05-15 13:50:41','2010-05-15 13:50:41',28,'2010-05-15 13:50:41',28,1,NULL,1,'TEST MESSAGE',NULL,NULL,'22',1),
 (106,8,'132','2010-05-15 17:08:22','2010-05-15 17:08:22',8,'2010-05-15 17:08:22',8,1,NULL,1,'TEST MESSAGE ABT PRODUCTS',NULL,NULL,'1',1),
 (107,8,'133','2010-05-15 17:28:54','2010-05-15 17:28:54',8,'2010-05-15 17:28:54',8,1,NULL,1,'About our products - Please read',NULL,NULL,'1',1),
 (108,8,'134','2010-05-15 17:34:51','2010-05-15 17:34:51',8,'2010-05-15 17:34:51',8,1,NULL,1,'Custom Selection Test',NULL,NULL,NULL,0),
 (109,8,'135','2010-05-15 18:38:29','2010-05-15 18:38:29',8,'2010-05-15 18:38:29',8,1,NULL,1,'Mail Profile Test',NULL,NULL,'1',1),
 (110,8,'136','2010-05-15 18:43:47','2010-05-15 18:43:47',8,'2010-05-15 18:43:47',8,1,NULL,1,'Custom Profile Test',NULL,NULL,NULL,0),
 (111,8,'137','2010-05-15 18:47:57','2010-05-15 18:47:57',8,'2010-05-15 18:47:57',8,1,NULL,1,'Test custom profile again',NULL,NULL,NULL,0),
 (112,8,'138','2010-05-15 18:53:46','2010-05-15 18:53:46',8,'2010-05-15 18:53:46',8,1,NULL,1,'TO Sai test',NULL,NULL,NULL,0),
 (113,8,'139','2010-05-15 18:57:28','2010-05-15 18:57:28',8,'2010-05-15 18:57:28',8,1,NULL,1,'To sai test again',NULL,1,NULL,0),
 (114,8,'140','2010-05-15 19:22:42','2010-05-15 19:22:42',8,'2010-05-15 19:22:42',8,1,NULL,1,'Test send to sai baabi',NULL,1,NULL,0),
 (115,8,'141','2010-05-15 19:25:01','2010-05-15 19:25:01',8,'2010-05-15 19:25:01',8,1,NULL,1,'Final test',NULL,1,NULL,0),
 (116,8,'142','2010-05-15 19:27:47','2010-05-15 19:27:47',8,'2010-05-15 19:27:47',8,1,NULL,1,'The final msg',NULL,1,'1',1),
 (117,8,'143','2010-05-15 19:33:44','2010-05-15 19:33:44',8,'2010-05-15 19:33:44',8,1,NULL,1,'Final message test',NULL,1,NULL,0),
 (118,8,'144','2010-05-15 19:39:11','2010-05-15 19:39:11',8,'2010-05-15 19:39:11',8,1,NULL,1,'the final message',NULL,1,'1',1),
 (119,8,'145','2010-05-15 19:58:42','2010-05-15 19:58:42',8,'2010-05-15 19:58:42',8,1,NULL,1,'what is this',NULL,1,'18',1),
 (120,8,'146','2010-05-15 22:04:59','2010-05-15 22:04:59',8,'2010-05-15 22:04:59',8,1,NULL,1,'First tracker',NULL,1,'18',1),
 (121,8,'147','2010-05-15 22:08:07','2010-05-15 22:08:07',8,'2010-05-15 22:08:07',8,1,NULL,1,'Second Mail Tracker Message',NULL,1,'18',1),
 (122,8,'148','2010-05-15 22:26:38','2010-05-15 22:26:38',8,'2010-05-15 22:26:38',8,1,NULL,1,'Third Mail Tracker',NULL,1,NULL,0),
 (123,8,'149','2010-05-15 22:37:28','2010-05-15 22:37:28',8,'2010-05-15 22:37:28',8,1,NULL,1,'About our products - Please read',NULL,1,NULL,0),
 (124,8,'150','2010-05-15 22:46:36','2010-05-15 22:46:36',8,'2010-05-15 22:46:36',8,1,NULL,1,'Policy Error Check',NULL,1,'18',1),
 (125,8,'151','2010-05-15 22:55:24','2010-05-15 22:55:24',8,'2010-05-15 22:55:24',8,1,NULL,1,'Policy Error Fixe TEST',NULL,1,'18',1),
 (126,8,'152','2010-05-15 23:50:35','2010-05-15 23:50:35',8,'2010-05-15 23:50:35',8,1,NULL,1,'From new server',NULL,1,'18',1),
 (127,8,'133','2010-05-16 00:08:32','2010-05-16 00:08:32',8,'2010-05-16 00:08:32',8,1,NULL,1,'My Third Test Mail',NULL,1,'18',1),
 (128,8,'153','2010-05-16 09:34:19','2010-05-16 09:34:19',8,'2010-05-16 09:34:19',8,1,NULL,1,'Just sent once',NULL,1,'18',1),
 (129,8,'154','2010-05-16 09:37:22','2010-05-16 09:37:22',8,'2010-05-16 09:37:22',8,1,NULL,1,'Just Send Once - Test Two',NULL,1,'18',1),
 (130,8,'155','2010-05-16 12:34:54','2010-05-16 12:34:54',8,'2010-05-16 12:34:54',8,1,NULL,1,'About our products - Please read',NULL,1,NULL,0),
 (131,8,'53','2010-05-16 14:07:46','2010-05-16 14:07:46',8,'2010-05-16 14:07:46',8,1,NULL,1,'TEST MAIL SUBJECT',NULL,1,'18',1),
 (132,28,'156','2010-05-16 14:41:53','2010-05-16 14:41:53',28,'2010-05-16 14:41:53',28,1,NULL,1,'TEST MESSAGE ABT PRODUCTS',NULL,4,NULL,0),
 (133,28,'157','2010-05-16 14:43:38','2010-05-16 14:43:38',28,'2010-05-16 14:43:38',28,1,NULL,1,'Test send once mail',NULL,4,'22',1),
 (134,8,'158','2010-05-16 17:40:02','2010-05-16 17:40:02',8,'2010-05-16 17:40:02',8,1,NULL,1,'Test Web Link',NULL,1,NULL,0),
 (135,8,'56','2010-05-16 17:47:12','2010-05-16 17:47:12',8,'2010-05-16 17:47:12',8,1,NULL,1,'Test Web Link',NULL,1,'18',1),
 (136,28,'159','2010-05-17 22:40:52','2010-05-17 22:40:52',28,'2010-05-17 22:40:52',28,1,NULL,1,'test',NULL,4,'22',1),
 (137,28,'160','2010-05-18 07:01:09','2010-05-18 07:01:09',28,'2010-05-18 07:01:09',28,1,NULL,1,'Hi how do you do',NULL,4,NULL,0),
 (138,28,'160','2010-05-18 07:06:44','2010-05-18 07:06:44',28,'2010-05-18 07:06:44',28,1,NULL,1,'My first how do you do',NULL,6,NULL,0),
 (139,8,'145','2010-05-20 19:43:33','2010-05-20 19:43:33',8,'2010-05-20 19:43:33',8,1,NULL,1,'what is this',NULL,1,'1,18,19',1),
 (140,8,'134','2010-05-25 08:08:45','2010-05-25 08:08:45',8,'2010-05-25 08:08:45',8,1,NULL,1,'box is horizontally centered',NULL,1,'19',1);
/*!40000 ALTER TABLE "mailers" ENABLE KEYS */;


--
-- Definition of table "mailers_customers"
--
CREATE TABLE "mailers_customers" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "mailer_id" int(11) unsigned NOT NULL,
  "customer_id" int(10) unsigned DEFAULT NULL,
  "status_id" int(11) NOT NULL,
  "email_id" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_mailers_customers_1" ("mailer_id"),
  KEY "FK_mailers_customers_2" ("customer_id"),
  CONSTRAINT "FK_mailers_customers_1" FOREIGN KEY ("mailer_id") REFERENCES "mailers" ("id"),
  CONSTRAINT "FK_mailers_customers_2" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
) TYPE=InnoDB AUTO_INCREMENT=256 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "mailers_customers"
--

/*!40000 ALTER TABLE "mailers_customers" DISABLE KEYS */;
INSERT INTO "mailers_customers" ("id","mailer_id","customer_id","status_id","email_id") VALUES 
 (172,78,NULL,1,'narayana.gowrisankar@gmail.com'),
 (226,86,NULL,1,'narayana.gowrisankar@gmail.com'),
 (227,87,NULL,1,'narayana.gowrisankar@gmail.com'),
 (230,90,NULL,1,'sai.baabi@gmail.com'),
 (241,108,NULL,1,'gowrisankar.narayana@sm-ms.biz'),
 (242,110,NULL,1,'gowrisankar.narayan@gmail.com'),
 (243,111,NULL,1,'narayana.gowrisankar@gmail.com'),
 (244,112,NULL,1,'sai.baabi@gmail.com'),
 (245,113,NULL,1,'sai.baabi@gmail.com'),
 (246,114,NULL,1,'sai.baabi@gmail.com'),
 (247,115,NULL,1,'sai.baabi@gmail.com'),
 (248,117,NULL,1,'sai.baabi@gmail.com'),
 (249,122,NULL,1,'gowrisankar.narayan@gmail.com'),
 (250,123,NULL,1,'gowrisankar.narayana@sm-ms.biz'),
 (251,130,NULL,1,'sai.baabi@gmail.com'),
 (252,132,NULL,1,'narayana.gowrisankar@gmail.com'),
 (253,134,NULL,1,'gowrisankar.narayan@gmail.com'),
 (254,137,NULL,1,'gowrisankar.narayanan@gmail.com'),
 (255,138,NULL,1,'narayana.gowrisankar@gmail.com');
/*!40000 ALTER TABLE "mailers_customers" ENABLE KEYS */;


--
-- Definition of table "mailers_delivery_log"
--
CREATE TABLE "mailers_delivery_log" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "mailer_id" int(11) NOT NULL,
  "delivery_date" date DEFAULT NULL,
  "delivery_time" timestamp NOT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(11) DEFAULT NULL,
  "delivery_status" int(10) unsigned DEFAULT NULL,
  "contact_count" int(10) unsigned DEFAULT NULL,
  "error_message" varchar(500) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=58;

--
-- Dumping data for table "mailers_delivery_log"
--

/*!40000 ALTER TABLE "mailers_delivery_log" DISABLE KEYS */;
INSERT INTO "mailers_delivery_log" ("id","mailer_id","delivery_date","delivery_time","created_by","modified_by","created_on","modified_on","is_active","delivery_status","contact_count","error_message") VALUES 
 (14,106,'2010-05-15','2010-05-15 17:09:03',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (15,107,'2010-05-15','2010-05-15 17:30:03',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (16,108,'2010-05-15','2010-05-15 17:34:59',8,8,'2010-05-15','2010-05-15',1,3,1,NULL),
 (17,109,'2010-05-15','2010-05-15 18:39:04',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (18,110,'2010-05-15','2010-05-15 18:44:04',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (19,115,'2010-05-15','2010-05-16 00:02:22',8,8,'2010-05-15','2010-05-15',1,4,1,'<ul><li>Unknown server error</li></ul>'),
 (20,116,'2010-05-15','2010-05-16 00:02:22',8,8,'2010-05-15','2010-05-15',1,4,0,'<ul><li>Unknown server error</li></ul>'),
 (21,117,'2010-05-15','2010-05-16 00:02:22',8,8,'2010-05-15','2010-05-15',1,4,1,'<ul><li>Unknown server error</li></ul>'),
 (22,118,'2010-05-15','2010-05-16 00:02:21',8,8,'2010-05-15','2010-05-15',1,4,2,'<ul><li>Unknown server error</li></ul>'),
 (23,119,'2010-05-15','2010-05-15 19:59:03',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (24,120,'2010-05-15','2010-05-16 00:02:21',8,8,'2010-05-15','2010-05-15',1,4,0,'<ul><li>Unknown server error</li></ul>'),
 (25,121,'2010-05-15','2010-05-15 22:08:15',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (26,122,'2010-05-15','2010-05-16 00:02:21',8,8,'2010-05-15','2010-05-15',1,4,1,'<ul><li>Unknown server error</li></ul>'),
 (27,123,'2010-05-15','2010-05-15 22:38:13',8,8,'2010-05-15','2010-05-15',1,3,1,NULL),
 (28,124,'2010-05-15','2010-05-16 00:02:21',8,8,'2010-05-15','2010-05-15',1,4,2,'<ul><li>Unknown server error</li></ul>'),
 (29,125,'2010-05-15','2010-05-16 00:02:21',8,8,'2010-05-15','2010-05-15',1,4,2,'<ul><li>Unknown server error</li></ul>'),
 (30,126,'2010-05-15','2010-05-15 23:51:03',8,8,'2010-05-15','2010-05-15',1,3,2,NULL),
 (31,127,'2010-05-16','2010-05-16 00:09:02',8,8,'2010-05-16','2010-05-16',1,3,2,NULL),
 (32,0,'2010-05-16','2010-05-16 09:34:20',0,0,'2010-05-16','2010-05-16',1,3,0,''),
 (33,0,'2010-05-16','2010-05-16 09:34:20',0,0,'2010-05-16','2010-05-16',1,3,0,''),
 (34,129,'2010-05-16','2010-05-16 09:45:03',8,8,'2010-05-16','2010-05-16',1,3,2,''),
 (35,128,'2010-05-16','2010-05-16 09:45:04',8,8,'2010-05-16','2010-05-16',1,3,2,''),
 (36,130,'2010-05-16','2010-05-16 12:35:03',8,8,'2010-05-16','2010-05-16',1,3,1,''),
 (37,131,'2010-05-16','2010-05-16 14:08:04',8,8,'2010-05-16','2010-05-16',1,3,2,''),
 (38,132,'2010-05-16','2010-05-16 14:42:00',28,28,'2010-05-16','2010-05-16',1,4,1,'failed to connect'),
 (39,133,'2010-05-16','2010-05-16 14:44:01',28,28,'2010-05-16','2010-05-16',1,4,1,'failed to connect'),
 (40,107,'2010-05-16','2010-05-16 17:40:04',8,8,'2010-05-16','2010-05-16',1,4,0,'Invalid protocol: null'),
 (41,134,'2010-05-16','2010-05-16 17:41:00',8,8,'2010-05-16','2010-05-16',1,4,1,'Invalid protocol: null'),
 (42,135,'2010-05-16','2010-05-16 17:48:06',8,8,'2010-05-16','2010-05-16',1,3,2,''),
 (43,0,'2010-05-17','2010-05-17 22:40:54',0,0,'2010-05-17','2010-05-17',1,4,0,'Invalid protocol: null'),
 (44,107,'2010-05-17','2010-05-17 22:40:54',8,8,'2010-05-17','2010-05-17',1,4,0,'Invalid protocol: null'),
 (45,0,'2010-05-17','2010-05-17 22:40:54',0,0,'2010-05-17','2010-05-17',1,4,0,'Invalid protocol: null'),
 (46,136,'2010-05-17','2010-05-17 22:41:01',28,28,'2010-05-17','2010-05-17',1,4,0,'Invalid protocol: null'),
 (47,0,'2010-05-18','2010-05-18 07:01:11',0,0,'2010-05-18','2010-05-18',1,4,0,'Invalid protocol: null'),
 (48,138,'2010-05-18','2010-05-18 07:07:00',28,28,'2010-05-18','2010-05-18',1,4,1,'Invalid protocol: null'),
 (49,0,'2010-05-20','2010-05-20 19:43:35',0,0,'2010-05-20','2010-05-20',1,3,0,''),
 (50,107,'2010-05-20','2010-05-20 19:43:35',8,8,'2010-05-20','2010-05-20',1,4,2,'failed to connect'),
 (51,0,'2010-05-20','2010-05-20 19:43:35',0,0,'2010-05-20','2010-05-20',1,3,0,''),
 (52,137,'2010-05-20','2010-05-20 19:43:56',28,28,'2010-05-20','2010-05-20',1,4,1,'Could not connect to SMTP host: 10.0.0.11, port: 299'),
 (53,0,'2010-05-25','2010-05-25 08:08:47',0,0,'2010-05-25','2010-05-25',1,4,0,'Invalid protocol: null'),
 (54,137,'2010-05-25','2010-05-25 08:08:47',28,28,'2010-05-25','2010-05-25',1,4,1,'Invalid protocol: null'),
 (55,0,'2010-05-25','2010-05-25 08:08:47',0,0,'2010-05-25','2010-05-25',1,4,0,'Invalid protocol: null'),
 (56,107,'2010-05-25','2010-05-25 08:08:47',8,8,'2010-05-25','2010-05-25',1,4,0,'Invalid protocol: null'),
 (57,140,'2010-05-25','2010-05-25 08:08:51',8,8,'2010-05-25','2010-05-25',1,4,0,'Invalid protocol: null');
/*!40000 ALTER TABLE "mailers_delivery_log" ENABLE KEYS */;


--
-- Definition of table "mailers_schedule"
--
CREATE TABLE "mailers_schedule" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "mailer_id" int(10) unsigned NOT NULL,
  "pattern_id" int(10) unsigned NOT NULL,
  "start_date" datetime NOT NULL,
  "time_of_day" timestamp NOT NULL,
  "end_date" datetime DEFAULT NULL,
  "exclude_holidays" int(2) unsigned DEFAULT NULL,
  "auto_roll" int(2) unsigned DEFAULT NULL,
  "days_excluded" varchar(45) DEFAULT NULL,
  "day_of_week" int(10) unsigned DEFAULT NULL,
  "date_of_month" int(10) unsigned DEFAULT NULL,
  "status_id" int(10) unsigned DEFAULT NULL,
  "next_delivery" datetime DEFAULT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "send_hours" int(10) unsigned DEFAULT NULL,
  "send_minutes" int(10) unsigned DEFAULT NULL,
  "send_ampm" varchar(5) DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_mailers_schedule_1" ("pattern_id"),
  KEY "FK_mailers_schedule_2" ("mailer_id"),
  CONSTRAINT "FK_mailers_schedule_1" FOREIGN KEY ("pattern_id") REFERENCES "delivery_pattern" ("id"),
  CONSTRAINT "FK_mailers_schedule_2" FOREIGN KEY ("mailer_id") REFERENCES "mailers" ("id")
) TYPE=InnoDB AUTO_INCREMENT=109;

--
-- Dumping data for table "mailers_schedule"
--

/*!40000 ALTER TABLE "mailers_schedule" DISABLE KEYS */;
INSERT INTO "mailers_schedule" ("id","mailer_id","pattern_id","start_date","time_of_day","end_date","exclude_holidays","auto_roll","days_excluded","day_of_week","date_of_month","status_id","next_delivery","created_on","created_by","modified_on","modified_by","is_active","send_hours","send_minutes","send_ampm") VALUES 
 (47,78,300,'2010-04-25 00:00:00','2010-04-26 07:25:34',NULL,1,1,'null',0,0,1,NULL,'2010-04-25 06:55:03',28,'2010-04-25 06:55:03',28,1,6,15,'1'),
 (55,86,300,'2010-04-25 00:00:00','2010-04-26 07:25:34',NULL,1,1,'null',0,0,1,NULL,'2010-04-25 21:03:01',28,'2010-04-25 21:03:01',28,1,9,45,'1'),
 (56,87,800,'2010-04-25 00:00:00','2010-04-26 07:25:34',NULL,1,1,'null',0,0,0,NULL,'2010-04-25 21:05:28',28,'2010-04-25 21:05:28',28,1,9,45,'1'),
 (58,90,800,'2010-04-28 00:00:00','2010-04-26 19:00:00',NULL,1,1,'null',0,0,0,NULL,'2010-04-26 07:44:03',15,'2010-04-26 07:44:03',15,1,1,0,'1'),
 (72,104,300,'2010-05-09 00:00:00','2010-05-09 08:21:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-09 08:20:37',8,'2010-05-09 08:20:37',8,1,8,21,'0'),
 (73,105,300,'2010-05-15 00:00:00','2010-05-15 01:51:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 13:50:41',28,'2010-05-15 13:50:41',28,1,13,51,'0'),
 (74,106,300,'2010-05-15 00:00:00','2010-05-15 05:09:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 17:08:22',8,'2010-05-15 17:08:22',8,1,17,9,'0'),
 (75,107,500,'2010-05-15 00:00:00','2010-05-16 05:30:00','2010-05-15 00:00:00',1,1,'null',0,0,0,NULL,'2010-05-15 17:28:54',8,'2010-05-15 17:28:54',8,1,17,30,'2'),
 (76,108,300,'2010-05-15 00:00:00','2010-05-15 05:35:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 17:34:51',8,'2010-05-15 17:34:51',8,1,17,35,'0'),
 (77,109,300,'2010-05-15 00:00:00','2010-05-15 06:39:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 18:38:29',8,'2010-05-15 18:38:29',8,1,18,39,'0'),
 (78,110,300,'2010-05-15 00:00:00','2010-05-15 06:44:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 18:43:47',8,'2010-05-15 18:43:47',8,1,18,44,'0'),
 (79,111,300,'2010-05-15 00:00:00','2010-05-15 06:48:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 18:47:57',8,'2010-05-15 18:47:57',8,1,18,48,'0'),
 (80,112,300,'2010-05-15 00:00:00','2010-05-15 06:54:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 18:53:46',8,'2010-05-15 18:53:46',8,1,18,54,'0'),
 (81,113,300,'2010-05-15 00:00:00','2010-05-15 06:58:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 18:57:28',8,'2010-05-15 18:57:28',8,1,18,58,'0'),
 (82,114,300,'2010-05-15 00:00:00','2010-05-15 07:23:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:22:42',8,'2010-05-15 19:22:42',8,1,19,23,'0'),
 (83,115,300,'2010-05-15 00:00:00','2010-05-15 07:26:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:25:01',8,'2010-05-15 19:25:01',8,1,19,26,'0'),
 (84,116,300,'2010-05-15 00:00:00','2010-05-15 07:28:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:27:47',8,'2010-05-15 19:27:47',8,1,19,28,'0'),
 (85,117,300,'2010-05-15 00:00:00','2010-05-15 07:34:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:33:44',8,'2010-05-15 19:33:44',8,1,19,34,'0'),
 (86,118,300,'2010-05-15 00:00:00','2010-05-15 07:40:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:39:11',8,'2010-05-15 19:39:11',8,1,19,40,'0'),
 (87,119,300,'2010-05-15 00:00:00','2010-05-15 07:59:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 19:58:42',8,'2010-05-15 19:58:42',8,1,19,59,'0'),
 (88,120,300,'2010-05-15 00:00:00','2010-05-15 10:05:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:04:59',8,'2010-05-15 22:04:59',8,1,22,5,'0'),
 (89,121,300,'2010-05-15 00:00:00','2010-05-15 10:08:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:08:07',8,'2010-05-15 22:08:07',8,1,22,8,'0'),
 (90,122,300,'2010-05-15 00:00:00','2010-05-15 10:27:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:26:38',8,'2010-05-15 22:26:38',8,1,22,27,'0'),
 (91,123,300,'2010-05-15 00:00:00','2010-05-15 10:38:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:37:28',8,'2010-05-15 22:37:28',8,1,22,38,'0'),
 (92,124,300,'2010-05-15 00:00:00','2010-05-15 10:47:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:46:36',8,'2010-05-15 22:46:36',8,1,22,47,'0'),
 (93,125,300,'2010-05-15 00:00:00','2010-05-15 10:56:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 22:55:24',8,'2010-05-15 22:55:24',8,1,22,56,'0'),
 (94,126,300,'2010-05-15 00:00:00','2010-05-15 11:51:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-15 23:50:35',8,'2010-05-15 23:50:35',8,1,23,51,'0'),
 (95,127,300,'2010-05-16 00:00:00','2010-05-16 00:09:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 00:08:32',8,'2010-05-16 00:08:32',8,1,0,9,'0'),
 (96,128,800,'2010-05-16 00:00:00','2010-05-16 21:45:00','2010-05-17 00:00:00',1,1,'null',0,0,0,NULL,'2010-05-16 09:34:19',8,'2010-05-16 09:34:19',8,1,9,45,'1'),
 (97,129,800,'2010-05-16 00:00:00','2010-05-16 21:45:00','2010-05-17 00:00:00',1,1,'null',0,0,0,NULL,'2010-05-16 09:37:22',8,'2010-05-16 09:37:22',8,1,9,45,'1'),
 (98,130,300,'2010-05-16 00:00:00','2010-05-16 00:35:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 12:34:54',8,'2010-05-16 12:34:54',8,1,12,35,'0'),
 (99,131,300,'2010-05-16 00:00:00','2010-05-16 02:08:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 14:07:46',8,'2010-05-16 14:07:46',8,1,14,8,'0'),
 (100,132,300,'2010-05-16 00:00:00','2010-05-16 02:42:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 14:41:53',28,'2010-05-16 14:41:53',28,1,14,42,'0'),
 (101,133,300,'2010-05-16 00:00:00','2010-05-16 02:44:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 14:43:38',28,'2010-05-16 14:43:38',28,1,14,44,'0'),
 (102,134,300,'2010-05-16 00:00:00','2010-05-16 05:41:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 17:40:02',8,'2010-05-16 17:40:02',8,1,17,41,'0'),
 (103,135,300,'2010-05-16 00:00:00','2010-05-16 05:48:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-16 17:47:12',8,'2010-05-16 17:47:12',8,1,17,48,'0'),
 (104,136,300,'2010-05-17 00:00:00','2010-05-17 10:41:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-17 22:40:52',28,'2010-05-17 22:40:52',28,1,22,41,'0'),
 (105,137,500,'2010-05-18 00:00:00','2010-05-18 19:00:00','2010-05-22 00:00:00',1,1,'[I@1ea6a1c',0,0,0,NULL,'2010-05-18 07:01:09',28,'2010-05-18 07:01:09',28,1,8,0,'1'),
 (106,138,300,'2010-05-18 00:00:00','2010-05-18 07:07:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-18 07:06:44',28,'2010-05-18 07:06:44',28,1,7,7,'0'),
 (107,139,800,'2010-05-27 00:00:00','2010-05-20 19:00:00','2010-05-28 00:00:00',1,1,'null',0,0,0,NULL,'2010-05-20 19:43:33',8,'2010-05-20 19:43:33',8,1,8,0,'1'),
 (108,140,300,'2010-05-25 00:00:00','2010-05-25 08:09:00',NULL,1,1,'null',0,0,1,NULL,'2010-05-25 08:08:45',8,'2010-05-25 08:08:45',8,1,8,9,'0');
/*!40000 ALTER TABLE "mailers_schedule" ENABLE KEYS */;


--
-- Definition of table "menus"
--
CREATE TABLE "menus" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(50) DEFAULT NULL,
  "label" varchar(40) DEFAULT NULL,
  "desc" varchar(100) DEFAULT NULL,
  "link" varchar(400) DEFAULT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "menu_order" int(10) unsigned NOT NULL,
  "image_link" varchar(200) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=12 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "menus"
--

/*!40000 ALTER TABLE "menus" DISABLE KEYS */;
INSERT INTO "menus" ("id","name","label","desc","link","created_on","created_by","modified_on","modified_by","is_active","menu_order","image_link") VALUES 
 (1,'statistics','Statistics','Mail Statistics','/mailManager.do?mx=statistics','0000-00-00 00:00:00',1,NULL,NULL,1,2,'/images/icons/menu/statistics.png'),
 (2,'customers','Subscribers','Customers and Contacts','/customerController.do?mx=customers&route=customers/home/customers','0000-00-00 00:00:00',1,NULL,NULL,1,3,'/images/icons/menu/contacts.png'),
 (3,'templates','Mail Templates','Mail Templates','/templates.do?mx=templatesHome&route=templates/user/home','2002-02-10 00:00:00',1,NULL,NULL,1,4,'/images/icons/menu/templates.png'),
 (4,'mailers','Mailers','Compose and Send Mails','/mailer.do?mx=mailHome&route=mailers/user/home','2002-02-10 00:00:00',1,NULL,NULL,1,5,'/images/icons/menu/mails.png'),
 (5,'account','My Account','Accounts and Settings','/accountManager.do?mx=accounts','2002-02-10 00:00:00',1,NULL,NULL,1,6,'/images/icons/menu/settings.png'),
 (6,'help','Help','Help','/helpManager.do?mx=help','2002-02-10 00:00:00',1,NULL,NULL,1,7,'/images/icons/menu/help.png'),
 (7,'home','Home','Home','/customerController.do?mx=home','2002-02-02 00:00:00',2,NULL,NULL,1,1,'/images/icons/menu/home.png'),
 (8,'users','Users','System user Accounts','/users.do?mx=accounts&route=users/user/accountsHome','2002-02-02 00:00:00',2,NULL,NULL,1,9,'/images/icons/menu/accounts.png'),
 (9,'settings','Settings','Application Settings','/settings.do?mx=settings&route=settings/user/home','2002-02-02 00:00:00',2,NULL,NULL,1,10,'/images/icons/menu/appsettings.png'),
 (10,'autoResponders','Autoresponders','Auto Responders','/autoResponders.do?mx=home&route=autoResponders/user/home','2002-02-02 00:00:00',2,NULL,NULL,1,8,'/images/icons/menu/autoresponder.png'),
 (11,'lists','Lists','List Management','/lists.do?mx=listHome&route=lists/user/home','2002-02-02 00:00:00',2,NULL,NULL,1,0,'/images/icons/menu/autoresponder.png');
/*!40000 ALTER TABLE "menus" ENABLE KEYS */;


--
-- Definition of table "nationalities"
--
CREATE TABLE "nationalities" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(200) NOT NULL,
  "desc" varchar(200) DEFAULT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "nationalities"
--

/*!40000 ALTER TABLE "nationalities" DISABLE KEYS */;
INSERT INTO "nationalities" ("id","name","desc","created_by","modified_by","created_on","modified_on","is_active") VALUES 
 (1,'Afghan',NULL,0,0,NULL,NULL,1),
 (2,'Albanian',NULL,0,0,NULL,NULL,1),
 (3,'Algerian',NULL,0,0,NULL,NULL,1),
 (4,'American Samoa',NULL,0,0,NULL,NULL,1),
 (5,'Andorran',NULL,0,0,NULL,NULL,1),
 (6,'Angolan',NULL,0,0,NULL,NULL,1),
 (7,'Anguilla',NULL,0,0,NULL,NULL,1),
 (8,'Argentine',NULL,0,0,NULL,NULL,1),
 (9,'Armenian',NULL,0,0,NULL,NULL,1),
 (10,'Australian',NULL,0,0,NULL,NULL,1),
 (11,'Austrian',NULL,0,0,NULL,NULL,1),
 (12,'Azerbaijan',NULL,0,0,NULL,NULL,1),
 (13,'Azerbaijani',NULL,0,0,NULL,NULL,1),
 (14,'Bahamian',NULL,0,0,NULL,NULL,1),
 (15,'Bahraini',NULL,0,0,NULL,NULL,1),
 (16,'Bangladeshi',NULL,0,0,NULL,NULL,1),
 (17,'Barbadian',NULL,0,0,NULL,NULL,1),
 (18,'Belarusian',NULL,0,0,NULL,NULL,1),
 (19,'Belgian',NULL,0,0,NULL,NULL,1),
 (20,'Belizean',NULL,0,0,NULL,NULL,1),
 (21,'Beninese',NULL,0,0,NULL,NULL,1),
 (22,'Bermuda',NULL,0,0,NULL,NULL,1),
 (23,'Bhutanese',NULL,0,0,NULL,NULL,1),
 (24,'Bolivian',NULL,0,0,NULL,NULL,1),
 (25,'Bosnia and Herzegovina',NULL,0,0,NULL,NULL,1),
 (26,'Bosnian',NULL,0,0,NULL,NULL,1),
 (27,'Botswanan',NULL,0,0,NULL,NULL,1),
 (28,'Brazilian',NULL,0,0,NULL,NULL,1),
 (29,'British Antarctic Territory',NULL,0,0,NULL,NULL,1),
 (30,'British Indian Ocean Territory',NULL,0,0,NULL,NULL,1),
 (31,'British National',NULL,0,0,NULL,NULL,1),
 (32,'British National',NULL,0,0,NULL,NULL,1),
 (33,'British Virgin Islands',NULL,0,0,NULL,NULL,1),
 (34,'British Virgin Islands',NULL,0,0,NULL,NULL,1),
 (35,'Bruneian',NULL,0,0,NULL,NULL,1),
 (36,'Bulgarian',NULL,0,0,NULL,NULL,1),
 (37,'Burkina Faso',NULL,0,0,NULL,NULL,1),
 (38,'Burkinan',NULL,0,0,NULL,NULL,1),
 (39,'Burmese',NULL,0,0,NULL,NULL,1),
 (40,'Burundian',NULL,0,0,NULL,NULL,1),
 (41,'Cambodia',NULL,0,0,NULL,NULL,1),
 (42,'Cambodian',NULL,0,0,NULL,NULL,1),
 (43,'Cameroonian',NULL,0,0,NULL,NULL,1),
 (44,'Canadian',NULL,0,0,NULL,NULL,1),
 (45,'Cape Verdean',NULL,0,0,NULL,NULL,1),
 (46,'Cayman Islands',NULL,0,0,NULL,NULL,1),
 (47,'Central African',NULL,0,0,NULL,NULL,1),
 (48,'Chadian',NULL,0,0,NULL,NULL,1),
 (49,'Channel Islands, not elsewhere specified',NULL,0,0,NULL,NULL,1),
 (50,'Chilean',NULL,0,0,NULL,NULL,1),
 (51,'China (Taiwan) [Taiwan Province of China]',NULL,0,0,NULL,NULL,1),
 (52,'Chinese',NULL,0,0,NULL,NULL,1),
 (53,'Citizen of Antigua and Barbuda',NULL,0,0,NULL,NULL,1),
 (54,'Citizen of Kiribati',NULL,0,0,NULL,NULL,1),
 (55,'Citizen of Madagascar',NULL,0,0,NULL,NULL,1),
 (56,'Citizen of Malaysia',NULL,0,0,NULL,NULL,1),
 (57,'Citizen of Niger',NULL,0,0,NULL,NULL,1),
 (58,'Citizen of Serbia',NULL,0,0,NULL,NULL,1),
 (59,'Citizen of United Arab Emirates',NULL,0,0,NULL,NULL,1),
 (60,'Citizen of Vanuatu',NULL,0,0,NULL,NULL,1),
 (61,'Citizen of the Dominican Republic',NULL,0,0,NULL,NULL,1),
 (62,'Colombian',NULL,0,0,NULL,NULL,1),
 (63,'Comoran',NULL,0,0,NULL,NULL,1),
 (64,'Congolese (DRC)',NULL,0,0,NULL,NULL,1),
 (65,'Congolese (PR)',NULL,0,0,NULL,NULL,1),
 (66,'Costa Rican',NULL,0,0,NULL,NULL,1),
 (67,'Croatian',NULL,0,0,NULL,NULL,1),
 (68,'Cuban',NULL,0,0,NULL,NULL,1),
 (69,'Cypriot (European Union)',NULL,0,0,NULL,NULL,1),
 (70,'Cypriot (Non-European Union)',NULL,0,0,NULL,NULL,1),
 (71,'Cyprus (Non-European Union)',NULL,0,0,NULL,NULL,1),
 (72,'Cyprus (Not otherwise specified)',NULL,0,0,NULL,NULL,1),
 (73,'Cyprus European Union',NULL,0,0,NULL,NULL,1),
 (74,'Cyprus, not otherwise specified',NULL,0,0,NULL,NULL,1),
 (75,'Czech',NULL,0,0,NULL,NULL,1),
 (76,'Czechoslovakia not otherwise specified',NULL,0,0,NULL,NULL,1),
 (77,'Danish',NULL,0,0,NULL,NULL,1),
 (78,'Djiboutian',NULL,0,0,NULL,NULL,1),
 (79,'Dominican',NULL,0,0,NULL,NULL,1),
 (80,'Dutch',NULL,0,0,NULL,NULL,1),
 (81,'East Timor (Timor Leste)',NULL,0,0,NULL,NULL,1),
 (82,'East Timorese',NULL,0,0,NULL,NULL,1),
 (83,'Ecuadorian',NULL,0,0,NULL,NULL,1),
 (84,'Egypt',NULL,0,0,NULL,NULL,1),
 (85,'Egyptian',NULL,0,0,NULL,NULL,1),
 (86,'England',NULL,0,0,NULL,NULL,1),
 (87,'Equatorial Guinean',NULL,0,0,NULL,NULL,1),
 (88,'Eritrea',NULL,0,0,NULL,NULL,1),
 (89,'Eritrean',NULL,0,0,NULL,NULL,1),
 (90,'Estonian',NULL,0,0,NULL,NULL,1),
 (91,'Ethiopian',NULL,0,0,NULL,NULL,1),
 (92,'Falkland Islands',NULL,0,0,NULL,NULL,1),
 (93,'Faroe Islands',NULL,0,0,NULL,NULL,1),
 (94,'Fijian',NULL,0,0,NULL,NULL,1),
 (95,'Finnish',NULL,0,0,NULL,NULL,1),
 (96,'French',NULL,0,0,NULL,NULL,1),
 (97,'French Guiana',NULL,0,0,NULL,NULL,1),
 (98,'French Polynesia',NULL,0,0,NULL,NULL,1),
 (99,'French West Indies',NULL,0,0,NULL,NULL,1),
 (100,'Gabonese',NULL,0,0,NULL,NULL,1),
 (101,'Gambian',NULL,0,0,NULL,NULL,1),
 (102,'Georgian',NULL,0,0,NULL,NULL,1),
 (103,'German',NULL,0,0,NULL,NULL,1),
 (104,'Ghanaian',NULL,0,0,NULL,NULL,1),
 (105,'Gibraltar',NULL,0,0,NULL,NULL,1),
 (106,'Greek',NULL,0,0,NULL,NULL,1),
 (107,'Greenlander',NULL,0,0,NULL,NULL,1),
 (108,'Grenadian',NULL,0,0,NULL,NULL,1),
 (109,'Guam',NULL,0,0,NULL,NULL,1),
 (110,'Guamanian',NULL,0,0,NULL,NULL,1),
 (111,'Guatemalan',NULL,0,0,NULL,NULL,1),
 (112,'Guernsey',NULL,0,0,NULL,NULL,1),
 (113,'Guinea-Bissau',NULL,0,0,NULL,NULL,1),
 (114,'Guinean',NULL,0,0,NULL,NULL,1),
 (115,'Guyanese',NULL,0,0,NULL,NULL,1),
 (116,'Haitian',NULL,0,0,NULL,NULL,1),
 (117,'Honduran',NULL,0,0,NULL,NULL,1),
 (118,'Hongkonger',NULL,0,0,NULL,NULL,1),
 (119,'Hungarian',NULL,0,0,NULL,NULL,1),
 (120,'Icelander',NULL,0,0,NULL,NULL,1),
 (121,'Indian',NULL,0,0,NULL,NULL,1),
 (122,'Indonesian',NULL,0,0,NULL,NULL,1),
 (123,'Iranian',NULL,0,0,NULL,NULL,1),
 (124,'Iraqi',NULL,0,0,NULL,NULL,1),
 (125,'Ireland',NULL,0,0,NULL,NULL,1),
 (126,'Irish',NULL,0,0,NULL,NULL,1),
 (127,'Isle of Man',NULL,0,0,NULL,NULL,1),
 (128,'Israeli',NULL,0,0,NULL,NULL,1),
 (129,'Italian',NULL,0,0,NULL,NULL,1),
 (130,'Ivorian',NULL,0,0,NULL,NULL,1),
 (131,'Jamaican',NULL,0,0,NULL,NULL,1),
 (132,'Japanese',NULL,0,0,NULL,NULL,1),
 (133,'Jersey',NULL,0,0,NULL,NULL,1),
 (134,'Jordanian',NULL,0,0,NULL,NULL,1),
 (135,'Kazakh',NULL,0,0,NULL,NULL,1),
 (136,'Kenyan',NULL,0,0,NULL,NULL,1),
 (137,'Kuwaiti',NULL,0,0,NULL,NULL,1),
 (138,'Kyrgyz',NULL,0,0,NULL,NULL,1),
 (139,'Lao',NULL,0,0,NULL,NULL,1),
 (140,'Latvian',NULL,0,0,NULL,NULL,1),
 (141,'Lebanese',NULL,0,0,NULL,NULL,1),
 (142,'Leeward Islands',NULL,0,0,NULL,NULL,1),
 (143,'Lesotho',NULL,0,0,NULL,NULL,1),
 (144,'Liberian',NULL,0,0,NULL,NULL,1),
 (145,'Libyan',NULL,0,0,NULL,NULL,1),
 (146,'Lichtensteiner',NULL,0,0,NULL,NULL,1),
 (147,'Lithuanian',NULL,0,0,NULL,NULL,1),
 (148,'Luxembourger',NULL,0,0,NULL,NULL,1),
 (149,'Macanese',NULL,0,0,NULL,NULL,1),
 (150,'Macedonia (Macedonia, Former Yugoslav Republic of)',NULL,0,0,NULL,NULL,1),
 (151,'Macedonia, The Former Yugoslav Republic of',NULL,0,0,NULL,NULL,1),
 (152,'Macedonian',NULL,0,0,NULL,NULL,1),
 (153,'Madagascar',NULL,0,0,NULL,NULL,1),
 (154,'Malawian',NULL,0,0,NULL,NULL,1),
 (155,'Malaya',NULL,0,0,NULL,NULL,1),
 (156,'Maldivian',NULL,0,0,NULL,NULL,1),
 (157,'Malian',NULL,0,0,NULL,NULL,1),
 (158,'Maltese',NULL,0,0,NULL,NULL,1),
 (159,'Marshall Islander',NULL,0,0,NULL,NULL,1),
 (160,'Mauritanian',NULL,0,0,NULL,NULL,1),
 (161,'Mauritian',NULL,0,0,NULL,NULL,1),
 (162,'Mayotte',NULL,0,0,NULL,NULL,1),
 (163,'Mexican',NULL,0,0,NULL,NULL,1),
 (164,'Micronesian',NULL,0,0,NULL,NULL,1),
 (165,'Moldovan',NULL,0,0,NULL,NULL,1),
 (166,'Monegasque',NULL,0,0,NULL,NULL,1),
 (167,'Mongolian',NULL,0,0,NULL,NULL,1),
 (168,'Montenegro',NULL,0,0,NULL,NULL,1),
 (169,'Montserrat',NULL,0,0,NULL,NULL,1),
 (170,'Moroccan',NULL,0,0,NULL,NULL,1),
 (171,'Mozambican',NULL,0,0,NULL,NULL,1),
 (172,'Namibian',NULL,0,0,NULL,NULL,1),
 (173,'Nauruan',NULL,0,0,NULL,NULL,1),
 (174,'Nepalese',NULL,0,0,NULL,NULL,1),
 (175,'Netherlands Antilles',NULL,0,0,NULL,NULL,1),
 (176,'New Caledonia',NULL,0,0,NULL,NULL,1),
 (177,'New Guinea',NULL,0,0,NULL,NULL,1),
 (178,'New Zealander',NULL,0,0,NULL,NULL,1),
 (179,'Nicaraguan',NULL,0,0,NULL,NULL,1),
 (180,'Nigerian',NULL,0,0,NULL,NULL,1),
 (181,'North Korean',NULL,0,0,NULL,NULL,1),
 (182,'Northern Mariana Islands',NULL,0,0,NULL,NULL,1),
 (183,'Norwegian',NULL,0,0,NULL,NULL,1),
 (184,'Not Known',NULL,0,0,NULL,NULL,1),
 (185,'Omani',NULL,0,0,NULL,NULL,1),
 (186,'Pakistani',NULL,0,0,NULL,NULL,1),
 (187,'Palau',NULL,0,0,NULL,NULL,1),
 (188,'Panama',NULL,0,0,NULL,NULL,1),
 (189,'Panamanian',NULL,0,0,NULL,NULL,1),
 (190,'Papua New Guinean',NULL,0,0,NULL,NULL,1),
 (191,'Paraguayan',NULL,0,0,NULL,NULL,1),
 (192,'Peruvian',NULL,0,0,NULL,NULL,1),
 (193,'Philippine',NULL,0,0,NULL,NULL,1),
 (194,'Pitcairn Islands',NULL,0,0,NULL,NULL,1),
 (195,'Polish',NULL,0,0,NULL,NULL,1),
 (196,'Portuguese',NULL,0,0,NULL,NULL,1),
 (197,'Portuguese West Africa',NULL,0,0,NULL,NULL,1),
 (198,'Puerto Rico',NULL,0,0,NULL,NULL,1),
 (199,'Qatari',NULL,0,0,NULL,NULL,1),
 (200,'Reunion',NULL,0,0,NULL,NULL,1),
 (201,'Romanian',NULL,0,0,NULL,NULL,1),
 (202,'Russian',NULL,0,0,NULL,NULL,1),
 (203,'Rwandan',NULL,0,0,NULL,NULL,1),
 (204,'Sabah',NULL,0,0,NULL,NULL,1),
 (205,'Salvadorean',NULL,0,0,NULL,NULL,1),
 (206,'Samoan',NULL,0,0,NULL,NULL,1),
 (207,'San Marino',NULL,0,0,NULL,NULL,1),
 (208,'Sao Tome and Principe',NULL,0,0,NULL,NULL,1),
 (209,'Sarawak',NULL,0,0,NULL,NULL,1),
 (210,'Saudi Arabian',NULL,0,0,NULL,NULL,1),
 (211,'Senegalese',NULL,0,0,NULL,NULL,1),
 (212,'Serbia',NULL,0,0,NULL,NULL,1),
 (213,'Serbia and Montenegro not otherwise specified',NULL,0,0,NULL,NULL,1),
 (214,'Seychelles',NULL,0,0,NULL,NULL,1),
 (215,'Sierra Leone',NULL,0,0,NULL,NULL,1),
 (216,'Sikkim',NULL,0,0,NULL,NULL,1),
 (217,'Singaporean',NULL,0,0,NULL,NULL,1),
 (218,'Slovak',NULL,0,0,NULL,NULL,1),
 (219,'Slovenian',NULL,0,0,NULL,NULL,1),
 (220,'Solomon Islands',NULL,0,0,NULL,NULL,1),
 (221,'Somali',NULL,0,0,NULL,NULL,1),
 (222,'Somalia',NULL,0,0,NULL,NULL,1),
 (223,'South African',NULL,0,0,NULL,NULL,1),
 (224,'South Georgia and the South Sandwich Islands',NULL,0,0,NULL,NULL,1),
 (225,'South Korean',NULL,0,0,NULL,NULL,1),
 (226,'Spanish',NULL,0,0,NULL,NULL,1),
 (227,'Sri Lankan',NULL,0,0,NULL,NULL,1),
 (228,'St Helena',NULL,0,0,NULL,NULL,1),
 (229,'St Kitts and Nevis',NULL,0,0,NULL,NULL,1),
 (230,'St Lucia',NULL,0,0,NULL,NULL,1),
 (231,'St Vincent',NULL,0,0,NULL,NULL,1),
 (232,'Stateless',NULL,0,0,NULL,NULL,1),
 (233,'Sudanese',NULL,0,0,NULL,NULL,1),
 (234,'Surinamese',NULL,0,0,NULL,NULL,1),
 (235,'Swazi',NULL,0,0,NULL,NULL,1),
 (236,'Swedish',NULL,0,0,NULL,NULL,1),
 (237,'Swiss',NULL,0,0,NULL,NULL,1),
 (238,'Syrian',NULL,0,0,NULL,NULL,1),
 (239,'Taiwanese',NULL,0,0,NULL,NULL,1),
 (240,'Tajik',NULL,0,0,NULL,NULL,1),
 (241,'Tanzanian',NULL,0,0,NULL,NULL,1),
 (242,'Thai',NULL,0,0,NULL,NULL,1),
 (243,'Tibet',NULL,0,0,NULL,NULL,1),
 (244,'Togolese',NULL,0,0,NULL,NULL,1),
 (245,'Tongan',NULL,0,0,NULL,NULL,1),
 (246,'Trinidad and Tobago',NULL,0,0,NULL,NULL,1),
 (247,'Tunisian',NULL,0,0,NULL,NULL,1),
 (248,'Turkish',NULL,0,0,NULL,NULL,1),
 (249,'Turkmen',NULL,0,0,NULL,NULL,1),
 (250,'Turks and Caicos Islands',NULL,0,0,NULL,NULL,1),
 (251,'Tuvaluan',NULL,0,0,NULL,NULL,1),
 (252,'USSR (not otherwise specified)',NULL,0,0,NULL,NULL,1),
 (253,'Ugandan',NULL,0,0,NULL,NULL,1),
 (254,'Ukrainian',NULL,0,0,NULL,NULL,1),
 (255,'Union of Soviet Socialist Republic not otherwise',NULL,0,0,NULL,NULL,1),
 (256,'United Kingdom',NULL,0,0,NULL,NULL,1),
 (257,'United States citizen',NULL,0,0,NULL,NULL,1),
 (258,'Uruguayan',NULL,0,0,NULL,NULL,1),
 (259,'Uzbek',NULL,0,0,NULL,NULL,1),
 (260,'Vatican City [Holy See (Vatican City State)]',NULL,0,0,NULL,NULL,1),
 (261,'Venezuelan',NULL,0,0,NULL,NULL,1),
 (262,'Vietnamese',NULL,0,0,NULL,NULL,1),
 (263,'Virgin Islands (US)',NULL,0,0,NULL,NULL,1),
 (264,'West Bank, Gaza Strip incl East Jerusalem',NULL,0,0,NULL,NULL,1),
 (265,'West Indies',NULL,0,0,NULL,NULL,1),
 (266,'Western Sahara',NULL,0,0,NULL,NULL,1),
 (267,'Windward Islands',NULL,0,0,NULL,NULL,1),
 (268,'Yemen Ar',NULL,0,0,NULL,NULL,1),
 (269,'Yemeni',NULL,0,0,NULL,NULL,1),
 (270,'Zambian',NULL,0,0,NULL,NULL,1),
 (271,'Zimbabwean',NULL,0,0,NULL,NULL,1);
/*!40000 ALTER TABLE "nationalities" ENABLE KEYS */;


--
-- Definition of table "response_elements"
--
CREATE TABLE "response_elements" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "response_id" int(10) unsigned NOT NULL,
  "element_id" int(10) unsigned NOT NULL,
  "element_value" text NOT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_response_elements_1" ("response_id"),
  KEY "FK_response_elements_2" ("element_id"),
  CONSTRAINT "FK_response_elements_1" FOREIGN KEY ("response_id") REFERENCES "responses" ("id"),
  CONSTRAINT "FK_response_elements_2" FOREIGN KEY ("element_id") REFERENCES "elements" ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "response_elements"
--

/*!40000 ALTER TABLE "response_elements" DISABLE KEYS */;
/*!40000 ALTER TABLE "response_elements" ENABLE KEYS */;


--
-- Definition of table "responses"
--
CREATE TABLE "responses" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "customer_id" int(10) unsigned NOT NULL,
  "user_id" int(10) unsigned NOT NULL,
  "template_id" int(10) unsigned NOT NULL,
  "received_on" datetime NOT NULL,
  "mailer_id" int(10) unsigned DEFAULT NULL,
  "ip_address" varchar(25) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "responses"
--

/*!40000 ALTER TABLE "responses" DISABLE KEYS */;
/*!40000 ALTER TABLE "responses" ENABLE KEYS */;


--
-- Definition of table "roles"
--
CREATE TABLE "roles" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(100) DEFAULT NULL,
  "desc" varchar(200) DEFAULT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(2) DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=6;

--
-- Dumping data for table "roles"
--

/*!40000 ALTER TABLE "roles" DISABLE KEYS */;
INSERT INTO "roles" ("id","name","desc","created_by","modified_by","created_on","modified_on","is_active") VALUES 
 (1,'System Administration','System Administration',2,2,'2010-03-10','2010-03-10',1),
 (2,'User Manager','User Management',2,2,'2010-03-10','2010-03-10',1),
 (3,'Template Manager','Template Management',2,2,'2010-03-10','2010-03-10',1),
 (4,'Contact Manager','Contacts Management',2,2,'2010-03-10','2010-03-10',1),
 (5,'Mail Manager','Mail Manager',2,2,'2010-03-10','2010-03-10',1);
/*!40000 ALTER TABLE "roles" ENABLE KEYS */;


--
-- Definition of table "roles_tasks"
--
CREATE TABLE "roles_tasks" (
  "role_id" int(11) NOT NULL DEFAULT '0',
  "sub_menu_id" int(11) unsigned NOT NULL,
  "desc" varchar(200) DEFAULT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(2) DEFAULT NULL,
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY ("id"),
  KEY "ROLE_TASK" ("role_id","sub_menu_id"),
  KEY "FK_TASK_SUBMENU" ("sub_menu_id"),
  CONSTRAINT "FK_ROLE_MASTER" FOREIGN KEY ("role_id") REFERENCES "roles" ("id"),
  CONSTRAINT "FK_SUBMENU" FOREIGN KEY ("sub_menu_id") REFERENCES "submenus" ("id")
) TYPE=InnoDB AUTO_INCREMENT=59 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "roles_tasks"
--

/*!40000 ALTER TABLE "roles_tasks" DISABLE KEYS */;
INSERT INTO "roles_tasks" ("role_id","sub_menu_id","desc","created_by","modified_by","created_on","modified_on","is_active","id") VALUES 
 (1,1,NULL,2,2,NULL,NULL,1,1),
 (1,5,NULL,2,2,NULL,NULL,1,5),
 (1,6,NULL,2,2,NULL,NULL,1,6),
 (1,8,NULL,2,2,NULL,NULL,1,8),
 (1,9,NULL,2,2,NULL,NULL,1,9),
 (1,11,NULL,2,2,NULL,NULL,1,11),
 (3,8,NULL,2,2,NULL,NULL,1,16),
 (3,9,NULL,2,2,NULL,NULL,1,17),
 (4,5,NULL,2,2,NULL,NULL,1,19),
 (4,6,NULL,2,2,NULL,NULL,1,20),
 (1,7,NULL,2,2,NULL,NULL,1,21),
 (5,1,NULL,2,2,NULL,NULL,1,22),
 (5,7,NULL,2,2,NULL,NULL,1,24),
 (5,11,NULL,2,2,NULL,NULL,1,26),
 (1,14,NULL,2,2,NULL,NULL,1,27),
 (5,14,NULL,2,2,NULL,NULL,1,28),
 (5,15,NULL,2,2,NULL,NULL,1,29),
 (5,16,NULL,2,2,NULL,NULL,1,30),
 (5,17,NULL,2,2,NULL,NULL,1,31),
 (1,15,NULL,2,2,NULL,NULL,1,32),
 (1,16,NULL,2,2,NULL,NULL,1,33),
 (1,17,NULL,2,2,NULL,NULL,1,34),
 (1,18,NULL,2,2,NULL,NULL,1,35),
 (1,19,NULL,2,2,NULL,NULL,1,36),
 (1,20,NULL,2,2,NULL,NULL,1,37),
 (1,21,NULL,2,2,NULL,NULL,1,38),
 (1,22,NULL,2,2,NULL,NULL,1,39),
 (5,18,NULL,2,2,NULL,NULL,1,40),
 (5,19,NULL,2,2,NULL,NULL,1,41),
 (5,20,NULL,2,2,NULL,NULL,1,42),
 (5,21,NULL,2,2,NULL,NULL,1,43),
 (5,22,NULL,2,2,NULL,NULL,1,44),
 (5,23,NULL,2,2,NULL,NULL,1,45),
 (1,23,NULL,2,2,NULL,NULL,1,46),
 (1,24,NULL,2,2,NULL,NULL,1,47),
 (5,24,NULL,2,2,NULL,NULL,1,49),
 (1,27,NULL,2,2,NULL,NULL,1,53),
 (1,28,NULL,2,2,NULL,NULL,1,54),
 (5,27,NULL,2,2,NULL,NULL,1,56),
 (5,28,NULL,2,2,NULL,NULL,1,57);
/*!40000 ALTER TABLE "roles_tasks" ENABLE KEYS */;


--
-- Definition of table "status_master"
--
CREATE TABLE "status_master" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "status_name" varchar(45) NOT NULL,
  "status_desc" varchar(100) DEFAULT NULL,
  "status_type_id" varchar(45) NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "modified_on" datetime DEFAULT NULL,
  "is_active" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=15;

--
-- Dumping data for table "status_master"
--

/*!40000 ALTER TABLE "status_master" DISABLE KEYS */;
INSERT INTO "status_master" ("id","status_name","status_desc","status_type_id","created_by","created_on","modified_by","modified_on","is_active") VALUES 
 (1,'Delivery Scheduled','Scheduled For Delivery','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (2,'Delivery In Progress','Processing the mail','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (3,'Delivery Completed','Mail is now sent to the contact','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (4,'Delivery Failed','Could not send mail due to various reasons','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (5,'Mail Read','Mail is read by the receiver','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (6,'Responded To Mail','Response received','100',2,'2010-03-01 00:00:00',2,NULL,1),
 (7,'Subscription Confirmed','Contact - Confirmed account creation','800',2,'2010-03-01 00:00:00',2,NULL,1),
 (8,'Subscription Unconfirmed','Contact - Has not confirmed account creation yet','800',2,'2010-03-01 00:00:00',2,NULL,1),
 (9,'Active EMail','Email is active. ','900',2,'2010-03-01 00:00:00',2,NULL,1),
 (10,'Bounced EMail','Email is bounced.','900',2,'2010-03-01 00:00:00',2,NULL,1),
 (11,'Unsubscribed','Email has been unsubscribed from mailing list','900',2,'2010-03-01 00:00:00',2,NULL,1),
 (12,'Two Way Opt-In','1) Customer signs up for news letter \r\n2) System Sends Activation mail and \r\n3) User has to confirm ','1000',2,'2010-03-01 00:00:00',2,NULL,1),
 (13,'Opt-In','1) Customer signs up for news letter \r\n2) System immediately marks as confirmed','1000',2,'2010-03-01 00:00:00',2,NULL,1),
 (14,'Managed by admin','1) Administrator marks/ unmarks contact as subscribed/unsubscribed','1000',2,'2010-03-01 00:00:00',2,NULL,1);
/*!40000 ALTER TABLE "status_master" ENABLE KEYS */;


--
-- Definition of table "status_type_master"
--
CREATE TABLE "status_type_master" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "type_name" varchar(45) NOT NULL,
  "type_desc" varchar(100) DEFAULT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "modified_on" datetime DEFAULT NULL,
  "is_active" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=1001;

--
-- Dumping data for table "status_type_master"
--

/*!40000 ALTER TABLE "status_type_master" DISABLE KEYS */;
INSERT INTO "status_type_master" ("id","type_name","type_desc","created_by","created_on","modified_by","modified_on","is_active") VALUES 
 (100,'MAIL_STATUS','Types of mail status',2,'2010-03-01 00:00:00',2,'2010-03-01 00:00:00',1),
 (200,'ACCOUNT_STATUS','Account status types',2,'2010-03-01 00:00:00',2,'2010-03-01 00:00:00',1),
 (800,'SUBSCRIPTION_STATUS','Contact created, confirmed, unconfirmed',2,'2010-03-01 00:00:00',2,'2010-03-01 00:00:00',1),
 (900,'EMAIL_STATUS','Active, Bounced, No Activity',2,'2010-03-01 00:00:00',2,'2010-03-01 00:00:00',1),
 (1000,'SUBSCRIPTION_TYPE','Two way opt-in, Opt-in, Direct Confirmation',2,'2010-03-01 00:00:00',2,'2010-03-01 00:00:00',1);
/*!40000 ALTER TABLE "status_type_master" ENABLE KEYS */;


--
-- Definition of table "submenus"
--
CREATE TABLE "submenus" (
  "id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "menu_id" int(11) DEFAULT NULL,
  "name" varchar(50) DEFAULT NULL,
  "label" varchar(200) DEFAULT NULL,
  "desc" varchar(500) DEFAULT NULL,
  "link" varchar(400) DEFAULT NULL,
  "created_by" int(11) DEFAULT NULL,
  "modified_by" int(11) DEFAULT NULL,
  "created_on" date DEFAULT NULL,
  "modified_on" date DEFAULT NULL,
  "is_active" int(11) DEFAULT NULL,
  "submenu_order" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=30 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "submenus"
--

/*!40000 ALTER TABLE "submenus" DISABLE KEYS */;
INSERT INTO "submenus" ("id","menu_id","name","label","desc","link","created_by","modified_by","created_on","modified_on","is_active","submenu_order") VALUES 
 (1,4,'sentMail','View mail delivery log','View Mail Delivery Log','/mailer.do?mx=viewSentMail&route=mailers/sentMail/sent',2,2,NULL,NULL,1,3),
 (2,4,'mailStatistics','How many have viewed and responded?','View Responses','/mailer.do?mx=showResponses&route=mailers/mailStatistics/view',2,2,NULL,NULL,1,3),
 (4,4,'showBlocker','<Strong>Block</Strong> sending or receiving mails to IP or EMail ','Allow Block Mails','/mailer.do?mx=showBlocker&route=mailers/blockMails/view',2,2,NULL,NULL,1,4),
 (5,2,'showCustomers','Show me list of all subscribers','View list of all subscribers','/customerController.do?mx=showCustomers&route=customers/showCustomers/showCustomers',2,2,NULL,NULL,1,2),
 (6,2,'createCustomer','Create a new subscriber','Create a new subscriber','/customerController.do?mx=newCustomer&route=customers/createCustomer/newCustomer',2,2,NULL,NULL,1,1),
 (7,2,'uploadCustomers','Upload subscribers from excel','Bulk Upload Contacts Using Excel','/customerController.do?mx=bulkUpload&route=customers/uploadCustomers/bulkUpload',2,2,NULL,NULL,1,3),
 (8,3,'viewTemplates','Show static mail templates','View Templates','/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=2',2,2,NULL,NULL,1,2),
 (9,3,'createTemplate','Create a new mail template','Create Template','/templates.do?mx=newTemplate&route=templates/createTemplate/new',2,2,NULL,NULL,1,1),
 (10,3,'uploadTemplates','Upload templates from my local disk','Upload Templates','/templates.do?mx=upload&route=templates/uploadTemplate/upload',2,2,NULL,NULL,1,3),
 (11,4,'composeMail','Compose a new mail','Send Mails','/mailer.do?mx=newMail&route=mailers/composeMail/new',2,2,NULL,NULL,1,1),
 (12,8,'viewUsers','Show me list of users','View All Users','/users.do?mx=showUsers&route=users/viewUsers/list',2,2,NULL,NULL,1,1),
 (13,8,'createUser','Create a new user','Create New User','/users.do?mx=newUser&route=users/createUser/new',2,2,NULL,NULL,1,2),
 (14,4,'showMailSchedule','View scheduled mails','View mail scheduler','/mailer.do?mx=viewScheduler&route=mailers/showMailSchedule/schedule',2,2,NULL,NULL,1,2),
 (15,9,'accountSettings','Configure my account','Account Profile Configuration','/settings.do?mx=accountSettings&route=settings/accountSettings/accountHome',2,2,NULL,NULL,1,1),
 (16,9,'emailSettings','Configure email profiles','Email Configuration','/settings.do?mx=emailSettings&route=settings/emailSettings/emailHome',2,2,NULL,NULL,1,2),
 (17,9,'generalSettings','General  application settings','General Settings','/settings.do?mx=generalSettings&route=settings/generalSettings/settingsHome',2,2,NULL,NULL,1,3),
 (18,10,'authentication','Authenticate subscription request','Sent to subscriber mail id requesting him to confirm his previous action','/autoResponders.do?mx=view&route=autoResponders/authentication/view&rid=2',2,2,NULL,NULL,1,2),
 (19,10,'confirmation','Confirmation of subscription','Confirmation and subscription activation message','/autoResponders.do?mx=view&route=autoResponders/confirmation/view&rid=3',2,2,NULL,NULL,1,3),
 (20,10,'requestCancellation','User requested to unsubscribe','User has requested to unsubscribe from mailing list','/autoResponders.do?mx=view&route=autoResponders/requestCancellation/view&rid=4',2,2,NULL,NULL,1,4),
 (21,10,'unsubscribed','Sucessfully Unsubscribed ','Confirmation message that user has been sucessfuly unsubscribed.','/autoResponders.do?mx=view&route=autoResponders/unsubscribed/view&rid=5',2,2,NULL,NULL,1,5),
 (22,10,'subscription','Immediately after signup','Just a thank you message for subscribing and Intimation that a mail is sent to him.','/autoResponders.do?mx=view&route=autoResponders/subscription/view&rid=1',2,2,NULL,NULL,1,1),
 (23,3,'viewDynamicTemplates','Show dynamic mail templates','View Dynamic Email Templates','/templates.do?mx=showTemplates&route=templates/viewDynamicTemplates/view&typeId=1',2,2,NULL,NULL,1,3),
 (24,2,'createSubscriptionForm','Create custom subscription form','Create subscription form. You can use the code to be displayed on your website','/subscriptions.do?mx=newForm&route=customers/createSubscriptionForm/new',2,2,NULL,NULL,1,5),
 (25,2,'viewSubscriptionForms','View subscription forms','View subscriptions forms','/subscriptions.do?mx=newForm&route=customers/viewSubscriptionForms/list',2,2,NULL,NULL,1,6),
 (26,2,'listManagementOld','Manage subscriber lists and groups','Manage subscriber lists','/customerController.do?mx=lists&route=customers/listManagement/view',2,2,NULL,NULL,0,4),
 (27,11,'listManagement','View and manage lists','Manage Lists','/lists.do?mx=view&route=lists/listManagement/view',2,2,NULL,NULL,1,1),
 (28,11,'createList','Create a new mailing list','Create new mailing list','/lists.do?mx=newList&route=lists/createList/new',2,2,NULL,NULL,1,2),
 (29,11,'createForms','Create forms and response emails','Create forms for your website and auto response emails','/lists.do?mx=webForms&route=lists/createForms/view',2,2,NULL,NULL,1,3);
/*!40000 ALTER TABLE "submenus" ENABLE KEYS */;


--
-- Definition of table "templates"
--
CREATE TABLE "templates" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "name" varchar(45) NOT NULL,
  "content" text NOT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "is_dynamic" int(2) unsigned DEFAULT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=162 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "templates"
--

/*!40000 ALTER TABLE "templates" DISABLE KEYS */;
INSERT INTO "templates" ("id","user_id","name","content","created_on","created_by","modified_on","modified_by","is_active","is_dynamic") VALUES 
 (10,3,'Feedback Form - New Blue','<div class=\"Section1\">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:37.1pt;border-collapse:collapse\">\r\n		<tbody>\r\n			<tr style=\"height:19.85pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:solid #3161A1 1.0pt;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:none;border-right:solid #3161A1 2.25pt;\r\n  padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:24.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n  color:black\">Thanks for visiting us</span></b><b><span style=\"font-size:6.0pt;\r\n  font-family:&quot;Trebuchet MS&quot;;color:black\">&nbsp;</span></b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:36.0pt\">\r\n				<td colspan=\"2\" style=\"width:324.75pt;border:none;\r\n  border-left:solid #3161A1 2.25pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n  height:36.0pt\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:13.0pt;font-family:&quot;Trebuchet MS&quot;\">Dear Customer,</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:14.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family:&quot;Trebuchet MS&quot;\">Thank you for using our service department recently.</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family:&quot;Trebuchet MS&quot;\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us.</span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;border:none;border-right:solid #27458D 2.25pt;\r\n  background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;height:36.0pt\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:380.9pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:none;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:solid #3161A1 1.0pt;\r\n  border-right:solid #3161A1 2.25pt;padding:0cm 5.4pt 0cm 5.4pt;height:380.9pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:31.75pt;border-collapse:collapse\">\r\n						<tbody>\r\n							<tr style=\"height:21.25pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:21.25pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<span style=\"font-size:1.0pt;color:#999999\">&nbsp;</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Excellent</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Good</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Average</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Poor</span></b></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:25.55pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:25.55pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Were our staff helpful and courteous?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:27.35pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:27.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Was the work carried out to your satisfaction?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:26.35pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:26.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">How was the explanation of invoice and work carried out?</span></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Is there anything that you can suggest that will help us to improve on our service?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"serviceComments\" rows=\"5\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Do you require any further information or help?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"helpComments\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Name </span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"customerName\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Registration Number</span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"regNumber\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"submit\" type=\"SUBMIT\" value=\"Send Feedback\" /></span></p>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"width:52.5pt;padding:0cm 0cm 0cm 0cm\" width=\"70\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:272.25pt;padding:0cm 0cm 0cm 0cm\" width=\"363\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;padding:0cm 0cm 0cm 0cm\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr height=\"0\">\r\n				<td style=\"border:none\" width=\"70\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"363\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"263\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n</div>\r\n','2009-11-27 15:36:20',3,'2009-11-27 15:36:20',3,1,1),
 (11,3,'TEST Template','<p>\r\n	<span style=\"color:#f00;\"><strong>HELLO THERE,</strong></span></p>\r\n<p>\r\n	<strong><br />\r\n	</strong></p>\r\n<p>\r\n	<strong>HAPPY CHRISTMAS TO YOU...&nbsp;</strong></p>\r\n','2009-12-09 10:45:43',3,'2009-12-09 10:45:43',3,1,0),
 (12,3,'HORDERNS FEEDBACK FORM','<div class=\"Section1\">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:37.1pt;border-collapse:collapse\">\r\n		<tbody>\r\n			<tr style=\"height:19.85pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:solid #3161A1 1.0pt;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:none;border-right:solid #3161A1 2.25pt;\r\n  padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:18.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n  color:black\"><img src=\"http://217.34.114.33:8080/feedbacks/images/horderns.png\" style=\"align:left\" /> HORDERNS MOTOR HOUSE LTD </span></b><b><span style=\"font-size:6.0pt;\r\n  font-family:&quot;Trebuchet MS&quot;;color:black\">&nbsp;</span></b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:36.0pt\">\r\n				<td colspan=\"2\" style=\"width:324.75pt;border:none;\r\n  border-left:solid #3161A1 2.25pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n  height:36.0pt\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:13.0pt;font-family:&quot;Trebuchet MS&quot;\">Dear Customer,</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:14.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family:&quot;Trebuchet MS&quot;\">Thank you for using our service department recently.</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family:&quot;Trebuchet MS&quot;\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us.</span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;border:none;border-right:solid #27458D 2.25pt;\r\n  background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;height:36.0pt\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:380.9pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:none;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:solid #3161A1 1.0pt;\r\n  border-right:solid #3161A1 2.25pt;padding:0cm 5.4pt 0cm 5.4pt;height:380.9pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:31.75pt;border-collapse:collapse\">\r\n						<tbody>\r\n							<tr style=\"height:21.25pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:21.25pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<span style=\"font-size:1.0pt;color:#999999\">&nbsp;</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Excellent</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Good</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Average</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Poor</span></b></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:25.55pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:25.55pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Were our staff helpful and courteous?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:27.35pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:27.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Was the work carried out to your satisfaction?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:26.35pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:26.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">How was the explanation of invoice and work carried out?</span></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Is there anything that you can suggest that will help us to improve on our service?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"serviceComments\" rows=\"5\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Do you require any further information or help?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"helpComments\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Name </span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"customerName\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Registration Number</span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"regNumber\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"submit\" type=\"SUBMIT\" value=\"Send Feedback\" /></span></p>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"width:52.5pt;padding:0cm 0cm 0cm 0cm\" width=\"70\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:272.25pt;padding:0cm 0cm 0cm 0cm\" width=\"363\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;padding:0cm 0cm 0cm 0cm\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr height=\"0\">\r\n				<td style=\"border:none\" width=\"70\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"363\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"263\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n</div>\r\n','2009-12-11 15:19:35',3,'2009-12-11 15:19:35',3,1,1),
 (18,4,'Feedback System Intro','<p>\r\n	<br />\r\n	<img alt=\"Logo\" height=\"136\" src=\"http://217.34.114.33:8080/feedbacks/images/sseurope_logo.png\" width=\"426\" /></p>\r\n<div class=\"moz-signature\">\r\n	<div style=\"font-family: \'Trebuchet MS\',verdana,sans-serif; font-size: 12px; color: black; width: 745px;\">\r\n		<br />\r\n		Dear Dealer<br />\r\n		<b><br />\r\n		Re: AUTOMATED E-MAIL FOLLOW UP FOR YOUR SERVICE DEPARTMENT </b><br />\r\n		<br />\r\n		We have developed a product which will improve your process for dealing with customer follow up in your service department and improve your earnings from <b>PEUGEOT&#39;S CUSTOMER SATISFACTION REWARD PROGRAMME IN 2010 </b><br />\r\n		<br />\r\n		With the forthcoming introduction of e-mail questionnaires to your customers for the 2010 programme we have developed a simple <br />\r\n		automated e-mail system professional in appearance and quick for your customers to complete. This creates a time and cost effective method of contact for your customers and correspond with the customers most likely to respond <br />\r\n		to Peugeot&#39;s own questionnaires. The questionnaires sent and received can&nbsp; be tailored to your dealership giving them a professional bespoke appearance as well as giving you valuable feedback in a way which is less intrusive than a telephone <br />\r\n		call. <br />\r\n		<br />\r\n		Quoting Simon Coley Dealer Principal of Horderns <br />\r\n		<br />\r\n		<i><b>&quot;The e-mail system has proved a very cost effective way of handling customer feedback, It has also saved time for Customer Advisors. We have seen our percentage score for service feedback increase which should improve again when Peugeot change to similar contact method&quot;<br />\r\n		</b></i><br />\r\n		Our e-mail service applications start from as little as &pound;199 subject to specification..<br />\r\n		<br />\r\n		So if you are interested in an effective system that saves time and increases efficiency contact our sales dept or speak to Alex Novacki on 0161 368 9009<br />\r\n		<br />\r\n		Alex Novacki<br />\r\n		Managing Director <br />\r\n		<br />\r\n		<a href=\"http://www.softwaresystemseurope.com/\">Visit Our Website</a> | Tel: +44 (0)161 368 9009 | Fax: +44 (0)161 368 9119</div>\r\n	<div style=\"font-family: \'Trebuchet MS\',verdana,sans-serif; font-size: 12px; color: black; width: 745px;\">\r\n		Software Systems Europe Ltd, Systems House, D7 Newton Business Park, Talbot Road, Hyde, Cheshire, UK, SK14 4UQ</div>\r\n</div>\r\n','2010-01-12 11:17:54',4,'2010-01-12 11:17:54',4,1,0),
 (19,4,'TEST Template','<p>\r\n	Hello there</p>\r\n','2010-01-12 11:19:12',4,'2010-01-12 11:19:12',4,1,0),
 (21,1,'DEMO HORDERNS TEMPLATE','<div class=\"Section1\">\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:37.1pt;border-collapse:collapse\">\r\n		<tbody>\r\n			<tr style=\"height:19.85pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:solid #3161A1 1.0pt;\r\n                    border-left:solid #3161A1 2.25pt;border-bottom:none;border-right:solid #3161A1 2.25pt;\r\n                    padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:18.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n                            color:black\"><img src=\"http://217.34.114.33:8080/feedbacks/images/horderns.png\" style=\"align:left\" /> HORDERNS MOTOR HOUSE LTD </span> </b> <b> <span style=\"font-size:6.0pt;font-family:&quot;Trebuchet MS&quot;;color:black\"> &nbsp; </span> </b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:36.0pt\">\r\n				<td colspan=\"2\" style=\"width:324.75pt;border:none;\r\n                    border-left:solid #3161A1 2.25pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n                    height:36.0pt\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:13.0pt;font-family:&quot;Trebuchet MS&quot;\">Dear Customer, </span> </b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:14.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> </b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family:&quot;Trebuchet MS&quot;\">Thank you for using our service department recently. </span> </b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family:&quot;Trebuchet MS&quot;\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us. </span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;border:none;border-right:solid #27458D 2.25pt;\r\n                    background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;height:36.0pt\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:380.9pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:none;\r\n                    border-left:solid #3161A1 2.25pt;border-bottom:solid #3161A1 1.0pt;\r\n                    border-right:solid #3161A1 2.25pt;padding:0cm 5.4pt 0cm 5.4pt;height:380.9pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:31.75pt;border-collapse:collapse\">\r\n						<tbody>\r\n							<tr style=\"height:21.25pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:21.25pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<span style=\"font-size:1.0pt;color:#999999\">&nbsp; </span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n                                    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n                                            color:white\">Excellent </span> </b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n                                    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n                                            color:white\">Good </span> </b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n                                    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n                                            color:white\">Average </span> </b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n                                    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n                                            color:white\">Poor </span> </b></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:25.55pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n                                    padding:0cm 0cm 0cm 0cm;height:25.55pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Were our staff helpful and courteous? </span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:27.35pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n                                    padding:0cm 0cm 0cm 0cm;height:27.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Was the work carried out to your satisfaction? </span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:26.35pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:26.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">How was the explanation of invoice and work carried out? </span></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp; </span></p>\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Is there anything that you can suggest that will help us to improve on our service? </span> </b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"serviceComments\" rows=\"5\"> </textarea> </span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp; </span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Do you require any further information or help? </span> </b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"helpComments\"> </textarea> </span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp; </span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n                                    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Name </span> </b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n                                    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"customerName\" size=\"21\" type=\"TEXT\" /> </span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp; </span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n                                    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Registration Number </span> </b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n                                    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"regNumber\" size=\"21\" type=\"TEXT\" /> </span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n                                    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"submit\" type=\"SUBMIT\" value=\"Send Feedback\" /> </span></p>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"width:52.5pt;padding:0cm 0cm 0cm 0cm\" width=\"70\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:272.25pt;padding:0cm 0cm 0cm 0cm\" width=\"363\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;padding:0cm 0cm 0cm 0cm\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr height=\"0\">\r\n				<td style=\"border:none\" width=\"70\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"363\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"263\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n		<tbody>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','2010-01-15 15:35:57',1,'2010-01-15 15:35:57',1,1,1),
 (22,1,'Welcome Letter','<h1>\r\n	Welcome to Horderns Services</h1>\r\n<p>\r\n	Do you like our services &nbsp;<input name=\"DoYouLikeOurServices\" type=\"checkbox\" value=\"Like Your Services\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<input name=\"Submit\" type=\"submit\" value=\"Submit\" /></p>\r\n','2010-01-19 14:39:50',1,'2010-01-19 14:39:50',1,1,1),
 (23,1,'Tracking Template','<p>\r\n	Hi,</p>\r\n<p>\r\n	Your Name &nbsp;&nbsp;<input maxlength=\"40\" name=\"CustomerName\" size=\"40\" type=\"text\" /></p>\r\n<p>\r\n	Your Address&nbsp;<textarea cols=\"10\" name=\"CustomerAddress\" rows=\"5\" style=\"margin-left: 2px; margin-right: 2px; width: 266px; margin-top: 2px; margin-bottom: 2px; height: 84px; \"></textarea></p>\r\n<p>\r\n	Subscribe to news letters &nbsp;<input name=\"Newsletters\" type=\"checkbox\" value=\"Newsletters\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<input name=\"Submit\" type=\"submit\" value=\"Submit\" /></p>\r\n','2010-01-20 15:23:26',1,'2010-01-20 15:23:26',1,1,1),
 (53,8,'Dyna','<div class=\"Section1\">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse; margin-left: 37.1pt\">\r\n		<tbody>\r\n			<tr style=\"height: 19.85pt\">\r\n				<td colspan=\"3\" style=\"border-bottom: medium none; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 522pt; padding-right: 5.4pt; height: 19.85pt; border-top: #3161a1 1pt solid; border-right: #3161a1 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family: \'trebuchet ms\'; color: black; font-size: 18pt\"><img src=\"http://217.34.114.33:8080/feedbacks/images/horderns.png\" style=\"align: left\" /> HORDERNS MOTOR HOUSE LTD </span></b><b><span style=\"font-family: \'trebuchet ms\'; color: black; font-size: 6pt\">&nbsp;</span></b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height: 36pt\">\r\n				<td colspan=\"2\" style=\"border-bottom: medium none; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 324.75pt; padding-right: 5.4pt; background: #9cb9e1; height: 36pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family: \'trebuchet ms\'; font-size: 13pt\">Dear Customer,</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family: \'trebuchet ms\'; font-size: 14pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family: \'trebuchet ms\'\">Thank you for using our service department recently.</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family: \'trebuchet ms\'\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us.</span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"border-bottom: medium none; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; width: 197.25pt; padding-right: 5.4pt; background: #9cb9e1; height: 36pt; border-top: medium none; border-right: #27458d 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height: 380.9pt\">\r\n				<td colspan=\"3\" style=\"border-bottom: #3161a1 1pt solid; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 522pt; padding-right: 5.4pt; height: 380.9pt; border-top: medium none; border-right: #3161a1 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse; margin-left: 31.75pt\">\r\n						<tbody>\r\n							<tr style=\"height: 21.25pt\">\r\n								<td colspan=\"2\" style=\"padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; height: 21.25pt; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<span style=\"color: #999999; font-size: 1pt\">&nbsp;</span></p>\r\n								</td>\r\n								<td style=\"border-bottom: #27458d 2.25pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #27458d; height: 21.25pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; color: white; font-size: 10pt\">Excellent</span></b></p>\r\n								</td>\r\n								<td style=\"border-bottom: #27458d 2.25pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #27458d; height: 21.25pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; color: white; font-size: 10pt\">Good</span></b></p>\r\n								</td>\r\n								<td style=\"border-bottom: #27458d 2.25pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #27458d; height: 21.25pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; color: white; font-size: 10pt\">Average</span></b></p>\r\n								</td>\r\n								<td style=\"border-bottom: #27458d 2.25pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #27458d; height: 21.25pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; color: white; font-size: 10pt\">Poor</span></b></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 25.55pt\">\r\n								<td colspan=\"2\" style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; height: 25.55pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Were our staff helpful and courteous?</span></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 25.55pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q1\" type=\"checkbox\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 25.55pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q1\" type=\"checkbox\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 25.55pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q1\" type=\"checkbox\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 25.55pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q1\" type=\"checkbox\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 27.35pt\">\r\n								<td colspan=\"2\" style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; height: 27.35pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Was the work carried out to your satisfaction?</span></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 27.35pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q2\" type=\"checkbox\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 27.35pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q2\" type=\"checkbox\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 27.35pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q2\" type=\"checkbox\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border-bottom: silver 1pt solid; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 27.35pt; border-top: medium none; border-right: medium none; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q2\" type=\"checkbox\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 26.35pt\">\r\n								<td colspan=\"2\" style=\"padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; height: 26.35pt; padding-top: 0cm\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">How was the explanation of invoice and work carried out?</span></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 26.35pt; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q3\" type=\"checkbox\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 26.35pt; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q3\" type=\"checkbox\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 26.35pt; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q3\" type=\"checkbox\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 26.35pt; padding-top: 0cm\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\">\r\n										<input name=\"Q3\" type=\"checkbox\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 1pt\">\r\n								<td colspan=\"6\" style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 1pt; padding-top: 0cm\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">&nbsp;</span></p>\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Is there anything that you can suggest that will help us to improve on our service?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\"><textarea cols=\"45\" name=\"serviceComments\" rows=\"5\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 1pt\">\r\n								<td colspan=\"6\" style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; height: 1pt; padding-top: 0cm\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Do you require any further information or help?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\"><textarea cols=\"45\" name=\"helpComments\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 1pt\">\r\n								<td style=\"border-bottom: medium none; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; width: 126.05pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; border-top: medium none; border-right: white 1pt solid; padding-top: 0cm\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Name </span></b></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; width: 140.2pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; padding-top: 0cm\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\"><input name=\"customerName\" size=\"21\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; padding-top: 0cm\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height: 1pt\">\r\n								<td style=\"border-bottom: medium none; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; width: 126.05pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; border-top: medium none; border-right: white 1pt solid; padding-top: 0cm\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\">Registration Number</span></b></p>\r\n								</td>\r\n								<td style=\"padding-bottom: 0cm; padding-left: 5.4pt; width: 140.2pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; padding-top: 0cm\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\"><input name=\"regNumber\" size=\"21\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"padding-bottom: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; background: #9cb9e1; height: 1pt; padding-top: 0cm\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-family: \'trebuchet ms\'; font-size: 10pt\"><input name=\"submit\" type=\"submit\" value=\"Send Feedback\" /></span></p>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"padding-bottom: 0cm; padding-left: 0cm; width: 52.5pt; padding-right: 0cm; padding-top: 0cm\" width=\"70\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"padding-bottom: 0cm; padding-left: 0cm; width: 272.25pt; padding-right: 0cm; padding-top: 0cm\" width=\"363\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"padding-bottom: 0cm; padding-left: 0cm; width: 197.25pt; padding-right: 0cm; padding-top: 0cm\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr height=\"0\">\r\n				<td style=\"border-bottom: medium none; border-left: medium none; border-top: medium none; border-right: medium none\" width=\"70\">\r\n					&nbsp;</td>\r\n				<td style=\"border-bottom: medium none; border-left: medium none; border-top: medium none; border-right: medium none\" width=\"363\">\r\n					&nbsp;</td>\r\n				<td style=\"border-bottom: medium none; border-left: medium none; border-top: medium none; border-right: medium none\" width=\"263\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n</div>\r\n','2010-02-20 09:46:53',8,'2010-02-20 09:46:53',8,1,1),
 (55,9,'Joomlaxi Captcha','<div class=\"Section1\">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:37.1pt;border-collapse:collapse\">\r\n		<tbody>\r\n			<tr style=\"height:19.85pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:solid #3161A1 1.0pt;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:none;border-right:solid #3161A1 2.25pt;\r\n  padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:18.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n  color:black\"><img src=\"http://217.34.114.33:8080/feedbacks/images/horderns.png\" style=\"align:left\" /> HORDERNS MOTOR HOUSE LTD </span></b><b><span style=\"font-size:6.0pt;\r\n  font-family:&quot;Trebuchet MS&quot;;color:black\">&nbsp;</span></b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:36.0pt\">\r\n				<td colspan=\"2\" style=\"width:324.75pt;border:none;\r\n  border-left:solid #3161A1 2.25pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n  height:36.0pt\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:13.0pt;font-family:&quot;Trebuchet MS&quot;\">Dear Customer,</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-size:14.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family:&quot;Trebuchet MS&quot;\">Thank you for using our service department recently.</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family:&quot;Trebuchet MS&quot;\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us.</span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;border:none;border-right:solid #27458D 2.25pt;\r\n  background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;height:36.0pt\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height:380.9pt\">\r\n				<td colspan=\"3\" style=\"width:522.0pt;border-top:none;\r\n  border-left:solid #3161A1 2.25pt;border-bottom:solid #3161A1 1.0pt;\r\n  border-right:solid #3161A1 2.25pt;padding:0cm 5.4pt 0cm 5.4pt;height:380.9pt\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"margin-left:31.75pt;border-collapse:collapse\">\r\n						<tbody>\r\n							<tr style=\"height:21.25pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:21.25pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<span style=\"font-size:1.0pt;color:#999999\">&nbsp;</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Excellent</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Good</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Average</span></b></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid #27458D 2.25pt;\r\n    background:#27458D;padding:0cm 5.4pt 0cm 5.4pt;height:21.25pt\" valign=\"bottom\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;;\r\n    color:white\">Poor</span></b></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:25.55pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:25.55pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Were our staff helpful and courteous?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:25.55pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q1\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:27.35pt\">\r\n								<td colspan=\"2\" style=\"border:none;border-bottom:solid silver 1.0pt;\r\n    padding:0cm 0cm 0cm 0cm;height:27.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Was the work carried out to your satisfaction?</span></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"border:none;border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:27.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q2\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:26.35pt\">\r\n								<td colspan=\"2\" style=\"padding:0cm 0cm 0cm 0cm;height:26.35pt\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">How was the explanation of invoice and work carried out?</span></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Excellent\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Good\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Average\" /></p>\r\n								</td>\r\n								<td style=\"padding:0cm 5.4pt 0cm 5.4pt;height:26.35pt\">\r\n									<p align=\"center\" class=\"MsoNormal\" style=\"text-align:center\">\r\n										<input name=\"Q3\" type=\"CHECKBOX\" value=\"Poor\" /></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Is there anything that you can suggest that will help us to improve on our service?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"serviceComments\" rows=\"5\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td colspan=\"6\" style=\"padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Do you require any further information or help?</span></b></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><textarea cols=\"45\" name=\"helpComments\"></textarea></span></p>\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Name </span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"customerName\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">&nbsp;</span></p>\r\n								</td>\r\n							</tr>\r\n							<tr style=\"height:1.0pt\">\r\n								<td style=\"width:126.05pt;border:none;border-right:\r\n    solid white 1.0pt;background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\" width=\"168\">\r\n									<p class=\"MsoNormal\">\r\n										<b><span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\">Registration Number</span></b></p>\r\n								</td>\r\n								<td style=\"width:140.2pt;background:#9CB9E1;\r\n    padding:0cm 5.4pt 0cm 5.4pt;height:1.0pt\" valign=\"top\" width=\"187\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"regNumber\" size=\"21\" type=\"TEXT\" /></span></p>\r\n								</td>\r\n								<td colspan=\"4\" style=\"background:#9CB9E1;padding:0cm 5.4pt 0cm 5.4pt;\r\n    height:1.0pt\" valign=\"top\">\r\n									<p class=\"MsoNormal\">\r\n										<span style=\"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;\"><input name=\"submit\" type=\"SUBMIT\" value=\"Send Feedback\" /></span></p>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"width:52.5pt;padding:0cm 0cm 0cm 0cm\" width=\"70\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:272.25pt;padding:0cm 0cm 0cm 0cm\" width=\"363\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"width:197.25pt;padding:0cm 0cm 0cm 0cm\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr height=\"0\">\r\n				<td style=\"border:none\" width=\"70\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"363\">\r\n					&nbsp;</td>\r\n				<td style=\"border:none\" width=\"263\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n</div>\r\n','2010-02-20 20:55:48',9,'2010-02-20 20:55:48',9,1,1),
 (56,8,'FEEDBACK NEW','<p>\r\n	Name <input name=\"uname\" type=\"text\" /></p>\r\n<p>\r\n	comments <textarea name=\"comm\"></textarea></p>\r\n<p>\r\n	<input name=\"chk1\" type=\"checkbox\" value=\"yes\" /></p>\r\n','2010-02-26 10:17:34',8,'2010-02-26 10:17:34',8,1,1);
INSERT INTO "templates" ("id","user_id","name","content","created_on","created_by","modified_on","modified_by","is_active","is_dynamic") VALUES 
 (62,8,'How is our service??','<p>\r\n	Just another simple message for testing.</p>\r\n','2010-02-28 16:27:57',8,'2010-02-28 16:27:57',8,1,0),
 (67,8,'Christmas Greeting 1','<p>\r\n	<img align=\"absMiddle\" alt=\"Christmas Deers\" height=\"450\" src=\"http://localhost:8080/beyondcontact/images/userdata/santa-christmas-deers.jpg\" width=\"600\" /></p>\r\n','2010-04-13 20:46:52',8,'2010-04-13 20:46:52',8,1,0),
 (71,23,'My New Template','<p>\r\n	Hi&nbsp;Field:FirstName,&nbsp;Field:LastName</p>\r\n<p>\r\n	BeyondContact is not a re-engineered, previous-generation BulkMail application.&nbsp;</p>\r\n<p>\r\n	It was designed from the ground up to be part of &nbsp;&ldquo;daily&rdquo; business life. The Beyond Contact&nbsp;combines Web 2.0 power and ease of use in a secure, enterprise-ready platform. Whether you&rsquo;re an Tiny, Small, Medium or Large Business, BeyondContact brings new meaning to &ldquo;ease of use.&rdquo; </p>\r\n<p>\r\n	Our software is easy to use, customize, and manage.</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Beyond Team</p>\r\n<p>\r\n	&nbsp;</p>','2010-04-16 15:55:47',23,'2010-04-16 15:55:47',23,1,0),
 (72,23,'Next Generation Business EMail System','<p>\r\n	Hi&nbsp;Field:FirstName,&nbsp;Field:LastName</p>\r\n<p>\r\n	BeyondContact is not a re-engineered, previous-generation BulkMail application.&nbsp;</p>\r\n<p>\r\n	It was designed from the ground up to be part of &nbsp;&ldquo;daily&rdquo; business life. The Beyond Contact&nbsp;combines Web 2.0 power and ease of use in a secure, enterprise-ready platform. Whether you&rsquo;re an Tiny, Small, Medium or Large Business, BeyondContact brings new meaning to &ldquo;ease of use.&rdquo;</p>\r\n<p>\r\n	Our software is easy to use, customize, and manage.</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Beyond Team</p>\r\n','2010-04-16 15:59:02',23,'2010-04-16 15:59:02',23,1,0),
 (73,24,'Not Logged In','<p>\r\n	&nbsp;</p>\r\n<div class=\"smallfont\" style=\"color: rgb(0, 0, 0); margin-top: 2px; \">\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Tahoma; font-size: 13px; line-height: 19px; -webkit-border-horizontal-spacing: 1px; -webkit-border-vertical-spacing: 1px; \">You are not logged in or you do not have permission to access this page. This could be due to one of several reasons:</span></div>\r\n<ol>\r\n	<li class=\"smallfont\" style=\"color: rgb(0, 0, 0); margin-top: 2px; \">\r\n		<span class=\"Apple-style-span\" style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Tahoma; font-size: 13px; line-height: 19px; -webkit-border-horizontal-spacing: 1px; -webkit-border-vertical-spacing: 1px; \">You are not logged in. Fill in the form at the bottom of this page and try again.</span></li>\r\n	<li class=\"smallfont\" style=\"color: rgb(0, 0, 0); margin-top: 2px; \">\r\n		<span class=\"Apple-style-span\" style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Tahoma; font-size: 13px; line-height: 19px; -webkit-border-horizontal-spacing: 1px; -webkit-border-vertical-spacing: 1px; \">You may not have sufficient privileges to access this page. Are you trying to edit someone else&#39;s post, access administrative features or some other privileged system?</span></li>\r\n	<li class=\"smallfont\" style=\"color: rgb(0, 0, 0); margin-top: 2px; \">\r\n		<span class=\"Apple-style-span\" style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Tahoma; font-size: 13px; line-height: 19px; -webkit-border-horizontal-spacing: 1px; -webkit-border-vertical-spacing: 1px; \">If you are trying to post, the administrator may have disabled your account, or it may be awaiting activation.</span></li>\r\n</ol>\r\n','2010-04-16 16:02:48',24,'2010-04-16 16:02:48',24,1,0),
 (74,28,'MeetingForm','<div id=\"container\">\r\n	<form action=\"#public\" autocomplete=\"off\" class=\"joompal topLabel page\" enctype=\"multipart/form-data\" id=\"form70\" method=\"post\" name=\"form70\">\r\n		<div class=\"info\">\r\n			<h2>\r\n				Meeting Form</h2>\r\n			<div>\r\n				To help keep meetings on track, use this form to record major decisions and any follow-up activities required.</div>\r\n		</div>\r\n		<ul>\r\n			<li id=\"foli0\">\r\n				<label class=\"desc\" for=\"Field0\" id=\"title0\">Name of Meeting </label>\r\n				<div>\r\n					<input class=\"field text medium\" id=\"Field0\" maxlength=\"255\" name=\"Field0\" onkeyup=\"\" tabindex=\"1\" type=\"text\" value=\"\" /></div>\r\n			</li>\r\n			<li class=\"date \" id=\"foli2\">\r\n				<label class=\"desc\" for=\"Field2\" id=\"title2\">Date </label> <span> <input class=\"field text\" id=\"Field2-1\" maxlength=\"2\" name=\"Field2-1\" size=\"2\" tabindex=\"2\" type=\"text\" value=\"\" /> <label for=\"Field2-1\">MM</label> </span> <span class=\"symbol\">/</span> <span> <input class=\"field text\" id=\"Field2-2\" maxlength=\"2\" name=\"Field2-2\" size=\"2\" tabindex=\"3\" type=\"text\" value=\"\" /> <label for=\"Field2-2\">DD</label> </span> <span class=\"symbol\">/</span> <span> <input class=\"field text\" id=\"Field2\" maxlength=\"4\" name=\"Field2\" size=\"4\" tabindex=\"4\" type=\"text\" value=\"\" /> <label for=\"Field2\">YYYY</label> </span> <span id=\"cal2\"> <img alt=\"Pick a date.\" class=\"datepicker\" id=\"pick2\" src=\"images/calendar.png\" /> </span> <script type=\"text/javascript\"> Calendar.setup({ inputField   : \"Field2\", displayArea  : \"cal2\", button  : \"pick2\", ifFormat     : \"%B %e, %Y\", onSelect     : selectDateOnForm }); </script></li>\r\n			<li id=\"foli3\">\r\n				<label class=\"desc\" for=\"Field3\" id=\"title3\">Location </label>\r\n				<div>\r\n					<input class=\"field text medium\" id=\"Field3\" maxlength=\"255\" name=\"Field3\" onkeyup=\"\" tabindex=\"5\" type=\"text\" value=\"\" /></div>\r\n			</li>\r\n			<li id=\"foli1\">\r\n				<label class=\"desc\" for=\"Field1\" id=\"title1\">Names of Participants </label>\r\n				<div>\r\n					<textarea class=\"field textarea medium\" cols=\"50\" id=\"Field1\" name=\"Field1\" onkeyup=\"\" rows=\"10\" tabindex=\"6\"></textarea></div>\r\n			</li>\r\n			<li id=\"foli6\">\r\n				<label class=\"desc\" for=\"Field6\" id=\"title6\">Agenda Items </label>\r\n				<div>\r\n					<span><input class=\"field checkbox\" id=\"Field6\" name=\"Field6\" tabindex=\"7\" type=\"checkbox\" value=\"Thing the first\" /> <label class=\"choice\" for=\"Field6\">Thing the first</label> </span> <span> <input class=\"field checkbox\" id=\"Field7\" name=\"Field7\" tabindex=\"8\" type=\"checkbox\" value=\"Thing the second\" /> <label class=\"choice\" for=\"Field7\">Thing the second</label> </span> <span> <input class=\"field checkbox\" id=\"Field8\" name=\"Field8\" tabindex=\"9\" type=\"checkbox\" value=\"Thing the third\" /> <label class=\"choice\" for=\"Field8\">Thing the third</label> </span> <span> <input class=\"field checkbox\" id=\"Field9\" name=\"Field9\" tabindex=\"10\" type=\"checkbox\" value=\"Thing the fourth\" /> <label class=\"choice\" for=\"Field9\">Thing the fourth</label> </span> <span> <input class=\"field checkbox\" id=\"Field10\" name=\"Field10\" tabindex=\"11\" type=\"checkbox\" value=\"Thing the fifth\" /> <label class=\"choice\" for=\"Field10\">Thing the fifth</label> </span></div>\r\n			</li>\r\n			<li id=\"foli4\">\r\n				<label class=\"desc\" for=\"Field4\" id=\"title4\">Decisions Reached </label>\r\n				<div>\r\n					<textarea class=\"field textarea medium\" cols=\"50\" id=\"Field4\" name=\"Field4\" onkeyup=\"\" rows=\"10\" tabindex=\"12\"></textarea></div>\r\n			</li>\r\n			<li id=\"foli105\">\r\n				<label class=\"desc\" for=\"Field105\" id=\"title105\">Follow-Up Activities </label>\r\n				<div>\r\n					<textarea class=\"field textarea medium\" cols=\"50\" id=\"Field105\" name=\"Field105\" onkeyup=\"\" rows=\"10\" tabindex=\"13\"></textarea></div>\r\n			</li>\r\n			<li class=\"buttons \">\r\n				<div>\r\n					<input id=\"currentPage\" name=\"currentPage\" type=\"hidden\" value=\"dB5YAYUJLThQ1vViLqkRtO8PC6nWmLuPsz2BRQNT4gw=\" /> <input class=\"btTxt submit\" id=\"saveForm\" name=\"saveForm\" type=\"submit\" value=\"Submit\" /></div>\r\n			</li>\r\n			<li style=\"display:none\">\r\n				<label for=\"comment\">Do Not Fill This Out</label> <textarea cols=\"1\" id=\"comment\" name=\"comment\" rows=\"1\"></textarea> <input id=\"idstamp\" name=\"idstamp\" type=\"hidden\" value=\"\" /></li>\r\n		</ul>\r\n	</form>\r\n</div>\r\n','2010-04-18 12:57:09',28,'2010-04-18 12:57:09',28,1,1),
 (104,28,'About our products - Please read','<p>\r\n	Hi Field:FirstName,&nbsp;Field:LastName</p>\r\n<p>\r\n	this is a test mail</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Sales</p>\r\n','2010-04-25 06:55:03',28,'2010-04-25 06:55:03',28,1,0),
 (112,28,'TEST MAIL SUBJECT','<p>\r\n	test</p>\r\n','2010-04-25 21:03:01',28,'2010-04-25 21:03:01',28,1,0),
 (113,28,'TEST ONCE MAIL','<p>\r\n	test once mail</p>\r\n','2010-04-25 21:05:28',28,'2010-04-25 21:05:28',28,1,0),
 (116,15,'TEST MESSAGE ABT PRODUCTS','<p>\r\n	test</p>\r\n','2010-04-26 07:44:03',15,'2010-04-26 07:44:03',15,1,0),
 (129,28,'My New Static Template','<p>\r\n	<span style=\"font-size:16px;\"><strong>Test Template</strong></span></p>\r\n','2010-05-15 11:56:14',28,'2010-05-15 11:56:14',28,1,0),
 (130,28,'My New Dynamic Template','<p>\r\n	Dear Field:FirstName&nbsp;Field:LastName,</p>\r\n<p>\r\n	&nbsp;</p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 200px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				Name</td>\r\n			<td>\r\n				<input maxlength=\"50\" name=\"UserName\" type=\"text\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				Comments</td>\r\n			<td>\r\n				<textarea cols=\"30\" name=\"Comments\" rows=\"5\"></textarea></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				Please enter your name and comments</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 200px; \">\r\n</table>','2010-05-15 11:59:01',28,'2010-05-15 11:59:01',28,1,1),
 (131,28,'TEST MESSAGE','<p>\r\n	Hi Field:FirstName,&nbsp;Field:LastName</p>\r\n<p>\r\n	this is a test mail</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Sales</p>\r\n','2010-05-15 13:50:41',28,'2010-05-15 13:50:41',28,1,0),
 (132,8,'TEST MESSAGE ABT PRODUCTS','<p>\r\n	test</p>\r\n','2010-05-15 17:08:22',8,'2010-05-15 17:08:22',8,1,0),
 (133,8,'About our products - Please read','<p>\r\n	test</p>\r\n','2010-05-15 17:28:54',8,'2010-05-15 17:28:54',8,1,0),
 (134,8,'Custom Selection Test','<p>\r\n	custom selection test</p>\r\n','2010-05-15 17:34:51',8,'2010-05-15 17:34:51',8,1,0),
 (135,8,'Mail Profile Test','<p>\r\n	mail profile test</p>\r\n','2010-05-15 18:38:29',8,'2010-05-15 18:38:29',8,1,0),
 (136,8,'Custom Profile Test','<p>\r\n	test custom profile</p>\r\n','2010-05-15 18:43:47',8,'2010-05-15 18:43:47',8,1,0),
 (137,8,'Test custom profile again','<p>\r\n	Test custom profile again</p>\r\n','2010-05-15 18:47:57',8,'2010-05-15 18:47:57',8,1,0),
 (138,8,'TO Sai test','<p>\r\n	test</p>\r\n','2010-05-15 18:53:46',8,'2010-05-15 18:53:46',8,1,0),
 (139,8,'To sai test again','<p>\r\n	test&nbsp;</p>\r\n','2010-05-15 18:57:27',8,'2010-05-15 18:57:27',8,1,0),
 (140,8,'Test send to sai baabi','<p>\r\n	test mail</p>\r\n','2010-05-15 19:22:42',8,'2010-05-15 19:22:42',8,1,0),
 (141,8,'Final test','<p>\r\n	final test send mail</p>\r\n','2010-05-15 19:25:01',8,'2010-05-15 19:25:01',8,1,0),
 (142,8,'The final msg','<p>\r\n	test final msg</p>\r\n','2010-05-15 19:27:47',8,'2010-05-15 19:27:47',8,1,0),
 (143,8,'Final message test','<p>\r\n	test final meassage</p>\r\n','2010-05-15 19:33:44',8,'2010-05-15 19:33:44',8,1,0),
 (144,8,'the final message','<p>\r\n	test</p>\r\n','2010-05-15 19:39:11',8,'2010-05-15 19:39:11',8,1,0),
 (145,8,'what is this','<p>\r\n	what is this</p>\r\n','2010-05-15 19:58:42',8,'2010-05-15 19:58:42',8,1,0),
 (146,8,'First tracker','<p>\r\n	Hi&nbsp;Field:FirstName&nbsp;Field:LastName,</p>\r\n<p>\r\n	This is first email tracker email.</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Gowri</p>\r\n','2010-05-15 22:04:59',8,'2010-05-15 22:04:59',8,1,0),
 (147,8,'Second Mail Tracker Message','<p>\r\n	Hi&nbsp;Field:FirstName&nbsp;Field:LastName</p>\r\n<p>\r\n	Second mail tracker</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Gowri</p>\r\n','2010-05-15 22:08:07',8,'2010-05-15 22:08:07',8,1,0),
 (148,8,'Third Mail Tracker','<p>\r\n	third tracker</p>\r\n','2010-05-15 22:26:38',8,'2010-05-15 22:26:38',8,1,0),
 (149,8,'About our products - Please read','<p>\r\n	test</p>\r\n','2010-05-15 22:37:28',8,'2010-05-15 22:37:28',8,1,0),
 (150,8,'Policy Error Check','<p>\r\n	Error check</p>\r\n','2010-05-15 22:46:36',8,'2010-05-15 22:46:36',8,1,0),
 (151,8,'Policy Error Fixe TEST','<p>\r\n	test</p>\r\n','2010-05-15 22:55:24',8,'2010-05-15 22:55:24',8,1,0),
 (152,8,'From new server','<p>\r\n	test from new server</p>\r\n','2010-05-15 23:50:35',8,'2010-05-15 23:50:35',8,1,0),
 (153,8,'Just sent once','<p>\r\n	sent once test mail</p>\r\n','2010-05-16 09:34:19',8,'2010-05-16 09:34:19',8,1,0),
 (154,8,'Just Send Once - Test Two','<p>\r\n	send once test again</p>\r\n','2010-05-16 09:37:22',8,'2010-05-16 09:37:22',8,1,0),
 (155,8,'About our products - Please read','<p>\r\n	Hi&nbsp;Field:FirstName&nbsp;Field:LastName</p>\r\n<p>\r\n	Test products</p>\r\n<p>\r\n	Regards</p>\r\n','2010-05-16 12:34:54',8,'2010-05-16 12:34:54',8,1,0),
 (156,28,'TEST MESSAGE ABT PRODUCTS','<p>\r\n	test message</p>\r\n','2010-05-16 14:41:53',28,'2010-05-16 14:41:53',28,1,0),
 (157,28,'Test send once mail','<p>\r\n	Hi Field:FirstName Field:LastName</p>\r\n<p>\r\n	test send once</p>\r\n<p>\r\n	Regards</p>\r\n','2010-05-16 14:43:38',28,'2010-05-16 14:43:38',28,1,0),
 (158,8,'Test Web Link','<div class=\"Section1\">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse; margin-left: 37.1pt\">\r\n		<tbody>\r\n			<tr style=\"height: 19.85pt\">\r\n				<td colspan=\"3\" style=\"border-bottom: medium none; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 522pt; padding-right: 5.4pt; height: 19.85pt; border-top: #3161a1 1pt solid; border-right: #3161a1 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"696\">\r\n					<p class=\"MsoNormal\">\r\n						<b><span style=\"font-family: \'trebuchet ms\'; color: black; font-size: 18pt\">HI&nbsp;Field:FirstName&nbsp;Field:LastName</span></b></p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height: 36pt\">\r\n				<td colspan=\"2\" style=\"border-bottom: medium none; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 324.75pt; padding-right: 5.4pt; background: #9cb9e1; height: 36pt; border-top: medium none; border-right: medium none; padding-top: 0cm\" valign=\"top\" width=\"433\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;<b><span style=\"font-family: \'trebuchet ms\'\">Thank you for using our service department recently.</span></b></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						<span style=\"font-family: \'trebuchet ms\'\">As we would like to provide the best possible service for you in the future, we would very much appreciate your feedback on your experience with us.</span></p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n				<td style=\"border-bottom: medium none; border-left: medium none; padding-bottom: 0cm; padding-left: 5.4pt; width: 197.25pt; padding-right: 5.4pt; background: #9cb9e1; height: 36pt; border-top: medium none; border-right: #27458d 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"263\">\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n					<p class=\"MsoNormal\">\r\n						&nbsp;</p>\r\n				</td>\r\n			</tr>\r\n			<tr style=\"height: 380.9pt\">\r\n				<td colspan=\"3\" style=\"border-bottom: #3161a1 1pt solid; border-left: #3161a1 2.25pt solid; padding-bottom: 0cm; padding-left: 5.4pt; width: 522pt; padding-right: 5.4pt; height: 380.9pt; border-top: medium none; border-right: #3161a1 2.25pt solid; padding-top: 0cm\" valign=\"top\" width=\"696\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<br />\r\n	<p class=\"MsoNormal\">\r\n		&nbsp;</p>\r\n</div>\r\n','2010-05-16 17:40:02',8,'2010-05-16 17:40:02',8,1,0),
 (159,28,'test','<p>\r\n	test</p>\r\n','2010-05-17 22:40:51',28,'2010-05-17 22:40:51',28,1,0),
 (160,28,'My DO Template','<p>\r\n	Hi&nbsp;Field:FirstName&nbsp;Field:LastName</p>\r\n<p>\r\n	This is my first .do template</p>\r\n<p>\r\n	Regards</p>\r\n<p>\r\n	Test</p>\r\n','2010-05-18 06:59:37',28,'2010-05-18 06:59:37',28,1,0),
 (161,8,'PropertyPlus Video Link','<div align=\"left\" dir=\"ltr\">\r\n	&nbsp;</div>\r\n<table border=\"0\" width=\"600\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;<img alt=\" \" height=\"130\" nosend=\"1\" src=\"http://www.uploadlibrary.com/SMMS/briefingnote_1.PNG\" width=\"670\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td id=\"\" lang=\"\" scope=\"\" valign=\"top\">\r\n				<table border=\"0\" width=\"600\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"10\" width=\"670\">\r\n									<tbody>\r\n										<tr>\r\n											<td align=\"left\" id=\"\" lang=\"\" scope=\"\" style=\"BORDER-RIGHT: rgb(0,153,0) 1px solid; BORDER-TOP: rgb(0,153,0) 1px solid; BORDER-LEFT: rgb(0,153,0) 1px solid; BORDER-BOTTOM: rgb(0,153,0) 1px solid\" valign=\"top\">\r\n												<p>\r\n													<font size=\"4\"><font face=\"verdana,geneva\"><b>Dear Field:FirstName Field:LastName </b></font></font></p>\r\n												<p>\r\n													<span class=\"Apple-style-span\" style=\"font-family: verdana, geneva; font-size: medium; \">We are delighted to inform you that we now added a demonstration feature to our health and safety management system.</span></p>\r\n												<p>\r\n													<font size=\"4\"><font face=\"verdana,geneva\"><b>PropertyPlus Demonstration Video Added</b></font></font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">SM&amp;MS have now added a demonstration feature to our online health and safety management system, PropertyPlus. The already intuitive system, now allows users to be visually guided through the key features and benefits of the system. </font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">The demonstration also highlights some improved reporting functionality, following a recent software release.</font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">To view the demonstration video, existing PropertyPlus users need to log onto the system and click on the &#39;Video Demo&#39; icon. </font></p>\r\n												<p>\r\n													<font size=\"4\"><b><font face=\"verdana,geneva\">PropertyPlus Background Information</font></b></font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">PropertyPlus is a powerful online health and safety management system which allows clients to actively manage health and safety issues. The system is populated by our consultants when they undertake health and safety, fire safety and water risk assessments. Actions can then be closed, allocated to internal resources or approved contractors (via our ContractorPlus system). </font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">The innovative management module allows access to consolidated compliance data by client, surveyor, regional office or property.</font></p>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"3\">PropertyPlus is currently used by many of the largest property companies in the UK and we are hoping for success in the Innovation category of the British Institute of Facilities Management (<a href=\"http://response.pure360.com/_act/link.php?mId=J8513363536328401411896291819&amp;tId=5317632\" mce_real_href=\"http://www.bifm.org.uk/bifm/home\" title=\"BIFM Website\">BIFM</a> ) awards. </font></p>\r\n												<p>\r\n													&nbsp;</p>\r\n												<div style=\"TEXT-ALIGN: center\">\r\n													<img alt=\"SM&amp;MS Team\" height=\"212\" nosend=\"1\" src=\"http://www.uploadlibrary.com/SMMS/DSCF0010.jpg\" title=\"SM&amp;MS Team\" width=\"286\" /></div>\r\n												<div style=\"TEXT-ALIGN: center\">\r\n													&nbsp;</div>\r\n												<div style=\"TEXT-ALIGN: center\">\r\n													&nbsp;</div>\r\n												<div style=\"TEXT-ALIGN: center\">\r\n													&nbsp;</div>\r\n												<p>\r\n													<font face=\"verdana,geneva\" size=\"4\"><font face=\"verdana,geneva\" size=\"3\">If you are not using the system and are interested in seeing how PropertyPlus can reduce your health and safety burden, reduce administration time and put you in control, please call Richard Edwards or email <a href=\"http://response.pure360.com/_act/link.php?mId=363536328401411896291819&amp;tId=5317633\" mce_real_href=\"http://response.pure360.com/_act/campaign_manager/messages/richard.edwards@sm-ms.biz\">richard.edwards@sm-ms.biz&nbsp;</a> </font></font></p>\r\n												<p align=\"center\">\r\n													&nbsp;</p>\r\n												<div align=\"center\">\r\n													<div style=\"TEXT-ALIGN: center\">\r\n														<font face=\"verdana,geneva\" size=\"4\"><font face=\"verdana,geneva\">Safety Management and Monitoring Services </font></font></div>\r\n												</div>\r\n												<p align=\"center\">\r\n													<font face=\"verdana,geneva\" size=\"4\"><font face=\"verdana,geneva\"><a href=\"http://response.pure360.com/_act/link.php?mId=J8513363536328401411896291819&amp;tId=5317634\" mce_real_href=\"http://www.sm-ms.co.uk/\" title=\"SM&amp;MS Web Site\">http://www.sm-ms.co.uk/</a> T. 01484 452349 </font></font></p>\r\n												<div align=\"center\">\r\n													&nbsp;</div>\r\n												<p align=\"center\">\r\n													<font face=\"verdana,geneva\" size=\"4\">Salus House, Dyson Wood Way, Bradley Business Park, Huddersfield, HD2 1GN</font><font face=\"verdana,geneva\" size=\"2\"><br />\r\n													</font></p>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<center>\r\n	<font color=\"#999999\" face=\"verdana, arial, helvetica\" size=\"1\"><br />\r\n	<br />\r\n	-- <br />\r\n	<br />\r\n	</font></center>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>','2010-05-25 08:56:59',8,'2010-05-25 08:56:59',8,1,0);
/*!40000 ALTER TABLE "templates" ENABLE KEYS */;


--
-- Definition of table "user_accountconfig"
--
CREATE TABLE "user_accountconfig" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "company_name" varchar(100) NOT NULL,
  "company_number" varchar(100) NOT NULL,
  "company_address" varchar(250) DEFAULT NULL,
  "company_phone" varchar(45) DEFAULT NULL,
  "is_authorized" int(10) NOT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime NOT NULL,
  "modified_by" int(10) unsigned NOT NULL,
  "is_active" int(2) unsigned NOT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_configurations_1" ("user_id")
) TYPE=InnoDB AUTO_INCREMENT=20 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "user_accountconfig"
--

/*!40000 ALTER TABLE "user_accountconfig" DISABLE KEYS */;
INSERT INTO "user_accountconfig" ("id","user_id","company_name","company_number","company_address","company_phone","is_authorized","created_on","created_by","modified_on","modified_by","is_active") VALUES 
 (1,9,'Joompal Limited','32423424','2 Thorpe Hall Grove','07850151413',0,'2010-03-15 00:00:00',9,'2010-03-15 00:00:00',9,1),
 (2,15,'SM&MS Limited','9897989',NULL,NULL,0,'2010-03-14 20:49:16',15,'2010-03-14 20:49:16',15,0),
 (3,16,'TEST ComPAnY NAME','07989',NULL,NULL,0,'2010-03-16 13:32:06',16,'2010-03-16 13:32:06',16,0),
 (4,17,'Joompal Limited','32423424',NULL,NULL,0,'2010-03-17 21:38:14',9,'2010-03-17 21:38:14',9,1),
 (5,18,'Joompal Limited','32423424',NULL,NULL,0,'2010-03-17 21:39:58',9,'2010-03-17 21:39:58',9,1),
 (6,19,'Joompal Limited','32423424',NULL,NULL,0,'2010-03-17 21:50:08',9,'2010-03-17 21:50:08',9,1),
 (7,20,'SM&MS Limited','9897989',NULL,NULL,0,'2010-03-17 21:51:59',15,'2010-03-17 21:51:59',15,1),
 (8,21,'SM&MS Limited','9897989',NULL,NULL,0,'2010-03-17 21:52:33',15,'2010-03-17 21:52:33',15,1),
 (9,22,'Joompal Limited','32423424',NULL,NULL,0,'2010-03-17 22:06:16',9,'2010-03-17 22:06:16',9,1),
 (10,8,'Joompal Limited','99089089','2 Thorpe Hall Grove','07850151413',0,'2010-03-17 22:06:16',8,'2010-05-14 18:51:00',0,0),
 (11,23,'SM-MS','0980980',NULL,NULL,0,'2010-04-16 15:51:11',0,'2010-04-16 15:51:11',0,1),
 (12,24,'09808080','09808080',NULL,NULL,0,'2010-04-16 16:01:00',0,'2010-04-16 16:01:00',0,1),
 (13,25,'','',NULL,NULL,0,'2010-04-17 11:10:13',0,'2010-04-17 11:10:13',0,1),
 (14,26,'','',NULL,NULL,0,'2010-04-17 11:11:39',0,'2010-04-17 11:11:39',0,1),
 (15,27,'','',NULL,NULL,0,'2010-04-17 11:12:32',0,'2010-04-17 11:12:32',0,1),
 (16,28,'SFSF','9897989','','07850151413',0,'2010-04-17 15:41:34',0,'2010-05-15 20:51:35',0,0),
 (17,29,'Safety Management Ltd','9879879',NULL,NULL,0,'2010-04-18 21:28:25',0,'2010-04-18 21:28:25',0,1),
 (18,32,'TEST ComPAnY NAME','01834014',NULL,NULL,0,'2010-04-19 10:20:51',2,'2010-04-19 10:20:51',2,1),
 (19,33,'Joompal Limited','99089089',NULL,NULL,0,'2010-05-23 15:36:40',2,'2010-05-23 15:36:40',2,1);
/*!40000 ALTER TABLE "user_accountconfig" ENABLE KEYS */;


--
-- Definition of table "user_mailconfig"
--
CREATE TABLE "user_mailconfig" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_id" int(10) unsigned NOT NULL,
  "smtp_auth" varchar(10) DEFAULT NULL,
  "smtp_servername" varchar(100) NOT NULL,
  "smtp_username" varchar(100) NOT NULL,
  "smtp_password" varchar(24) NOT NULL,
  "smtp_port" varchar(5) NOT NULL,
  "smtp_type" varchar(45) DEFAULT NULL,
  "from_email" varchar(100) NOT NULL,
  "from_name" varchar(50) DEFAULT NULL,
  "replyto_email" varchar(100) DEFAULT NULL,
  "created_on" datetime NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "modified_by" int(10) unsigned DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "profile_name" varchar(45) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_user_mailconfig_1" ("user_id"),
  CONSTRAINT "FK_user_mailconfig_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
) TYPE=InnoDB AUTO_INCREMENT=7 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "user_mailconfig"
--

/*!40000 ALTER TABLE "user_mailconfig" DISABLE KEYS */;
INSERT INTO "user_mailconfig" ("id","user_id","smtp_auth","smtp_servername","smtp_username","smtp_password","smtp_port","smtp_type","from_email","from_name","replyto_email","created_on","created_by","modified_on","modified_by","is_active","profile_name") VALUES 
 (1,8,'true','smtp.gmail.com','gowrisankar.narayan@gmail.com','saisankar1','465','smtp','gowrisankar.narayan@gmail.com','Gowrisankar','gowrisankar.narayan@gmail.com','2010-04-27 12:46:40',8,'2010-04-27 12:46:40',8,1,'Gowrisankar Narayan Gmail'),
 (2,8,'true','smtp.gmail.com','gowrisankar','letmein','8989',NULL,'gowrisankar@gmail.com','test','test@gmail.com','2010-04-27 14:16:04',8,'2010-04-27 14:16:04',8,1,'new profiles'),
 (3,8,'true','smtp.gmail.com','test','test','989',NULL,'test@gmail.com','test','test@gmail.com','2010-04-27 14:21:20',8,'2010-04-27 14:21:20',8,1,'Test'),
 (4,28,'true','10.0.0.11','gowrisankar.narayan@gmail.com','letmein','299',NULL,'gowrisankar.narayan@gmail.com','TEST FROM','gowrisankar.narayan@gmail.com','2010-05-13 20:34:27',28,'2010-05-13 20:34:27',28,1,'Test Profile1'),
 (5,8,'true','10.90.23.232','sai.baabi@gmail.com','letmein','989',NULL,'sai.baabi@gmail.com','Sai Baabi','sai.baabi@gmail.com','2010-05-14 18:52:02',8,'2010-05-14 18:52:02',8,1,'Sai Baabi'),
 (6,28,'true','smtp.gmail.com','gowrisankar.narayanan@gmail.com','saisankar1','465',NULL,'gowrisankar.narayanan@gmail.com','Gowrisankar','gowrisankar.narayanan@gmail.com','2010-05-18 07:05:57',28,'2010-05-18 07:05:57',28,1,'Profile2');
/*!40000 ALTER TABLE "user_mailconfig" ENABLE KEYS */;


--
-- Definition of table "user_types"
--
CREATE TABLE "user_types" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "name" varchar(40) NOT NULL,
  "desc" varchar(100) NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_on" datetime DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_by" int(10) unsigned NOT NULL,
  PRIMARY KEY ("id")
) TYPE=InnoDB AUTO_INCREMENT=4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "user_types"
--

/*!40000 ALTER TABLE "user_types" DISABLE KEYS */;
INSERT INTO "user_types" ("id","name","desc","created_on","modified_on","is_active","created_by","modified_by") VALUES 
 (1,'System Administrator','System Administrator','0000-00-00 00:00:00',NULL,1,2,2),
 (2,'Account Manager','Account Manager','0000-00-00 00:00:00',NULL,1,2,2),
 (3,'Account User','Account User','0000-00-00 00:00:00',NULL,1,2,2);
/*!40000 ALTER TABLE "user_types" ENABLE KEYS */;


--
-- Definition of table "users"
--
CREATE TABLE "users" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT,
  "user_name" varchar(20) NOT NULL,
  "password" varchar(40) NOT NULL,
  "email" varchar(40) NOT NULL,
  "created_on" datetime NOT NULL,
  "modified_on" datetime NOT NULL,
  "confirmed" varchar(1) DEFAULT '0',
  "confirm_code" varchar(36) DEFAULT NULL,
  "is_active" int(2) unsigned NOT NULL,
  "created_by" int(10) unsigned NOT NULL,
  "modified_by" int(10) unsigned NOT NULL,
  "user_type_id" int(10) unsigned DEFAULT NULL,
  "first_name" varchar(45) DEFAULT NULL,
  "last_name" varchar(45) DEFAULT NULL,
  "manager_id" int(10) unsigned DEFAULT NULL,
  "company_id" int(10) unsigned DEFAULT NULL,
  "mobile" varchar(45) DEFAULT NULL,
  "land_phone" varchar(45) DEFAULT NULL,
  "title" varchar(5) DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "FK_users_1" ("user_type_id"),
  KEY "FK_users_2" ("manager_id"),
  CONSTRAINT "FK_users_1" FOREIGN KEY ("user_type_id") REFERENCES "user_types" ("id"),
  CONSTRAINT "FK_users_2" FOREIGN KEY ("manager_id") REFERENCES "users" ("id")
) TYPE=InnoDB AUTO_INCREMENT=34 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table "users"
--

/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" ("id","user_name","password","email","created_on","modified_on","confirmed","confirm_code","is_active","created_by","modified_by","user_type_id","first_name","last_name","manager_id","company_id","mobile","land_phone","title") VALUES 
 (1,'demo','demo','gowri@softwaresystemseurope.com','2009-10-10 00:00:00','2009-10-10 00:00:00','0','0',1,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (2,'admin','letmein','admin@softwaresystemseurope.com','2009-10-10 00:00:00','2009-10-10 00:00:00','0','0',1,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (3,'Simon','letmein$123','simon.coley@peugeotmail.co.uk','2009-11-27 00:00:00','2009-11-27 00:00:00','0','0',1,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (4,'sseurope','Brazil','alex@softwaresystemseurope.com','2010-01-13 00:00:00','2010-01-13 00:00:00','0','0',1,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (8,'Gowrisankar Narayana','Gowrisankar','gowrisankar.narayan@gmail.com','2010-02-18 22:18:03','2010-05-14 18:51:00','0',NULL,0,2,0,2,'Gowrisankar','Narayana',NULL,NULL,'01234014','99898989','Mr'),
 (9,'Gary N','Gary','gary@joompal.com','2010-02-20 20:52:51','2010-02-20 20:52:51','0',NULL,0,2,2,2,'Gary','N',NULL,NULL,NULL,NULL,NULL),
 (10,'Karthikeyan Ganesan','Karthikeyan','gk.iflex@gmail.com','2010-02-23 16:20:05','2010-02-23 16:20:05','0',NULL,0,2,2,2,'Karthikeyan','Ganesan',NULL,NULL,NULL,NULL,NULL),
 (11,'shawn chan','shawn','shawn.chan@sm-ms.biz','2010-02-26 10:10:48','2010-02-26 10:10:48','0',NULL,0,2,2,2,'shawn','chan',NULL,NULL,NULL,NULL,NULL),
 (12,'Nandanoor sivakumar','Nandanoor','nsivagovind@gmail.com','2010-02-28 10:36:31','2010-02-28 10:36:31','0',NULL,0,2,2,2,'Nandanoor','sivakumar',NULL,NULL,NULL,NULL,NULL),
 (13,'gary n','gary','gowrisankar.narayanan@gmail.com','2010-03-14 19:49:06','2010-03-14 19:49:06','0',NULL,0,2,2,2,'gary','n',NULL,NULL,NULL,NULL,NULL),
 (15,'gary Narayan','gary','garyn@joompal.com','2010-03-14 20:49:16','2010-03-14 20:49:16','0',NULL,0,2,2,2,'gary','Narayan',NULL,NULL,NULL,NULL,NULL),
 (16,'Gowri Narayan','Gowri','gar@joompal.com','2010-03-16 13:32:06','2010-03-16 13:32:06','0',NULL,0,2,2,2,'Gowri','Narayan',NULL,NULL,NULL,NULL,NULL),
 (17,'Sai Baabi','Sai','sai.baabi112@gmail.com','2010-03-17 21:38:14','2010-03-17 21:38:14','0',NULL,0,2,2,2,'Sai','Baabi',NULL,NULL,NULL,NULL,NULL),
 (18,'G Narayan','G','gary1@joompal.com','2010-03-17 21:39:58','2010-03-17 21:39:58','0',NULL,0,2,2,2,'G','Narayan',NULL,NULL,NULL,NULL,NULL),
 (19,'Sai Narayan','Sai','garysn@joompal.com','2010-03-17 21:50:08','2010-03-17 21:50:08','0',NULL,0,2,2,2,'Sai','Narayan',NULL,NULL,NULL,NULL,NULL),
 (20,'Gowrisankar Baabi','Gowrisankar','garynt@joompal.com','2010-03-17 21:51:59','2010-03-17 21:51:59','0',NULL,0,2,2,2,'Gowrisankar','Baabi',NULL,NULL,NULL,NULL,NULL),
 (21,'Gowrisankar Baabi','Gowrisankar','garynt@joompal.com','2010-03-17 21:52:33','2010-03-17 21:52:33','0',NULL,0,2,2,2,'Gowrisankar','Baabi',NULL,NULL,NULL,NULL,NULL),
 (22,'Test Test','Test','garynq@joompal.com','2010-03-17 22:06:16','2010-03-17 22:06:16','0',NULL,0,2,2,2,'Test','Test',NULL,NULL,NULL,NULL,NULL),
 (23,'Garyn Narayan','Garyn','gowrisankar.narayana@sm-ms.biz','2010-04-16 15:51:11','2010-04-16 15:51:11','0',NULL,0,2,2,2,'Garyn','Narayan',NULL,NULL,NULL,NULL,NULL),
 (24,'sai Narayan','sai','sai.baabi@gmail.com','2010-04-16 16:00:59','2010-04-16 16:00:59','0',NULL,0,2,2,2,'sai','Narayan',NULL,NULL,NULL,NULL,NULL),
 (28,'sai Test','sai','narayana.gowrisankar@gmail.com','2010-04-17 15:41:34','2010-05-15 20:51:35','0',NULL,0,2,0,2,'sai','Test',NULL,NULL,'07926256001','324234324324','Mrs'),
 (29,'Sai Baabi','Sai','ga@joompal.com','2010-04-18 21:28:25','2010-04-18 21:28:25','0',NULL,0,2,2,2,'Sai','Baabi',NULL,NULL,NULL,NULL,NULL),
 (32,'Gowrisankar Narayan','Gowrisankar','testemail@gmail.com','2010-04-19 10:20:50','2010-04-19 10:20:50','0',NULL,0,2,2,2,'Gowrisankar','Narayan',NULL,NULL,NULL,NULL,NULL),
 (33,'Gary Narayan','Gary','garys@joompal.com','2010-05-23 15:36:40','2010-05-23 15:36:40','0',NULL,0,2,2,2,'Gary','Narayan',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE "users" ENABLE KEYS */;


--
-- Definition of function "fun_getMaxMailerByUserId"
--

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`beyond_dbadmin`@`gowri-PC.lan` FUNCTION `fun_getMaxMailerByUserId`(userId INTEGER) RETURNS int(11)
RETURN (SELECT MAX(id) from mailers where user_id =userId) $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function "getCustomerGroups"
--

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`192.168.1.65` FUNCTION `getCustomerGroups`(customerId INT(20)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE strGroupIds VARCHAR(100) DEFAULT '';
DECLARE a INT;
DECLARE cur CURSOR FOR SELECT group_id FROM customers_customergroups where customer_id=customerId;
DECLARE CONTINUE HANDLER FOR not found SET done = 1;


OPEN cur;

REPEAT
FETCH cur INTO a;
IF NOT done THEN
BEGIN
SET strGroupIds = CONCAT(strGroupIds,a,',');
END;
END IF;
UNTIL done
END REPEAT;

CLOSE cur;

IF (LENGTH(strGroupIds) > 0) THEN
BEGIN
SET strGroupIds = SUBSTRING(strGroupIds, 1, LENGTH(strGroupIds)-1);
END;
END IF;


RETURN strGroupIds;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "delContact"
--

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`beyond_dbadmin`@`gowri-PC.lan` PROCEDURE `delContact`(userId INTEGER, vEmail VARCHAR(100))
BEGIN

START TRANSACTION;

  DELETE FROM customers_customergroups where customer_id in (
    SELECT id FROM customers where email=vEmail and user_id=userId
  );

  DELETE FROM mailers_customers where customer_id in (
  SELECT id FROM customers where email=vEmail and user_id=userId
    );

  DELETE FROM customers where email=vEmail and user_id=userId;

COMMIT;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "delTemplate"
--

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`beyond_dbadmin`@`gowri-PC.lan` PROCEDURE `delTemplate`(userId INTEGER, templateId INTEGER)
BEGIN
DECLARE l_mailId INTEGER(10);
DECLARE l_trg    VARCHAR(50);
DECLARE l_job    VARCHAR(50);

DECLARE done INT DEFAULT 0;
DECLARE cur1 CURSOR FOR SELECT id FROM mailers WHERE template_id=templateId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

      OPEN cur1;

       REPEAT
        FETCH cur1 INTO l_mailId;
        IF NOT done THEN

        START TRANSACTION;

        SET l_trg=  'MAIL_TRIGGER_' + l_mailId;
        SET l_job=  'MAIL_JOB_'+ l_mailId;

        SELECT l_trg;
        SELECT l_job;

        DELETE FROM mailers_schedule     WHERE mailer_id   in (l_mailId);
        DELETE FROM mailers_customers    WHERE mailer_id   in (l_mailId);
        DELETE FROM mailers_delivery_log WHERE mailer_id  in (l_mailId);
        DELETE FROM QRTZ_CRON_TRIGGERS   WHERE TRIGGER_NAME = l_trg;
        DELETE FROM QRTZ_JOB_DETAILS     WHERE JOB_NAME     = l_job;
        DELETE FROM QRTZ_TRIGGERS        WHERE TRIGGER_NAME = l_trg AND JOB_NAME = l_job;

        COMMIT;

        END IF;
       UNTIL done END REPEAT;

      CLOSE cur1;

      START TRANSACTION;

      DELETE FROM mailers             WHERE template_id in (templateId);
      DELETE FROM response_elements   WHERE response_id in (select id from responses where template_id=templateId);
      DELETE FROM elements            WHERE template_id in (templateId);
      DELETE FROM responses           WHERE template_id in (templateId);
      DELETE FROM templates           WHERE id          in (templateId);

      COMMIT;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view "vw_auto_responses"
--

DROP TABLE IF EXISTS "vw_auto_responses";
DROP VIEW IF EXISTS "vw_auto_responses";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_auto_responses" AS select "c"."id" AS "id","c"."response_type_id" AS "response_type_id",(select "auto_response_types"."response_type_name" AS "response_type_name" from "auto_response_types" where ("auto_response_types"."id" = "c"."response_type_id")) AS "response_type_name","c"."response_html" AS "response_html","c"."response_subject" AS "response_subject","c"."profile_id" AS "profile_id","c"."template_id" AS "template_id","c"."user_id" AS "user_id","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "auto_responses" "c";

--
-- Definition of view "vw_customer_customergroups"
--

DROP TABLE IF EXISTS "vw_customer_customergroups";
DROP VIEW IF EXISTS "vw_customer_customergroups";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"%" SQL SECURITY DEFINER VIEW "vw_customer_customergroups" AS select "c"."id" AS "id","c"."customer_id" AS "customer_id",(select "customers"."first_name" AS "first_name" from "customers" where ("customers"."id" = "c"."customer_id")) AS "first_name",(select "customers"."last_name" AS "last_name" from "customers" where ("customers"."id" = "c"."customer_id")) AS "last_name",(select "customers"."email" AS "email" from "customers" where ("customers"."id" = "c"."customer_id")) AS "email","c"."group_id" AS "group_id",(select "customer_groups"."name" AS "name" from "customer_groups" where ("customer_groups"."id" = "c"."group_id")) AS "group_name",(select "vw_users_customergroups"."user_id" AS "user_id" from "vw_users_customergroups" where ("vw_users_customergroups"."group_id" = "c"."group_id")) AS "user_id","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "customers_customergroups" "c";

--
-- Definition of view "vw_customers"
--

DROP TABLE IF EXISTS "vw_customers";
DROP VIEW IF EXISTS "vw_customers";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_customers" AS select "c"."id" AS "id","c"."group_id" AS "group_id","c"."subscription_status_id" AS "subscription_status_id",(select "status_master"."status_name" AS "status_name" from "status_master" where ("status_master"."id" = "c"."subscription_status_id")) AS "subscription_status","c"."user_id" AS "user_id","c"."title" AS "title","c"."first_name" AS "first_name","c"."last_name" AS "last_name","c"."email" AS "email","c"."mobile" AS "mobile","c"."landPhone" AS "landPhone","c"."contact_details" AS "contact_details","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "customers" "c";

--
-- Definition of view "vw_elements"
--

DROP TABLE IF EXISTS "vw_elements";
DROP VIEW IF EXISTS "vw_elements";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_elements" AS select "c"."id" AS "element_id","c"."template_id" AS "template_id",(select "templates"."name" AS "name" from "templates" where ("templates"."id" = "c"."template_id")) AS "template_name","c"."name" AS "element_name","c"."label" AS "element_label","c"."element_order" AS "element_order","c"."max_length" AS "max_length","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "elements" "c" order by "c"."template_id","c"."element_order";

--
-- Definition of view "vw_geo_tracker"
--

DROP TABLE IF EXISTS "vw_geo_tracker";
DROP VIEW IF EXISTS "vw_geo_tracker";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_geo_tracker" AS select count(1) AS "subscriber_count","c"."user_id" AS "user_id","c"."country_code" AS "country_code","c"."city_code" AS "city_code" from "customers" "c" group by "c"."user_id","c"."country_code","c"."city_code";

--
-- Definition of view "vw_groups_roles"
--

DROP TABLE IF EXISTS "vw_groups_roles";
DROP VIEW IF EXISTS "vw_groups_roles";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_groups_roles" AS select "g"."id" AS "group_id","g"."name" AS "group_name","r"."id" AS "role_id","r"."name" AS "role_name","r"."desc" AS "role_desc","r"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "r"."created_by")) AS "created_by","r"."created_on" AS "created_on",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "r"."modified_by")) AS "modified_by","r"."modified_on" AS "modified_on","r"."created_by" AS "id_created_by","r"."modified_by" AS "id_modified_by" from (("roles" "r" join "groups" "g") join "groups_roles" "gr") where (("gr"."group_id" = "g"."id") and ("gr"."role_id" = "r"."id"));

--
-- Definition of view "vw_groups_users"
--

DROP TABLE IF EXISTS "vw_groups_users";
DROP VIEW IF EXISTS "vw_groups_users";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_groups_users" AS select "u"."id" AS "user_id","u"."user_name" AS "user_name","g"."id" AS "group_id","g"."name" AS "group_name","g"."desc" AS "group_desc","g"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "g"."created_by")) AS "created_by","g"."created_on" AS "created_on",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "g"."modified_by")) AS "modified_by","g"."modified_on" AS "modified_on","g"."created_by" AS "id_created_by","g"."modified_by" AS "id_modified_by" from (("users" "u" join "groups" "g") join "groups_users" "gu") where (("gu"."group_id" = "g"."id") and ("gu"."user_id" = "u"."id"));

--
-- Definition of view "vw_mailers"
--

DROP TABLE IF EXISTS "vw_mailers";
DROP VIEW IF EXISTS "vw_mailers";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_mailers" AS select "c"."id" AS "mailer_id","c"."profile_id" AS "profile_id","c"."user_id" AS "user_id","c"."template_id" AS "template_id",(select "templates"."content" AS "content" from "templates" where ("templates"."id" = "c"."template_id")) AS "template_content",(select "templates"."name" AS "name" from "templates" where ("templates"."id" = "c"."template_id")) AS "template_name","c"."mail_subject" AS "mail_subject","c"."date_scheduled" AS "date_scheduled","c"."status_id" AS "status_id","c"."sent_on" AS "sent_on","c"."group_ids" AS "group_ids","c"."send_to_groups" AS "send_to_groups",(select count(1) AS "count(1)" from "responses" where ("responses"."mailer_id" = "c"."id")) AS "responseCount",(select count(1) AS "count(1)" from "mailers_customers" where ("mailers_customers"."mailer_id" = "c"."id")) AS "contactCount","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "mailers" "c";

--
-- Definition of view "vw_mailers_customers"
--

DROP TABLE IF EXISTS "vw_mailers_customers";
DROP VIEW IF EXISTS "vw_mailers_customers";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_mailers_customers" AS select "m"."id" AS "id","m"."mailer_id" AS "mailer_id","m"."customer_id" AS "customer_id","m"."status_id" AS "status_id","m"."email_id" AS "email_id" from "mailers_customers" "m";

--
-- Definition of view "vw_mailers_delivery_log"
--

DROP TABLE IF EXISTS "vw_mailers_delivery_log";
DROP VIEW IF EXISTS "vw_mailers_delivery_log";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_mailers_delivery_log" AS select "s"."id" AS "id","s"."mailer_id" AS "mailer_id",(select "mailers"."template_id" AS "template_id" from "mailers" where ("mailers"."id" = "s"."mailer_id")) AS "template_id",(select "mailers"."mail_subject" AS "mail_subject" from "mailers" where ("mailers"."id" = "s"."mailer_id")) AS "mail_subject",(select "templates"."name" AS "name" from "templates" where ("templates"."id" = (select "mailers"."template_id" AS "template_id" from "mailers" where ("mailers"."id" = "s"."mailer_id")))) AS "template_name","s"."contact_count" AS "contact_count","s"."delivery_date" AS "delivery_date","s"."delivery_time" AS "delivery_time","s"."delivery_status" AS "delivery_status",(select "status_master"."status_name" AS "status_name" from "status_master" where ("status_master"."id" = "s"."delivery_status")) AS "delivery_status_desc","s"."created_on" AS "created_on","s"."created_by" AS "id_created_by","s"."modified_on" AS "modified_on","s"."modified_by" AS "id_modified_by","s"."error_message" AS "error_message","s"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "s"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "s"."modified_by")) AS "modified_by" from "mailers_delivery_log" "s";

--
-- Definition of view "vw_mailers_schedule"
--

DROP TABLE IF EXISTS "vw_mailers_schedule";
DROP VIEW IF EXISTS "vw_mailers_schedule";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"%" SQL SECURITY DEFINER VIEW "vw_mailers_schedule" AS select "m"."id" AS "id","m"."mailer_id" AS "mailer_id","m"."pattern_id" AS "pattern_id","m"."start_date" AS "start_date","m"."time_of_day" AS "time_of_day","m"."send_hours" AS "send_hours","m"."send_minutes" AS "send_minutes","m"."send_ampm" AS "send_ampm","m"."end_date" AS "end_date","m"."exclude_holidays" AS "exclude_holidays","m"."auto_roll" AS "auto_roll","m"."days_excluded" AS "days_excluded","m"."day_of_week" AS "day_of_week","m"."date_of_month" AS "date_of_month","m"."status_id" AS "status_id","m"."next_delivery" AS "next_delivery","m"."created_on" AS "created_on","m"."created_by" AS "id_created_by","m"."modified_on" AS "modified_on","m"."modified_by" AS "id_modified_by","m"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "m"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "m"."modified_by")) AS "modified_by" from "mailers_schedule" "m";

--
-- Definition of view "vw_overall_campaign"
--

DROP TABLE IF EXISTS "vw_overall_campaign";
DROP VIEW IF EXISTS "vw_overall_campaign";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_overall_campaign" AS select "l"."user_id" AS "user_id",sum("m"."contact_count") AS "sent_count",(select count("t"."id") AS "count(id)" from "mail_tracker_log" "t" where ("t"."user_id" = "l"."user_id")) AS "open_count" from ("mailers_delivery_log" "m" join "mailers" "l") where (("m"."delivery_status" = 3) and ("m"."mailer_id" = "l"."id")) group by "l"."user_id";

--
-- Definition of view "vw_pending_instant_mailers"
--

DROP TABLE IF EXISTS "vw_pending_instant_mailers";
DROP VIEW IF EXISTS "vw_pending_instant_mailers";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_pending_instant_mailers" AS select "c"."id" AS "mailer_id","c"."user_id" AS "user_id","c"."template_id" AS "template_id",(select "templates"."content" AS "content" from "templates" where ("templates"."id" = "c"."template_id")) AS "template_content",(select "templates"."name" AS "name" from "templates" where ("templates"."id" = "c"."template_id")) AS "template_name","c"."mail_subject" AS "mail_subject","c"."date_scheduled" AS "date_scheduled","c"."status_id" AS "status_id","c"."sent_on" AS "sent_on",(select count(1) AS "count(1)" from "responses" where ("responses"."mailer_id" = "c"."id")) AS "responseCount",(select count(1) AS "count(1)" from "mailers_customers" where ("mailers_customers"."mailer_id" = "c"."id")) AS "contactCount","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from ("mailers" "c" join "vw_pending_schedule" "m") where ("c"."id" = "m"."mailer_id");

--
-- Definition of view "vw_pending_schedule"
--

DROP TABLE IF EXISTS "vw_pending_schedule";
DROP VIEW IF EXISTS "vw_pending_schedule";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_pending_schedule" AS select "m"."id" AS "id","m"."mailer_id" AS "mailer_id","m"."pattern_id" AS "pattern_id","m"."start_date" AS "start_date","m"."time_of_day" AS "time_of_day","m"."end_date" AS "end_date","m"."exclude_holidays" AS "exclude_holidays","m"."auto_roll" AS "auto_roll","m"."days_excluded" AS "days_excluded","m"."day_of_week" AS "day_of_week","m"."date_of_month" AS "date_of_month","m"."status_id" AS "status_id","m"."next_delivery" AS "next_delivery","m"."created_on" AS "created_on","m"."created_by" AS "created_by","m"."modified_on" AS "modified_on","m"."modified_by" AS "modified_by","m"."is_active" AS "is_active" from "mailers_schedule" "m" where (("m"."status_id" = 1) and ("m"."pattern_id" = 300));

--
-- Definition of view "vw_roles_tasks"
--

DROP TABLE IF EXISTS "vw_roles_tasks";
DROP VIEW IF EXISTS "vw_roles_tasks";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_roles_tasks" AS select "r"."id" AS "role_id","r"."name" AS "role_name","t"."id" AS "task_id","t"."desc" AS "sub_menu_desc","t"."submenu_order" AS "submenu_order","t"."label" AS "task_name","t"."desc" AS "task_desc","t"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "t"."created_by")) AS "created_by","t"."created_on" AS "created_on",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "t"."modified_by")) AS "modified_by","t"."modified_on" AS "modified_on","t"."created_by" AS "id_created_by","t"."modified_by" AS "id_modified_by" from (("roles" "r" join "submenus" "t") join "roles_tasks" "rt") where (("rt"."sub_menu_id" = "t"."id") and ("rt"."role_id" = "r"."id")) order by "t"."submenu_order","r"."id","r"."id","r"."name","t"."id";

--
-- Definition of view "vw_status"
--

DROP TABLE IF EXISTS "vw_status";
DROP VIEW IF EXISTS "vw_status";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_status" AS select "t"."type_name" AS "type_name","s"."id" AS "id","s"."status_name" AS "status_name","s"."status_desc" AS "status_desc","s"."status_type_id" AS "status_type_id","s"."created_by" AS "created_by","s"."created_on" AS "created_on","s"."modified_by" AS "modified_by","s"."modified_on" AS "modified_on","s"."is_active" AS "is_active" from ("status_master" "s" join "status_type_master" "t") where ("t"."id" = "s"."status_type_id");

--
-- Definition of view "vw_templates"
--

DROP TABLE IF EXISTS "vw_templates";
DROP VIEW IF EXISTS "vw_templates";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_templates" AS select "c"."id" AS "id","c"."user_id" AS "user_id","c"."name" AS "name",(select max("mailers"."sent_on") AS "max(sent_on)" from "mailers" where ("mailers"."template_id" = "c"."id")) AS "last_sent_on","c"."content" AS "content","c"."created_on" AS "created_on","c"."is_dynamic" AS "is_dynamic","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by",if(((select count(1) AS "count" from "elements" where ("elements"."template_id" = "c"."id")) = 0),0,1) AS "has_elements",if(((select count(1) AS "count" from "responses" where ("responses"."template_id" = "c"."id")) = 0),0,1) AS "has_responses",(select count(1) AS "count(1)" from "mailers" where ("mailers"."template_id" = "c"."id")) AS "sent_count",(select count(1) AS "count(1)" from "responses" where ("responses"."template_id" = "c"."id")) AS "response_count" from "templates" "c";

--
-- Definition of view "vw_user_mailprofiles"
--

DROP TABLE IF EXISTS "vw_user_mailprofiles";
DROP VIEW IF EXISTS "vw_user_mailprofiles";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_user_mailprofiles" AS select "c"."profile_name" AS "profile_name","c"."id" AS "id","c"."user_id" AS "user_id","c"."smtp_auth" AS "smtp_auth","c"."smtp_servername" AS "smtp_servername","c"."smtp_username" AS "smtp_username","c"."smtp_password" AS "smtp_password","c"."smtp_port" AS "smtp_port","c"."smtp_type" AS "smtp_type","c"."from_email" AS "from_email","c"."from_name" AS "from_name","c"."replyto_email" AS "replyto_email","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "user_mailconfig" "c";

--
-- Definition of view "vw_user_menu"
--

DROP TABLE IF EXISTS "vw_user_menu";
DROP VIEW IF EXISTS "vw_user_menu";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_user_menu" AS select "u"."id" AS "user_id",(select "menus"."image_link" AS "image_link" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "image_link","u"."user_name" AS "user_name",(select "menus"."id" AS "main_menu_id" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "main_menu_id",(select "menus"."name" AS "main_menu_name" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "main_menu_name",(select "menus"."label" AS "main_menu_label" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "main_menu_label",(select "menus"."link" AS "main_menu_link" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "main_menu_link",(select "menus"."menu_order" AS "menu_order" from "menus" where ("menus"."id" = "sm"."menu_id")) AS "menu_order","sm"."id" AS "sub_menu_id","sm"."name" AS "sub_menu_name","sm"."desc" AS "sub_menu_desc","sm"."label" AS "sub_menu_label","sm"."submenu_order" AS "submenu_order","sm"."link" AS "sub_menu_link" from (((("users" "u" join "submenus" "sm") join "vw_groups_roles" "gr") join "vw_groups_users" "gu") join "vw_roles_tasks" "rt") where (("u"."id" = "gu"."user_id") and ("gu"."group_id" = "gr"."group_id") and ("gr"."role_id" = "rt"."role_id") and ("rt"."task_id" = "sm"."id")) order by "u"."id",(select "menus"."menu_order" AS "menu_order" from "menus" where ("menus"."id" = "sm"."menu_id")),"sm"."submenu_order";

--
-- Definition of view "vw_users"
--

DROP TABLE IF EXISTS "vw_users";
DROP VIEW IF EXISTS "vw_users";
CREATE ALGORITHM=UNDEFINED DEFINER="beyond_dbadmin"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_users" AS select "a"."id" AS "id","a"."user_name" AS "user_name","a"."title" AS "title","a"."first_name" AS "first_name","a"."last_name" AS "last_name","a"."user_type_id" AS "user_type_id","a"."email" AS "email","a"."land_phone" AS "land_phone","a"."mobile" AS "mobile","a"."confirmed" AS "confirmed","a"."confirm_code" AS "confirm_code",(select "user_accountconfig"."company_name" AS "company_name" from "user_accountconfig" where ("user_accountconfig"."user_id" = "a"."id")) AS "company_name",(select "user_accountconfig"."company_number" AS "company_number" from "user_accountconfig" where ("user_accountconfig"."user_id" = "a"."id")) AS "company_number",(select "user_accountconfig"."company_address" AS "company_address" from "user_accountconfig" where ("user_accountconfig"."user_id" = "a"."id")) AS "company_address",(select "user_accountconfig"."company_phone" AS "company_phone" from "user_accountconfig" where ("user_accountconfig"."user_id" = "a"."id")) AS "company_phone",if(((select count(1) AS "count" from "user_accountconfig" where ("user_accountconfig"."id" = "a"."id")) = 0),0,1) AS "has_config",if(((select count(1) AS "count" from "user_mailconfig" where ("user_mailconfig"."id" = "a"."id")) = 0),0,1) AS "has_mailconfig",if(((select count(1) AS "count" from "customers" where ("customers"."user_id" = "a"."id")) = 0),0,1) AS "has_customers",if(((select count(1) AS "count" from "mailers" where ("mailers"."user_id" = "a"."id")) = 0),0,1) AS "has_mailers",if(((select count(1) AS "count" from "templates" where ("templates"."user_id" = "a"."id")) = 0),0,1) AS "has_templates","a"."created_on" AS "created_on","a"."modified_on" AS "modified_on","a"."created_by" AS "id_created_by","a"."modified_by" AS "id_modified_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "users"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "users"."modified_by")) AS "modified_by","a"."is_active" AS "is_active" from "users" "a";

--
-- Definition of view "vw_users_customergroups"
--

DROP TABLE IF EXISTS "vw_users_customergroups";
DROP VIEW IF EXISTS "vw_users_customergroups";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"gowri-PC.lan" SQL SECURITY DEFINER VIEW "vw_users_customergroups" AS select "c"."id" AS "group_id","c"."user_id" AS "user_id","c"."name" AS "group_name","c"."owners_name" AS "owners_name","c"."owners_email" AS "owners_email","c"."replyto_email" AS "replyto_email","c"."notify_owner" AS "notify_owner","c"."is_default" AS "is_default","c"."group_desc" AS "group_desc","c"."created_on" AS "created_on","c"."created_by" AS "id_created_by","c"."modified_on" AS "modified_on","c"."modified_by" AS "id_modified_by","c"."is_active" AS "is_active",(select count(1) AS "count(1)" from "customers" where ("customers"."group_id" = "c"."id")) AS "customerCount",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."created_by")) AS "created_by",(select "users"."user_name" AS "user_name" from "users" where ("users"."id" = "c"."modified_by")) AS "modified_by" from "customer_groups" "c";



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
