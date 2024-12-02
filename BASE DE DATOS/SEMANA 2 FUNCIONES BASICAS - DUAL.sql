-- ###### Funciones Aritmetica
-- Calcula el valor absoluto de n.
select abs(-15) from dual;
-- Calcula el valor entero inmediatamente superior o igual a n.
select ceil(15.7) from dual;
-- Calcula el valor entero inmediatamente inferior o igual a n.
select floor(15.7) from dual;
-- Calcula la raíz cuadrada de n.
select sqrt(4) from dual;


-- ##### Funciones de Cadenas de Caracteres 
-- Devuelve el valor ASCII de n  Link: -- https://elcodigoascii.com.ar/#google_vignette
select chr(65) from dual;
-- Devuelve el codigo ASCII de n
select ascii('A') from dual;
-- Devuelve cad1 concatenada con cad2. Esta función es equivalente al operador ||.
SELECT 'HOLA ' || 'MUNDO'  FROM DUAL;
-- Devuelve la cadena cad con todas sus letras convertidas a minúsculas.
Select lower('MinUsCulAs') from dual;
-- Devuelve la cadena cad con todas susletras convertidas a mayúsculas.
Select upper('maYuSCulAs') from dual;
-- Devuelve cad con el primer carácter en mayúsculas.
select initcap('isabel') from dual;
-- Reemplaza todas las ocurrencias de un texto dentro de una cadena por otro texto.
SELECT REPLACE('Hola Mundo', 'Mundo', 'Amigo') AS resultado FROM dual;
-- Devuelve la longitud de cadena o campo.
Select length('cadena') from dual;


-- ##### Funciones de Manejo de Fechas
-- Devuelve la fecha actual.
select sysdate from dual;
-- Devuelve la fecha d incrementada en n meses.
Select add_months(sysdate, 4) from dual;
-- Devuelve la fecha del último día del mes de d.
Select last_day(sysdate) from dual;


-- ##### Funciones de Conversión de Tipos
-- Convertir una fecha a texto
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') AS fecha_texto  FROM dual;
-- Convertir texto a un número
SELECT TO_NUMBER('10') + 5 AS resultado FROM dual;
-- Convertir entre tipos con CAST
SELECT CAST(10 AS VARCHAR2(10)) AS numero_texto  FROM dual;
SELECT CAST('12345' AS NUMBER) + 5 AS numero_suma  FROM dual;