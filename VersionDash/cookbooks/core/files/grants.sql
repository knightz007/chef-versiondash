
GRANT ALL ON *.* TO 'dashuser'@'localhost' IDENTIFIED BY 'dpass';
GRANT ALL ON *.* TO 'dashuser'@'%' IDENTIFIED BY 'dpass';
-- CREATE USER IF NOT EXISTS 'dashuser'@'localhost' IDENTIFIED BY 'dpass';
-- CREATE USER IF NOT EXISTS 'dashuser'@'%' IDENTIFIED BY 'dpass';
REVOKE ALL ON *.* FROM 'dashuser'@'localhost';
REVOKE ALL ON *.* FROM 'dashuser'@'%';
GRANT ALL ON *.* TO 'dashuser'@'localhost';
GRANT ALL ON *.* TO 'dashuser'@'%';
FLUSH PRIVILEGES;
