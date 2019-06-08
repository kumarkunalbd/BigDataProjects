set hive.exec.dynamic.partition =true;
set hive.exec.dynamic.partition.mode=nonstrict;

Create external table If not EXISTS card_member_ext_orc(
card_id String,
mamber_id double,
member_joining_dt TIMESTAMP,
card_purchase_dt STRING
) PARTITIONED BY (country String, city String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as orc
Location '/user/root/capstoneproject1/hivetables/card_member_ext_orc'
TBLPROPERTIES  ('orc.compress'='SNAPPY');

drop table card_member_ext_inc;

CREATE EXTERNAL TABLE card_member_ext_inc(
card_id String,member_id String,
member_joining_dt timestamp,card_purchase_dt STRING,
country String, city String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/root/capstoneproject1/alltables/card_member_inc/card_member';

INSERT overwrite TABLE card_member_ext_orc
PARTITION(country,city)
SELECT card_id,mamber_id,member_joining_dt,card_purchase_dt,country,city
FROM card_member_ext_inc ;

--SELECT * from partitioned_customer where country = 'india';

--SELECT * from customer where country = 'india';
