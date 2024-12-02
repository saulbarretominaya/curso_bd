ORDER CORRECTO DE LAS CLAUSUCLAS EN UNA CONSULTA SQL

SELECT Especifica las columnas o los valores que quieres recuperar.
FROM Especifica las tablas o vistas desde las cuales se van a obtener los datos.
JOIN (si es necesario) Especifica las uniones (joins) entre varias tablas, si se están combinando datos de varias fuentes.
WHERE Filtra las filas antes de cualquier agrupamiento o cálculo de funciones agregadas.
GROUP BY Agrupa las filas de la consulta en función de una o más columnas, comúnmente utilizado con funciones agregadas (SUM, COUNT, AVG, etc.).
HAVING Filtra los resultados después de que se haya hecho el agrupamiento. Se usa para aplicar condiciones a los grupos creados por el GROUP BY.
ORDER BY Ordena los resultados de la consulta según una o más columnas, en orden ascendente o descendente.
ROWNUM <= 1 - FETCH FIRST 1 ROWS ONLY Limita el número de filas que se devuelven como resultado.