-- Exercise 08: function fnc_fibonacci(pstop) returning all Fibonacci numbers less than pstop

/*
Функция возвращает таблицу всех чисел Фибоначчи, которые меньше значения pstop
BIGINT используется для работы с большими числами, так как числа Фибоначчи быстро растут
*/

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib BIGINT) 
AS $$
WITH RECURSIVE fibonacci (a, b) AS (
    SELECT 0 AS a, 1 AS b
    UNION ALL
    SELECT b, a + b
    FROM fibonacci
    WHERE b < pstop
)
SELECT a
FROM fibonacci;
$$ 
LANGUAGE SQL;