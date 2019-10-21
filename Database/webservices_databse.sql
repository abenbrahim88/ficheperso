
CREATE TABLE Civilite (
    id_civilite INT NOT NULL IDENTITY PRIMARY KEY,
    libelle varchar(32)  NOT NULL
);

-- Table: Persone
CREATE TABLE Personne (
    id_personne INT NOT NULL IDENTITY PRIMARY KEY,
    nom varchar(32)  NOT NULL,
    prenom varchar(32)  NOT NULL,
    date_naissance date  NOT NULL,
    departement_naissance int  NOT NULL,
    ville_naissance varchar(32)  NOT NULL,
    adresse text  NOT NULL,
    code_postal INT  NOT NULL,
    ville varchar(32)  NOT NULL,
    id_civilite INT NOT NULL FOREIGN KEY REFERENCES Civilite(id_civilite)
);

