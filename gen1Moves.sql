.mode column
.headers on

SELECT move_names.name, type_names.name
FROM move_names 
	JOIN moves 
		ON moves.id = move_names.move_id
	JOIN type_names ON moves.type_id = type_names.type_id
WHERE move_names.local_language_id == 9 
	AND moves.generation_id == 1
	AND type_names.local_language_id == 9
ORDER BY type_names.type_id
;

-- CREATE TABLE pokemon_species_names (
-- 	pokemon_species_id INTEGER NOT NULL, 
-- 	local_language_id INTEGER NOT NULL, 
-- 	name VARCHAR(20), 
-- 	genus VARCHAR(16), 
-- 	PRIMARY KEY (pokemon_species_id, local_language_id), 
-- 	FOREIGN KEY(pokemon_species_id) REFERENCES pokemon_species (id), 
-- 	FOREIGN KEY(local_language_id) REFERENCES languages (id)
-- );
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
-- CREATE TABLE moves (
-- 	id INTEGER NOT NULL, 
-- 	identifier VARCHAR(24) NOT NULL, 
-- 	generation_id INTEGER NOT NULL, 
-- 	type_id INTEGER NOT NULL, 
-- 	power SMALLINT NOT NULL, 
-- 	pp SMALLINT, 
-- 	accuracy SMALLINT, 
-- 	priority SMALLINT NOT NULL, 
-- 	target_id INTEGER NOT NULL, 
-- 	damage_class_id INTEGER NOT NULL, 
-- 	effect_id INTEGER NOT NULL, 
-- 	effect_chance INTEGER, 
-- 	contest_type_id INTEGER, 
-- 	contest_effect_id INTEGER, 
-- 	super_contest_effect_id INTEGER, 
-- 	PRIMARY KEY (id), 
-- 	FOREIGN KEY(generation_id) REFERENCES generations (id), 
-- 	FOREIGN KEY(type_id) REFERENCES types (id), 
-- 	FOREIGN KEY(target_id) REFERENCES move_targets (id), 
-- 	FOREIGN KEY(damage_class_id) REFERENCES move_damage_classes (id), 
-- 	FOREIGN KEY(effect_id) REFERENCES move_effects (id), 
-- 	FOREIGN KEY(contest_type_id) REFERENCES contest_types (id), 
-- 	FOREIGN KEY(contest_effect_id) REFERENCES contest_effects (id), 
-- 	FOREIGN KEY(super_contest_effect_id) REFERENCES super_contest_effects (id)
-- );

-- CREATE TABLE move_names (
-- 	move_id INTEGER NOT NULL, 
-- 	local_language_id INTEGER NOT NULL, 
-- 	name VARCHAR(24) NOT NULL, 
-- 	PRIMARY KEY (move_id, local_language_id), 
-- 	FOREIGN KEY(move_id) REFERENCES moves (id), 
-- 	FOREIGN KEY(local_language_id) REFERENCES languages (id)
-- );

-- CREATE TABLE pokemon_moves (
-- 	pokemon_id INTEGER NOT NULL, 
-- 	version_group_id INTEGER NOT NULL, 
-- 	move_id INTEGER NOT NULL, 
-- 	pokemon_move_method_id INTEGER NOT NULL, 
-- 	level INTEGER, 
-- 	"order" INTEGER, 
-- 	PRIMARY KEY (pokemon_id, version_group_id, move_id, pokemon_move_method_id, level), 
-- 	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
-- 	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
-- 	FOREIGN KEY(move_id) REFERENCES moves (id), 
-- 	FOREIGN KEY(pokemon_move_method_id) REFERENCES pokemon_move_methods (id)
-- );