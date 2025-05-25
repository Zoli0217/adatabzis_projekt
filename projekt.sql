CREATE DATABASE nyomozas DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
use nyomozas;

CREATE TABLE Szemely(
  id integer PRIMARY KEY,
  nev VARCHAR(255),
  magassag integer,
  hajszin varchar(255),
  szemszin varchar(255),
  szuletesi_ev integer,
);

CREATE TABLE Detektiv(
  id integer PRIMARY KEY,
  nev varchar(255),
  tapasztalat_ev integer,
  szuletesi_ev integer
);

CREATE TABLE Allitas(
  id integer PRIMARY KEY,
  detektiv_id integer NOT NULL,
  szemely_id integer NOT NULL,
  allitas_szoveg text COMMENT 'A detektív által rögzített állítás',
  allitas_idopont timestamp
);

ALTER TABLE Allitas ADD FOREIGN KEY (detektiv_id) REFERENCES Detektiv(id);

ALTER TABLE Allitas ADD FOREIGN KEY (szemely_id) REFERENCES Szemely(id);


-- Szemely tábla feltöltése
INSERT INTO Szemely (id, nev, magassag, hajszin, szemszin, szuletesi_ev) VALUES
(1, 'Kovács Béla', 180, 'barna', 'kék', 1990),
(2, 'Nagy Anna', 165, 'szőke', 'zöld', 1995),
(3, 'Tóth Gábor', 175, 'fekete', 'barna', 1988),
(4, 'Szabó Júlia', 160, 'vörös', 'barna', 2000),
(5, 'Varga László', 185, 'barna', 'zöld', 1992),
(6, 'Kiss Petra', 170, 'szőke', 'kék', 1998),
(7, 'Molnár Bence', 178, 'fekete', 'fekete', 1985),
(8, 'Balogh Réka', 168, 'barna', 'barna', 1993),
(9, 'Simon Ádám', 172, 'szőke', 'kék', 1991),
(10, 'Farkas Eszter', 162, 'vörös', 'zöld', 1996);

-- Detektiv tábla feltöltése
INSERT INTO Detektiv (id, nev, tapasztalat_ev, szuletesi_ev) VALUES
(1, 'Nyomozó Jenő', 10, 1980),
(2, 'Horváth Laura', 5, 1987),
(3, 'Bognár Zoltán', 15, 1975);

-- Állítások
INSERT INTO Allitas (id, detektiv_id, szemely_id, allitas_szoveg, allitas_idopont) VALUES
(1, 1, 1, 'Nem volt a helyszínen az esemény idején.', '2025-05-17 10:15:00'),
(2, 2, 2, 'Gyanúsan viselkedett a kihallgatáson.', '2025-05-17 10:20:00'),
(3, 1, 3, 'Állítása szerint otthon volt, de nincs alibije.', '2025-05-17 10:25:00'),
(4, 3, 4, 'Látták elhagyni az épületet éjfél után.', '2025-05-17 10:30:00'),
(5, 2, 5, 'Tagadta, hogy ismerte volna az áldozatot.', '2025-05-17 10:35:00'),
(6, 1, 6, 'Nem működött együtt a nyomozókkal.', '2025-05-17 10:40:00'),
(7, 3, 7, 'Megpróbált elrejteni egy bizonyítékot.', '2025-05-17 10:45:00'),
(8, 2, 8, 'Telefonja nem volt bekapcsolva a kérdéses időben.', '2025-05-17 10:50:00'),
(9, 1, 9, 'Többször ellentmondott saját magának.', '2025-05-17 10:55:00'),
(10, 3, 10, 'Nem volt hajlandó válaszolni minden kérdésre.', '2025-05-17 11:00:00');

-- Állitasok 2
INSERT INTO Allitas (id, detektiv_id, szemely_id, allitas_szoveg, allitas_idopont) VALUES
(11, 2, 1, 'Túl pontosan emlékezett minden részletre.', '2025-05-17 11:05:00'),
(12, 1, 2, 'Az ujjlenyomatát megtalálták a bizonyítékon.', '2025-05-17 11:10:00'),
(13, 3, 3, 'Állítása szerint aludt, de senki nem igazolta.', '2025-05-17 11:15:00'),
(14, 1, 4, 'Az áldozattal korábban vitába keveredett.', '2025-05-17 11:20:00'),
(15, 2, 5, 'A ruháján vérnyomokat találtak.', '2025-05-17 11:25:00'),
(16, 3, 6, 'A mobiltelefonja adatai hiányosak voltak.', '2025-05-17 11:30:00'),
(17, 1, 7, 'Korábban már gyanúsították hasonló ügyben.', '2025-05-17 11:35:00'),
(18, 2, 8, 'Tagadta, hogy ott lett volna, de kamera rögzítette.', '2025-05-17 11:40:00'),
(19, 3, 9, 'Alibit szolgáltató személy nem volt megbízható.', '2025-05-17 11:45:00'),
(20, 1, 10, 'Nagyon ideges lett a kihallgatás során.', '2025-05-17 11:50:00');


