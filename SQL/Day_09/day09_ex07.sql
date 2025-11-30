-- Exercise 07: function func_minimum (array of numbers) that returns the minimum value

/*
Функция принимает массив чисел и возвращает минимальное значение из массива.
VARIADIC позволяет функции принимать переменное количество аргументов, все аргументы объединяются в массив arr
Возвращает одно значение типа NUMERIC
UNNEST — встроенная функция PostgreSQL, которая разворачивает массив в набор строк
*/

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
    SELECT MIN(element)
    FROM UNNEST(arr) AS elements(element);
$$ 
LANGUAGE SQL;