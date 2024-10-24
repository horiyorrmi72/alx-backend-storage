-- SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
-- Procedure AddBonus takes 3 inputs ( user_id, a users.id value, project_name, a new or already exists projects , score value for the correction)

DELIMITER //

CREATE PROCEDURE AddBonus(
    IN p_user_id INT,
    IN p_project_name VARCHAR(255),
    IN p_score DECIMAL(5,2)
)
BEGIN 
    DECLARE project_id INT;

    
    SELECT id INTO project_id 
    FROM projects 
    WHERE name = p_project_name;

   
    IF project_id IS NULL THEN
        INSERT INTO projects(name) VALUES (p_project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

   
    INSERT INTO corrections (user_id, project_id, score) 
    VALUES (p_user_id, project_id, p_score);
END; //

DELIMITER ;
