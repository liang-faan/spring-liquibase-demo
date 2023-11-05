-- *********************************************************************
-- SQL to roll back currently unexecuted changes
-- *********************************************************************
-- Change Log: classpath:db/changelog/db.changelog-master.xml
-- Ran at: 4/11/23, 4:46 pm
-- Against: SA@jdbc:h2:~/liquibase
-- Liquibase version: 4.20.0
-- *********************************************************************

-- Lock Database
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = TRUE, LOCKEDBY = 'Liangs-MacBook-Pro.local (192.168.0.168)', LOCKGRANTED = NOW() WHERE ID = 1 AND LOCKED = FALSE;

-- Release Database Lock
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

