
--First transfer the QMS questions from excel to mysql, creating table qms
--  every field must have a data unless the conversion will not work properly


--- Create the table question
--  for the purpose of conversion (it will be adjusted after)
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_clause_id` int(11) DEFAULT '1',
  `question_type_id` int(11) NOT NULL DEFAULT '1',
  `question` text,
  `choice` tinyint(4) DEFAULT '1' COMMENT '1=one  2=multiple',
  `remark` text,
  `upload_document` int(11) NOT NULL DEFAULT '1' COMMENT '1=Yes  2=No',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `input_format` varchar(50) DEFAULT NULL,
  `field_length` varchar(50) DEFAULT NULL,
  `upload` varchar(50) DEFAULT NULL,
  `sub_clause` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--CLAUSE

select distinct clause from qms

INSERT INTO clause (code,name) 
SELECT distinct qms.clause,concat('clause ',qms.clause)  FROM qms



--SUB CLAUSE

select distinct sub-clause from qms

INSERT INTO sub_clause (code,name,phase_id) 
SELECT distinct qms.sub_clause,qms.heading,phase  FROM qms

-- update the clause_id
update sub_clause
set clause_id = substring(sub_clause.code,1,1)

-- update the clause_id for clause 10
update sub_clause
set clause_id = 10 WHERE clause_id = 1


-- QUESTIONS
-- the question table is created with sub-clause information 
-- after another process will bring the right sub_clause_id in the table

insert into question (id,sub_clause,question,question_type_id,input_format,field_length,upload)
select qms.id,sub_clause,question,1,input_format,field_length,upload FROM qms

-- sub-clause_id treatment

UPDATE question 
SET sub_clause_id = (SELECT id from sub_clause WHERE code = question.sub_clause LIMIT 1)

-- indicate the text question type
UPDATE question
SET question_type_id = 2
WHERE field_length = 'textarea'

-- indicate the boolean question type
UPDATE question
SET question_type_id = 3
WHERE input_format = 'Boolean'

-- for the upload should be yes or no  (make sure it's the only possibility might be yes*etc..)
UPDATE question
SET upload_document = 1 
WHERE upload = 'yes'

UPDATE question
SET upload_document = 2
WHERE upload = 'no'

--- remove the field input_format field_length and upload in the table question (it was only for conversion purpose)


