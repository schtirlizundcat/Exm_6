create database Exercise1_1;
use Exercise1_1;

DELIMITER //

CREATE FUNCTION `convert_seconds_to_dhms`(seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    
    SET days = FLOOR(seconds / 86400);
    SET remaining_seconds = seconds % 86400;
    
    SET hours = FLOOR(remaining_seconds / 3600);
    SET remaining_seconds = remaining_seconds % 3600;
    
    SET minutes = FLOOR(remaining_seconds / 60);
    SET remaining_seconds = remaining_seconds % 60;
    
    RETURN CONCAT(
        IF(days > 0, CONCAT(days, ' days '), ''),
        IF(hours > 0, CONCAT(hours, ' hours '), ''),
        IF(minutes > 0, CONCAT(minutes, ' minutes '), ''),
        CONCAT(remaining_seconds, ' seconds')
    );
END //

DELIMITER ;


SELECT convert_seconds_to_dhms(123456);