--Allitasok 3
INSERT INTO Allitas (id, detektiv_id, szemely_id, allitas_szoveg, allitas_idopont) VALUES
(21, 2, 1, 'Az ujjlenyomata nem egyezett a helyszíni nyomokkal.', '2025-05-18 09:00:00'),
(22, 3, 2, 'Bevallotta, hogy veszekedtek az áldozattal.', '2025-05-18 09:05:00'),
(23, 1, 3, 'A tanúk látták a közelben az esemény idején.', '2025-05-18 09:10:00'),
(24, 2, 4, 'Az alibije összeegyeztethető a kamerafelvételekkel.', '2025-05-18 09:15:00'),
(25, 3, 5, 'Zavartan viselkedett a kihallgatás alatt.', '2025-05-18 09:20:00'),
(26, 1, 6, 'Az áldozat mobiltelefonjánál az ő hangja hallható.', '2025-05-18 09:25:00'),
(27, 2, 7, 'Letagadta, hogy járt volna a helyszínen.', '2025-05-18 09:30:00'),
(28, 3, 8, 'Ellentmondásba keveredett a vallomásában.', '2025-05-18 09:35:00'),
(29, 1, 9, 'Véletlenül elárult egy részletet, amit nem tudhatott volna.', '2025-05-18 09:40:00'),
(30, 2, 10, 'Fenyegető üzenetet küldött az áldozatnak korábban.', '2025-05-18 09:45:00'),
(31, 3, 1, 'Az ujjlenyomata megtalálható volt az áldozat holmiján.', '2025-05-18 09:50:00'),
(32, 1, 2, 'Több tanú is megerősítette, hogy nem volt ott.', '2025-05-18 09:55:00'),
(33, 2, 3, 'Megsemmisítette a cipőjét az eset után.', '2025-05-18 10:00:00'),
(34, 3, 4, 'Az alibije nem volt ellenőrizhető.', '2025-05-18 10:05:00'),
(35, 1, 5, 'A kabátján idegen szőrszálakat találtak.', '2025-05-18 10:10:00'),
(36, 2, 6, 'Beismerte, hogy aznap ittas volt.', '2025-05-18 10:15:00'),
(37, 3, 7, 'Megfigyelték, ahogy sietve távozik a helyszín közeléből.', '2025-05-18 10:20:00'),
(38, 1, 8, 'Vallomása túl általános volt, nem adott részleteket.', '2025-05-18 10:25:00'),
(39, 2, 9, 'Korábban konfliktusai voltak az áldozattal.', '2025-05-18 10:30:00'),
(40, 3, 10, 'Vérelemzést kértek a ruhájára.', '2025-05-18 10:35:00'),
(41, 1, 1, 'A mobilja helyadatai nem támasztották alá az alibijét.', '2025-05-18 10:40:00'),
(42, 2, 2, 'Később módosította a vallomását.', '2025-05-18 10:45:00'),
(43, 3, 3, 'Nem volt hajlandó részt venni a hazugságvizsgálaton.', '2025-05-18 10:50:00'),
(44, 1, 4, 'A ruházata megegyezett a biztonsági kamera felvételével.', '2025-05-18 10:55:00'),
(45, 2, 5, 'Megpróbált kapcsolatba lépni más tanúkkal.', '2025-05-18 11:00:00'),
(46, 3, 6, 'Kölcsönkérte egy barátja kocsiját aznap.', '2025-05-18 11:05:00'),
(47, 1, 7, 'Nem tudott magyarázatot adni a ruházatán lévő foltra.', '2025-05-18 11:10:00'),
(48, 2, 8, 'A kihallgatás előtt törölte az üzeneteit.', '2025-05-18 11:15:00'),
(49, 3, 9, 'Megpróbált elutazni másnap reggel.', '2025-05-18 11:20:00'),
(50, 1, 10, 'Más néven szerepelt egy szállodai bejelentkezésnél.', '2025-05-18 11:25:00');


--KÉRDÉSEK

--1. Melyik személyre tették a legtöbb állítást?
SELECT szemely_id, COUNT(*) AS allitasok_szama
FROM Allitas
GROUP BY szemely_id
ORDER BY allitasok_szama DESC
LIMIT 1;

--2. Volt-e olyan személy, akire minden detektív tett állítást?
SELECT szemely_id
FROM Allitas
GROUP BY szemely_id
HAVING COUNT(DISTINCT detektiv_id) = (SELECT COUNT(*) FROM Detektiv);

-- 3. Melyik detektív adott le a legtöbb állítást?
SELECT detektiv_id, COUNT(*) AS allitasok_szama
FROM Allitas
GROUP BY detektiv_id
ORDER BY allitasok_szama DESC;

-- 4. Kérdés: Mely állítások említik az "ujjlenyomat" szót?
SELECT szemely_id, allitas_szoveg
FROM Allitas
WHERE allitas_szoveg LIKE '%ujjlenyomat%';

--  5. Kérdés: Mely állítások utalnak arra, hogy valaki a helyszínen járt?
SELECT szemely_id, allitas_szoveg
FROM Allitas
WHERE allitas_szoveg LIKE '%helyszín%';


-- 6. Kérdés: Mely személyekről állította bárki, hogy "hazudott" vagy "ellentmondásos" a vallomása?
SELECT szemely_id, allitas_szoveg
FROM Allitas
WHERE allitas_szoveg LIKE '%hazudott%' OR allitas_szoveg LIKE '%ellentmondás%';


-- 7. Kérdés: Kik a leggyanúsabbak a megfogalmazás alapján (pl. ha az állításban szerepel "bűnös", "gyanús", "alibi hiánya")?
SELECT szemely_id, allitas_szoveg
FROM Allitas
WHERE allitas_szoveg LIKE '%bűnös%' 
OR allitas_szoveg LIKE '%gyanús%'
OR allitas_szoveg LIKE '%alibi%';