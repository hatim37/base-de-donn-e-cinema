
/*///--------- Création de la base de données cinema ---------//*/
CREATE DATABASE IF NOT EXISTS cinema 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_general_ci;



/*///--------- Création des tables ---------//*/

CREATE TABLE Client (
    id_client INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom VARCHAR (20) NOT NULL,
    Prénom VARCHAR (20) NOT NULL,
    Adresse text NOT NULL,
    Email varchar(50) NOT NULL,
    Téléphone varchar(10) NOT NULL,
    Mot_de_passe varchar(255) NOT NULL
    )engine=INNODB;


CREATE TABLE Complexe (
    id_complexe INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom varchar(20)
    )engine=INNODB;  


CREATE TABLE Reservation (
    id_reservation INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_client int NOT NULL,
    id_complexe int NOT NULL,
    Quantité_réserver int NOT NULL,
    Date_réservation date NOT NULL,
    CONSTRAINT FOREIGN KEY (id_client) REFERENCES client (id_client) on DELETE CASCADE on UPDATE CASCADE, 
    CONSTRAINT FOREIGN KEY (id_complexe) REFERENCES complexe (id_complexe) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;


CREATE TABLE Cinema (
    id_cinema INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR (20) NOT NULL,
    adresse varchar(60) NOT NULL,
    code_Postale int NOT NULL,
    ville varchar(20) NOT NULL,
    Nbr_de_salle int NOT NULL,
    id_complexe int NOT NULL,
    CONSTRAINT FOREIGN KEY (id_complexe) REFERENCES complexe (id_complexe) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;

CREATE TABLE Salle (
    id_salle INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom varchar(20) NOT NULL,
    Nbr_de_place int NOT NULL
    )engine=INNODB;

CREATE TABLE Capacite (
    id_cinema int NOT NULL,
    id_salle int NOT NULL,
    PRIMARY KEY (id_cinema, id_salle),
    CONSTRAINT FOREIGN KEY (id_cinema) REFERENCES cinema (id_cinema) on DELETE CASCADE on UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (id_salle) REFERENCES salle (id_salle) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;

CREATE TABLE Film (
    id_film INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Genre varchar(100) NOT NULL,
    Titre varchar(100) NOT NULL,
    Date_de_sortie date NOT NULL,
    Réalisateur varchar(50)NOT NULL,
    Durée varchar(30) NOT NULL,
    Acteur text NOT NULL,
    image BLOB,
    Description text NOT NULL
    )engine=INNODB;

CREATE TABLE Affiche ( 
    id_cinema int NOT NULL,
    id_film int NOT NULL,
    PRIMARY KEY (id_cinema, id_film),
    CONSTRAINT FOREIGN KEY (id_cinema) REFERENCES cinema (id_cinema) on DELETE CASCADE on UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (id_film) REFERENCES film (id_film) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;


CREATE TABLE Seance (
    id_seance int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_film int NOT NULL,
    Date date NOT NULL,
    Horaire time NOT NULL,
    CONSTRAINT FOREIGN KEY (id_film) REFERENCES film (id_film) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;

CREATE TABLE Tarif (
    id_tarif INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Description text NOT NULL,
    Prix float NOT NULL
    )engine=INNODB;

CREATE TABLE tarif_seance (
    id_seance int NOT NULL,
    id_tarif int NOT NULL,
    PRIMARY KEY (id_seance, id_tarif),
    CONSTRAINT FOREIGN KEY (id_seance) REFERENCES seance (id_seance) on DELETE CASCADE on UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (id_tarif) REFERENCES tarif (id_tarif) on DELETE CASCADE on UPDATE CASCADE
    )engine=INNODB;


   



/*///--------- insertion de données ---------//*/

INSERT INTO client (nom, prénom, adresse, email, téléphone, mot_de_passe)
 VALUES 
 ('Andriette', 'Marc', 'Apt 854', 'amarc0@lulu.com', '1947732913', '$2y$10$NqA1BWE.Vd6pPgkzsWvtje06kWyjkCIOal/NscM0Koy18RE0brUOu'),
 ('Maure', 'Emmitt', 'Apt 93', 'memmitt1@technorati.com', '2249150978', '$2y$10$vp9B128F/8yBWfWKBWYPdu4Mx28dYs/2lmDAi8IqSOShJEMilxiuO'),
 ('Miriam', 'Walkley', 'Apt 1320', 'mwalkley2@huffingtonpost.com', '6497247619', '$2y$10$P/IQ2dbtAwLw9lOEPARE2OqVlEgRX.aTmbN8wxehX20qhBIa1Zt5i'),
 ('Viv', 'Lafayette', '12th Floor', 'vlafayette3@live.com', '8898347460', '$2y$10$ecRzstuN55Jn.QjL5ZrdieEQlYZ0PM0uw.e3my59rhvycOFJjMdYS'),
 ('Sybille', 'Beldam', 'Suite 61', 'sbeldam4@dyndns.org', '6823365689', '$2y$10$igD2VquDvCGhplwrWVoA0.fAJEDc11RS38NlBce.4eORPbWDlyGRe');


INSERT INTO complexe (nom)
VALUES
('GroupeVison Cinéma');

INSERT INTO cinema ( nom, adresse, code_Postale, ville, Nbr_de_salle, id_complexe)
VALUES
('Cinéma Le Mans', '11, Rue du Port', '72000','Le Mans', '9', '1'),
('Cinéma de Tours', '10, rue Gamgetta', '37000', 'Tours','11', '1'),
('Cinéma de Bourges', 'ZAC du Prado', '18000', 'Bourges','12', '1'),
('Cinéma de Poitiers', '24 Pl. du Maréchal-Leclerc', '86000', 'Poitiers', '8', '1'),
('Cinéma de Bordeaux', '9 Rue Montesquieu', '33000', 'Bordeaux','15', '1');

INSERT INTO salle (Nom, Nbr_de_place) 
VALUES 
('Epsom', 75),
('DRY', 78),
('ACETAM', 87),
('Vanilla', 44),
('Metro', 80),
('DAMBAR', 76),
('Mavik', 53),
('Oxacillin', 56),
('Xodol', 61),
('EQUALINE', 83),
('Alacort', 53),
('Soleil', 99),
('Zole', 77),
('MEDI', 19),
('Olive', 100);

INSERT INTO Capacite (id_cinema, id_salle) 
VALUES 
('1', '3'), ('1', '4'), ('1', '7'), ('1', '8'), ('1', '10'), ('1', '11'), ('1', '12'), ('1', '13'), ('1', '15'), 
('2', '2'), ('2', '3'), ('2', '6'), ('2', '7'), ('2', '9'), ('2', '10'), ('2', '12'), ('2', '13'), ('2', '15'), 
('3', '3'), ('3', '4'), ('3', '7'), ('3', '8'), ('3', '9'), ('3', '11'), ('3', '12'), ('3', '13'), ('3', '15');


INSERT INTO film (genre, titre, date_de_sortie, réalisateur, durée, acteur, description) 
VALUES 
('Action, aventure, fantastique, science-fiction',
 'AVATAR : LA VOIE DE L''EAU',
 '2022-12-14',
 'James Cameron', 
 '3h12', 
 'Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang, Kate Winslet', 
 'Se déroulant plus d''une décennie après les événements relatés dans le premier film, 
 AVATAR : LA VOIE DE L''EAU raconte l''histoire des membres de la famille Sully (Jake, Neytiri et leurs enfants), 
 les épreuves auxquelles ils sont confrontés, les chemins qu''ils doivent emprunter pour se protéger les uns les autres, 
 les batailles qu''ils doivent mener pour rester en vie et les tragédies qu''ils endurent.'),

 ('Drame, Historique, guerre',
 'TIRAILLEURS',
 '2023-01-04',
 'Mathieu Vadepied', 
 '1h40', 
 'Omar Sy, Alassane Diong, Jonas Bloquet, Bamar Kane, Alassane Sy', 
 '1917. Bakary Diallo s''enrôle dans l''armée française pour rejoindre Thierno,
  son fils de 17 ans, qui a été recruté de force. Envoyés sur le front, 
  père et fils vont devoir affronter la guerre ensemble. Galvanisé par la fougue 
  de son officier qui veut le conduire au cœur de la bataille, 
  Thierno va s''affranchir et apprendre à devenir un homme, 
  tandis que Bakary va tout faire pour l''arracher aux combats et le ramener sain et sauf.'),

 ('Aventure, Animation, Famille',
 'LE ROYAUME DES ÉTOILES',
 '2022-12-07',
 'Ali Samadi Ahadi', 
 '1h25', 
 'Maxime Donnay, Benoit Van Dorslaer, Aaricia Dubois, Daniel Nicodéme, Jean-Michel Vovk', 
 'Et si votre petite sœur disparaissait soudainement au beau milieu de la nuit ? 
 Et si vous deviez partir sur la lune et la rechercher dans le royaume des étoiles ? 
 C''est ce qui arrive à Peter, et le temps est compté pour la retrouver avant le lever du jour… 
 À bord du traîneau magique du Marchand de sable, que la grande course commence !'),

 ('Comédie',
 'RESTE UN PEU',
 '2022-11-16',
 'Gad Elmaleh', 
 '1h33', 
 'Gad Elmaleh, Régine Elmaleh, David Elmaleh, Judith Elmaleh, Pierre-henry Salfati', 
 'Après trois années à vivre l''« American dream » Gad Elmaleh décide de rentrer en France. 
 Sa famille et ses amis lui manquent. Du moins, c''est la réponse officielle pour justifier son retour… 
 car Gad n''est pas (seulement) rentré pour le couscous de sa mère. 
 Non, c''est une autre femme qu''il vient retrouver à Paris… la Vierge Marie.'),

  ('Aventure, Animation, fantastique',
 'UNICORN WARS',
 '2022-12-28',
 ' Alberto Vázquez (II)', 
 '1h32', 
 'Ramon Barea', 
 'En ces contrées reculées, Oursons et Licornes sont en guerre depuis toujours. 
 Le soldat Célestin a soif du sang des Licornes, gage d''une beauté éternelle, 
 selon le Grand Livre Sacré. Son frère Dodu, lui, n''aime pas la guerre, 
 il préfère les myrtilles et les câlins. Mais la bataille finale approche : 
 une unité d''oursons inexpérimentés quitte le camp d''entraînement pour une 
 mission commando dans la Forêt Magique. Seront-ils à la hauteur ?');

INSERT INTO affiche (id_cinema, id_film) 
VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '2'),
('3', '3'),
('4', '4');


INSERT INTO seance (id_film, date, horaire) 
VALUES 
('1', '2023-01-15', '18:15:00'),
('1', '2023-01-15', '20:30:00'),
('1', '2023-01-15', '22:15:00'),
('2', '2023-01-15', '18:15:00'),
('2', '2023-01-15', '20:30:00'),
('2', '2023-01-15', '22:15:00'),
('3', '2023-01-15', '18:15:00'),
('3', '2023-01-15', '20:30:00'),
('3', '2023-01-15', '22:15:00');

INSERT INTO tarif (description, prix) 
VALUES 
('Plein tarif:', '9.20'),
('Étudiant:', '7.60'),
('Moins de 14 ans:', '5.90');

INSERT INTO tarif_seance (id_seance, id_tarif) 
VALUES 
('1', '1'),
('1', '2'),
('1', '3'),

('2', '1'),
('2', '2'),
('2', '3'),

('3', '1'),
('3', '2'),
('3', '3');

/*///--------- Création des utilisateurs ---------//*/

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION; 

CREATE USER 'cinema'@'localhost' IDENTIFIED BY 'cinema';
GRANT SELECT, UPDATE, DELETE, INSERT
  ON cinema.affiche TO 'cinema'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT
  ON cinema.seance TO 'cinema'@'localhost';

