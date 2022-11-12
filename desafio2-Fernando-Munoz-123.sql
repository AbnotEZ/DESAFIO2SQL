DESAFIO 2 - CONSULTAS AGRUPADAS
NOMBRE: Fernando Muñoz Castañeda

OBJETIVO : 
En este desafío validaremos los conocimientos de Consultas Agrupadas

DESARROLLO:

BASE DE DATOS
CREATE DATABASE desafio2_fernando_munoz_123;

\c desafio2_fernando_munoz_123;

TABLA
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);

INSERT
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );
 
●   ¿Cuántos registros hay?
    SELECT COUNT (*) AS total_registos FROM inscritos;

total_registos
----------------
             16
(1 fila)

●   ¿Cuántos inscritos hay en total?
    SELECT SUM(cantidad) AS total_inscritos FROM inscritos;

    total_inscritos
    ---------------
              774
    (1 fila)

●   ¿Cuál o cuáles son los registros de mayor antigüedad? HINT: ocupar subconsultas
    SELECT * FROM inscritos WHERE fecha = (SELECT min(fecha) FROM inscritos);

    cantidad |   fecha    | fuente
     --------+------------+--------
          44 | 2021-01-01 | Blog
          56 | 2021-01-01 | Página
      (2 filas)

●   ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
    SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha ASC;

    fecha    | sum
------------+-----
 2021-02-01 | 120 
 2021-08-01 | 182
 2021-05-01 |  88
 2021-04-01 |  93
 2021-06-01 |  30
 2021-07-01 |  58
 2021-03-01 | 103
 2021-01-01 | 100
(8 filas)

●   ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) FROM inscritos GROUP BY fuente;

 fuente | sum
--------+-----
 Página | 441
 Blog   | 333
(2 filas)

●   ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha ORDER BY total DESC LIMIT 1;

   fecha    | total
------------+-------
 2021-08-01 |   182
(1 fila)


●   ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT * from inscritos WHERE fuente = 'Blog' ORDER BY cantidad DESC LIMIT 1;

 cantidad |   fecha    | fuente
----------+------------+--------
       83 | 2021-08-01 | Blog
(1 fila)

●   ¿Cuántas personas en promedio se inscriben en un día?
SELECT ROUND(AVG(total),1) FROM (SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha) AS subconsulta;

 round
-------
  96.8
(1 fila)

●   ¿Qué días se inscribieron más de 50 personas?
SELECT FECHA, SUM(cantidad) AS total FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50  ORDER BY total ASC; 

   fecha    | total
------------+-------
 2021-07-01 |    58
 2021-05-01 |    88
 2021-04-01 |    93
 2021-01-01 |   100
 2021-03-01 |   103
 2021-02-01 |   120
 2021-08-01 |   182
(7 filas)

●   ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
    HINT: ingresa manualmente la fecha del tercer día

SELECT ROUND(AVG(TOTAL),1) FROM (SELECT SUM(CANTIDAD) AS TOTAL FROM INSCRITOS WHERE FECHA >= '01-03-2021' GROUP BY FECHA) AS PERSONAS;

 round
-------
  92.3
(1 fila)