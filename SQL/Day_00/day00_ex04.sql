-- Exercise 04: build formatted person_information string with name, age, gender and address and sort by this column

SELECT 
    CONCAT(
        name, ' (age:', age, ',gender:''', gender, ''',address:''', address, ''')'
    ) AS person_information
FROM person
ORDER BY person_information ASC;