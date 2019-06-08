DROP TABLE member_score_ext;

CREATE EXTERNAL TABLE IF NOT EXISTS member_score_ext(
member_id STRING,
score BIGINT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/root/capstoneproject1/hivetables/member_score';

LOAD DATA INPATH '/user/root/capstoneproject1/alltables/member_score' OVERWRITE INTO TABLE member_score_ext;
