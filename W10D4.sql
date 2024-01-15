CREATE DATABASE W10D4_AEROPORTO
USE W10D4_AEROPORTO;
CREATE TABLE AEROPORTO
(
Citta varchar (100), Nazione varchar (100),NumPiste integer
);
CREATE TABLE VOLO
(
IdVolo varchar (100) PRIMARY KEY (IdVolo),
GiornoSett date,
CittaPart varchar (100),
OraPart time,
CittaArr varchar (100),
OraArr time,
TipoAereo varchar(100)
);
CREATE TABLE AEREO
(
TipoAereo varchar,NumPasseggeri integer,QtaMerci numeric (5,00)
);
INSERT INTO AEROPORTO
(
Citta, Nazione, NumPiste
)
VALUES
(
'Venezia', 'Italia', 15
);
INSERT INTO AEROPORTO
(
Citta, Nazione, NumPiste
)
VALUES
(
'Londra', 'Inghilterra', ''
),
(
'Roma', 'Italia', 25
),
(
'New York', 'USA', 100
),
(
'Lisbona', 'Portogallo', 15
),
(
'Parigi', 'Francia', ''
);

INSERT INTO AEROPORTO
(
Citta, Nazione, NumPiste
)
VALUES
(
'Torino', 'Italia', ''
),
(
'Bologna', 'Italia', 20
);

SELECT 
*FROM AEROPORTO
WHERE NumPiste =0;

INSERT INTO VOLO
(
IdVolo, GiornoSett, CittaPart, OraPart, CittaArr, OraArr, TipoAereo
)
VALUES
(
'AZ274', '01/01/2024', 'Torino', '08:00:00', 'Londra', '10:00:00', 'Boing771'
);

 INSERT INTO VOLO
(
IdVolo, GiornoSett, CittaPart, OraPart, CittaArr, OraArr, TipoAereo
)
VALUES
(
'AB123', '02/01/2024', 'Bologna', '09:00:00', 'Roma', '12:00:00', 'Deltaplano'
),
(
'AC456', '03/01/2024', 'New York', '03:00:00', 'Parigi', '16:00:00', 'Mongolfiera'
),
(
'AD789', '05/01/2024', 'Venezia', '14:00:00', 'Torino', '16:00:00', 'Boing771'
),
(
'AE012', '05/01/2024', 'Rosolina', '4:00:00', 'Villaggio Babbo Vamale', '2:00:00', 'Slitta con le renne'
),
(
'AF345', '09/01/2024', 'Bologna', '11:00:00', 'Faenza', '17:00:00', 'Elicottero'
);


SELECT
*FROM VOLO;

SELECT
TipoAereo
FROM VOLO
WHERE CittaPart='Torino';

SELECT
*FROM VOLO
WHERE CittaPart='Bologna';


SELECT
GiornoSett, OraPart, TipoAereo
FROM VOLO
WHERE CittaPart like 'B%' AND CittaPart like '%o%' AND CittaArr like '%a' and CittaArr like '%e%';

select
    giornosett
  , orapart
  , tipoaereo
from volo
where 1=1
  and upper(CittaPart) like 'B%O%'
  and upper(CittaArr) like '%E%A'
;