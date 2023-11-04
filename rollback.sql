-- *********************************************************************
-- SQL to roll back currently unexecuted changes
-- *********************************************************************
-- Change Log: classpath:db/changelog/db.changelog-master.xml
-- Ran at: 4/11/23, 1:40 pm
-- Against: SA@jdbc:h2:~/liquibase
-- Liquibase version: 4.20.0
-- *********************************************************************

-- Lock Database
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = TRUE, LOCKEDBY = 'Liangs-MacBook-Pro.local (192.168.0.168)', LOCKGRANTED = NOW() WHERE ID = 1 AND LOCKED = FALSE;

-- Rolling Back ChangeSet: db/changelog/db.changelog-master.xml::tagdb_v2.2.4::dennyliang
DELETE FROM PUBLIC.DATABASECHANGELOG WHERE ID = 'tagdb_v2.2.4' AND AUTHOR = 'dennyliang' AND FILENAME = 'db/changelog/db.changelog-master.xml';

-- Rolling Back ChangeSet: db/changelog/db.changelog-master.xml::inset_record::dennyliang
DELETE FROM PUBLIC.item WHERE house_id=(select id from house where owner='testowner1');

DELETE FROM PUBLIC.house WHERE owner = 'testowner1';

DELETE FROM PUBLIC.DATABASECHANGELOG WHERE ID = 'inset_record' AND AUTHOR = 'dennyliang' AND FILENAME = 'db/changelog/db.changelog-master.xml';

-- Rolling Back ChangeSet: db/changelog/db.changelog-master.xml::tagdb_v2.2.3::dennyliang
DELETE FROM PUBLIC.DATABASECHANGELOG WHERE ID = 'tagdb_v2.2.3' AND AUTHOR = 'dennyliang' AND FILENAME = 'db/changelog/db.changelog-master.xml';

-- Rolling Back ChangeSet: db/changelog/db.changelog-master.xml::202010211812::Julius Krah
ALTER TABLE PUBLIC.item DROP CONSTRAINT item_house_id_fk;

DROP SEQUENCE PUBLIC.hibernate_sequence;

DROP TABLE PUBLIC.item;

DROP TABLE PUBLIC.house;

DELETE FROM PUBLIC.DATABASECHANGELOG WHERE ID = '202010211812' AND AUTHOR = 'Julius Krah' AND FILENAME = 'db/changelog/db.changelog-master.xml';

-- Rolling Back ChangeSet: db/changelog/db.changelog-master.xml::tagdb::dennyliang
DELETE FROM PUBLIC.DATABASECHANGELOG WHERE ID = 'tagdb' AND AUTHOR = 'dennyliang' AND FILENAME = 'db/changelog/db.changelog-master.xml';

-- Release Database Lock
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

