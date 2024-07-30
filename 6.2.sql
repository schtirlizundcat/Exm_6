DELIMITER //

CREATE FUNCTION GetEvenIntegers(min_value INT, max_value INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE result TEXT DEFAULT '';
    DECLARE current INT;

    SET current = min_value;

    WHILE current <= max_value DO
        IF current % 2 = 0 THEN
            SET result = CONCAT(result, current, ', ');
        END IF;
        SET current = current + 1;
    END WHILE;

    IF LENGTH(result) > 0 THEN
        SET result = LEFT(result, LENGTH(result) - 2);
    END IF;
    
    RETURN result;
END //

CREATE PROCEDURE GetEvenIntegersFromRange(IN min_value INT, IN max_value INT, OUT result VARCHAR(255))
BEGIN
    SET result = GetEvenIntegers(min_value, max_value);
END //

DELIMITER ;

CALL GetEvenIntegersFromRange(1, 10, @output);
SELECT @output AS EvenIntegers;
