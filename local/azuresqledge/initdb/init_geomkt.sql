DROP DATABASE geomkt;
CREATE DATABASE geomkt;
USE geomkt;
CREATE SCHEMA nfo;

CREATE TABLE nfo.site (
  id int IDENTITY(0,1) NOT NULL,
  site_id VARCHAR(255) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  site_name VARCHAR(255) DEFAULT NULL
);

INSERT INTO nfo.site (site_id,created_date,site_name) VALUES
	 ('A437','2013-10-01 11:00:00','tana'),
	 ('B446','2015-10-01 11:00:00','tulear'),
--     ('C312','2022-10-01 00:00:00','diego'),
     ('E412','2022-05-01 00:00:00','diego');
