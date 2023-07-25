CREATE TABLE etablissement_scolaire (
    id_etablissement SERIAL PRIMARY KEY,
    nom_etablissement VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    coordonnees_geographiques VARCHAR(255) NOT NULL
);


CREATE TABLE classe_scolaire (
    id_classe SERIAL PRIMARY KEY,
    nom_classe VARCHAR(50) NOT NULL,
    etablissement_id INTEGER REFERENCES etablissement_scolaire(id_etablissement)
);


CREATE TABLE eleve (
    id_eleve SERIAL PRIMARY KEY,
    nom_eleve VARCHAR(100) NOT NULL,
    prenom_eleve VARCHAR(100) NOT NULL,
    adresse_eleve VARCHAR(255) NOT NULL,
    classe_id INTEGER REFERENCES classe_scolaire(id_classe)
); 

CREATE TABLE agence_touristique (
    id_agence SERIAL PRIMARY KEY,
    nom_agence VARCHAR(255) NOT NULL,
    adresse_agence VARCHAR(255) NOT NULL,
    coordonnees_geographiques_agence VARCHAR(255) NOT NULL
); 


CREATE TABLE bus_touristique (
    id_bus SERIAL PRIMARY KEY,
    modele_bus VARCHAR(100) NOT NULL,
    capacite_bus INTEGER NOT NULL,
    agence_id INTEGER REFERENCES agence_touristique(id_agence)
);


CREATE TABLE trajet_scolaire (
    id_trajet SERIAL PRIMARY KEY,
    classe_id INTEGER REFERENCES classe_scolaire(id_classe),
    bus_id INTEGER REFERENCES bus_touristique(id_bus)
);
