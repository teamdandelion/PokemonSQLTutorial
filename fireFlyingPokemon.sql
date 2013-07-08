SELECT snames.name, tnames.name
FROM pokemon_species_names as snames
	JOIN pokemon as p
		ON p.species_id = snames.pokemon_species_id
	JOIN pokemon_types as pt
		ON pt.pokemon_id = p.id
	JOIN type_names as tnames
		ON pt.type_id = tnames.type_id
	JOIN pokemon_species as species
		ON species.id = p.species_id
WHERE 
	tnames.local_language_id == 9 
	AND 
	(tnames.name == "Fire" OR tnames.name == "Flying") 
	AND
	snames.local_language_id == 9 
	AND 
	species.generation_id == 1;

-- CREATE TABLE pokemon_species (
-- 	id INTEGER NOT NULL, 
-- 	identifier VARCHAR(20) NOT NULL, 
-- 	generation_id INTEGER, 
-- 	evolves_from_species_id INTEGER, 
-- 	evolution_chain_id INTEGER, 
-- 	color_id INTEGER NOT NULL, 
-- 	shape_id INTEGER NOT NULL, 
-- 	habitat_id INTEGER, 
-- 	gender_rate INTEGER NOT NULL, 
-- 	capture_rate INTEGER NOT NULL, 
-- 	base_happiness INTEGER NOT NULL, 
-- 	is_baby BOOLEAN NOT NULL, 
-- 	hatch_counter INTEGER NOT NULL, 
-- 	has_gender_differences BOOLEAN NOT NULL, 
-- 	growth_rate_id INTEGER NOT NULL, 
-- 	forms_switchable BOOLEAN NOT NULL, 
-- 	"order" INTEGER NOT NULL, 
-- 	conquest_order INTEGER, 
-- 	PRIMARY KEY (id), 
-- 	FOREIGN KEY(generation_id) REFERENCES generations (id), 
-- 	FOREIGN KEY(evolves_from_species_id) REFERENCES pokemon_species (id), 
-- 	FOREIGN KEY(evolution_chain_id) REFERENCES evolution_chains (id), 
-- 	FOREIGN KEY(color_id) REFERENCES pokemon_colors (id), 
-- 	FOREIGN KEY(shape_id) REFERENCES pokemon_shapes (id), 
-- 	FOREIGN KEY(habitat_id) REFERENCES pokemon_habitats (id), 
-- 	CHECK (is_baby IN (0, 1)), 
-- 	CHECK (has_gender_differences IN (0, 1)), 
-- 	FOREIGN KEY(growth_rate_id) REFERENCES growth_rates (id), 
-- 	CHECK (forms_switchable IN (0, 1))
-- );

-- CREATE TABLE pokemon_species_names (
-- 	pokemon_species_id INTEGER NOT NULL, 
-- 	local_language_id INTEGER NOT NULL, 
-- 	name VARCHAR(20), 
-- 	genus VARCHAR(16), 
-- 	PRIMARY KEY (pokemon_species_id, local_language_id), 
-- 	FOREIGN KEY(pokemon_species_id) REFERENCES pokemon_species (id), 
-- 	FOREIGN KEY(local_language_id) REFERENCES languages (id)
-- );

-- CREATE TABLE pokemon_types (
-- 	pokemon_id INTEGER NOT NULL, 
-- 	type_id INTEGER NOT NULL, 
-- 	slot INTEGER NOT NULL, 
-- 	PRIMARY KEY (pokemon_id, slot), 
-- 	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
-- 	FOREIGN KEY(type_id) REFERENCES types (id)
-- );

-- CREATE TABLE type_names (
-- 	type_id INTEGER NOT NULL, 
-- 	local_language_id INTEGER NOT NULL, 
-- 	name VARCHAR(12) NOT NULL, 
-- 	PRIMARY KEY (type_id, local_language_id), 
-- 	FOREIGN KEY(type_id) REFERENCES types (id), 
-- 	FOREIGN KEY(local_language_id) REFERENCES languages (id)
-- );

-- CREATE TABLE pokemon (
-- 	id INTEGER NOT NULL, 
-- 	species_id INTEGER, 
-- 	height INTEGER NOT NULL, 
-- 	weight INTEGER NOT NULL, 
-- 	base_experience INTEGER NOT NULL, 
-- 	"order" INTEGER NOT NULL, 
-- 	is_default BOOLEAN NOT NULL, 
-- 	PRIMARY KEY (id), 
-- 	FOREIGN KEY(species_id) REFERENCES pokemon_species (id), 
-- 	CHECK (is_default IN (0, 1))
-- );