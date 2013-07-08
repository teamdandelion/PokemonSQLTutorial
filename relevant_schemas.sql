
CREATE TABLE egg_group_prose (
	egg_group_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (egg_group_id, local_language_id), 
	FOREIGN KEY(egg_group_id) REFERENCES egg_groups (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE egg_groups (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE encounter_condition_prose (
	encounter_condition_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (encounter_condition_id, local_language_id), 
	FOREIGN KEY(encounter_condition_id) REFERENCES encounter_conditions (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE encounter_condition_value_map (
	encounter_id INTEGER NOT NULL, 
	encounter_condition_value_id INTEGER NOT NULL, 
	PRIMARY KEY (encounter_id, encounter_condition_value_id), 
	FOREIGN KEY(encounter_id) REFERENCES encounters (id), 
	FOREIGN KEY(encounter_condition_value_id) REFERENCES encounter_condition_values (id)
);
CREATE TABLE encounter_condition_value_prose (
	encounter_condition_value_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (encounter_condition_value_id, local_language_id), 
	FOREIGN KEY(encounter_condition_value_id) REFERENCES encounter_condition_values (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE encounter_condition_values (
	id INTEGER NOT NULL, 
	encounter_condition_id INTEGER NOT NULL, 
	identifier VARCHAR(64) NOT NULL, 
	is_default BOOLEAN NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(encounter_condition_id) REFERENCES encounter_conditions (id), 
	CHECK (is_default IN (0, 1))
);
CREATE TABLE encounter_conditions (
	id INTEGER NOT NULL, 
	identifier VARCHAR(64) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE encounter_method_prose (
	encounter_method_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (encounter_method_id, local_language_id), 
	FOREIGN KEY(encounter_method_id) REFERENCES encounter_methods (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE encounter_methods (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	"order" INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (identifier), 
	UNIQUE ("order")
);
CREATE TABLE encounter_slots (
	id INTEGER NOT NULL, 
	version_group_id INTEGER NOT NULL, 
	encounter_method_id INTEGER NOT NULL, 
	slot INTEGER, 
	rarity INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(encounter_method_id) REFERENCES encounter_methods (id)
);
CREATE TABLE encounters (
	id INTEGER NOT NULL, 
	version_id INTEGER NOT NULL, 
	location_area_id INTEGER NOT NULL, 
	encounter_slot_id INTEGER NOT NULL, 
	pokemon_id INTEGER NOT NULL, 
	min_level INTEGER NOT NULL, 
	max_level INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(version_id) REFERENCES versions (id), 
	FOREIGN KEY(location_area_id) REFERENCES location_areas (id), 
	FOREIGN KEY(encounter_slot_id) REFERENCES encounter_slots (id), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id)
);
CREATE TABLE evolution_chains (
	id INTEGER NOT NULL, 
	baby_trigger_item_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(baby_trigger_item_id) REFERENCES items (id)
);
CREATE TABLE evolution_trigger_prose (
	evolution_trigger_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (evolution_trigger_id, local_language_id), 
	FOREIGN KEY(evolution_trigger_id) REFERENCES evolution_triggers (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE evolution_triggers (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE experience (
	growth_rate_id INTEGER NOT NULL, 
	level INTEGER NOT NULL, 
	experience INTEGER NOT NULL, 
	PRIMARY KEY (growth_rate_id, level), 
	FOREIGN KEY(growth_rate_id) REFERENCES growth_rates (id)
);
CREATE TABLE genders (
	id INTEGER NOT NULL, 
	identifier VARCHAR(10) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE generation_names (
	generation_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (generation_id, local_language_id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE generations (
	id INTEGER NOT NULL, 
	main_region_id INTEGER NOT NULL, 
	canonical_pokedex_id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(main_region_id) REFERENCES regions (id), 
	FOREIGN KEY(canonical_pokedex_id) REFERENCES pokedexes (id)
);
CREATE TABLE growth_rate_prose (
	growth_rate_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(20) NOT NULL, 
	PRIMARY KEY (growth_rate_id, local_language_id), 
	FOREIGN KEY(growth_rate_id) REFERENCES growth_rates (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE growth_rates (
	id INTEGER NOT NULL, 
	identifier VARCHAR(20) NOT NULL, 
	formula VARCHAR(500) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE language_names (
	language_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (language_id, local_language_id), 
	FOREIGN KEY(language_id) REFERENCES languages (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE languages (
	id INTEGER NOT NULL, 
	iso639 VARCHAR(2) NOT NULL, 
	iso3166 VARCHAR(2) NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	official BOOLEAN NOT NULL, 
	"order" INTEGER, 
	PRIMARY KEY (id), 
	CHECK (official IN (0, 1))
);
CREATE TABLE location_area_encounter_rates (
	location_area_id INTEGER NOT NULL, 
	encounter_method_id INTEGER NOT NULL, 
	version_id INTEGER NOT NULL, 
	rate INTEGER, 
	PRIMARY KEY (location_area_id, encounter_method_id, version_id), 
	FOREIGN KEY(location_area_id) REFERENCES location_areas (id), 
	FOREIGN KEY(encounter_method_id) REFERENCES encounter_methods (id), 
	FOREIGN KEY(version_id) REFERENCES versions (id)
);
CREATE TABLE location_area_prose (
	location_area_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (location_area_id, local_language_id), 
	FOREIGN KEY(location_area_id) REFERENCES location_areas (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE location_areas (
	id INTEGER NOT NULL, 
	location_id INTEGER NOT NULL, 
	game_index INTEGER NOT NULL, 
	identifier VARCHAR(64), 
	PRIMARY KEY (id), 
	FOREIGN KEY(location_id) REFERENCES locations (id)
);
CREATE TABLE location_game_indices (
	location_id INTEGER NOT NULL, 
	generation_id INTEGER NOT NULL, 
	game_index INTEGER NOT NULL, 
	PRIMARY KEY (location_id, generation_id, game_index), 
	FOREIGN KEY(location_id) REFERENCES locations (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id)
);
CREATE TABLE location_names (
	location_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (location_id, local_language_id), 
	FOREIGN KEY(location_id) REFERENCES locations (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE locations (
	id INTEGER NOT NULL, 
	region_id INTEGER, 
	identifier VARCHAR(64) NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(region_id) REFERENCES regions (id)
);
CREATE TABLE machines (
	machine_number INTEGER NOT NULL, 
	version_group_id INTEGER NOT NULL, 
	item_id INTEGER NOT NULL, 
	move_id INTEGER NOT NULL, 
	PRIMARY KEY (machine_number, version_group_id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(item_id) REFERENCES items (id), 
	FOREIGN KEY(move_id) REFERENCES moves (id)
);
CREATE TABLE move_battle_style_prose (
	move_battle_style_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(8) NOT NULL, 
	PRIMARY KEY (move_battle_style_id, local_language_id), 
	FOREIGN KEY(move_battle_style_id) REFERENCES move_battle_styles (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_battle_styles (
	id INTEGER NOT NULL, 
	identifier VARCHAR(8) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_damage_class_prose (
	move_damage_class_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16), 
	description VARCHAR(64), 
	PRIMARY KEY (move_damage_class_id, local_language_id), 
	FOREIGN KEY(move_damage_class_id) REFERENCES move_damage_classes (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_damage_classes (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_effect_prose (
	move_effect_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	short_effect VARCHAR(256), 
	effect VARCHAR(5120), 
	PRIMARY KEY (move_effect_id, local_language_id), 
	FOREIGN KEY(move_effect_id) REFERENCES move_effects (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_effects (
	id INTEGER NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_flag_map (
	move_id INTEGER NOT NULL, 
	move_flag_id INTEGER NOT NULL, 
	PRIMARY KEY (move_id, move_flag_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(move_flag_id) REFERENCES move_flags (id)
);
CREATE TABLE move_flag_prose (
	move_flag_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(32), 
	description VARCHAR(256), 
	PRIMARY KEY (move_flag_id, local_language_id), 
	FOREIGN KEY(move_flag_id) REFERENCES move_flags (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_flags (
	id INTEGER NOT NULL, 
	identifier VARCHAR(32) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_flavor_summaries (
	move_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	flavor_summary VARCHAR(512), 
	PRIMARY KEY (move_id, local_language_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_flavor_text (
	move_id INTEGER NOT NULL, 
	version_group_id INTEGER NOT NULL, 
	language_id INTEGER NOT NULL, 
	flavor_text VARCHAR(255) NOT NULL, 
	PRIMARY KEY (move_id, version_group_id, language_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(language_id) REFERENCES languages (id)
);
CREATE TABLE move_meta (
	move_id INTEGER NOT NULL, 
	meta_category_id INTEGER NOT NULL, 
	meta_ailment_id INTEGER NOT NULL, 
	min_hits INTEGER, 
	max_hits INTEGER, 
	min_turns INTEGER, 
	max_turns INTEGER, 
	recoil INTEGER NOT NULL, 
	healing INTEGER NOT NULL, 
	crit_rate INTEGER NOT NULL, 
	ailment_chance INTEGER NOT NULL, 
	flinch_chance INTEGER NOT NULL, 
	stat_chance INTEGER NOT NULL, 
	PRIMARY KEY (move_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(meta_category_id) REFERENCES move_meta_categories (id), 
	FOREIGN KEY(meta_ailment_id) REFERENCES move_meta_ailments (id)
);
CREATE TABLE move_meta_ailment_names (
	move_meta_ailment_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(24) NOT NULL, 
	PRIMARY KEY (move_meta_ailment_id, local_language_id), 
	FOREIGN KEY(move_meta_ailment_id) REFERENCES move_meta_ailments (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_meta_ailments (
	id INTEGER NOT NULL, 
	identifier VARCHAR(24) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_meta_categories (
	id INTEGER NOT NULL, 
	identifier VARCHAR(32) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE move_meta_category_prose (
	move_meta_category_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	description VARCHAR(64) NOT NULL, 
	PRIMARY KEY (move_meta_category_id, local_language_id), 
	FOREIGN KEY(move_meta_category_id) REFERENCES move_meta_categories (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_meta_stat_changes (
	move_id INTEGER NOT NULL, 
	stat_id INTEGER NOT NULL, 
	change INTEGER NOT NULL, 
	PRIMARY KEY (move_id, stat_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(stat_id) REFERENCES stats (id)
);
CREATE TABLE move_names (
	move_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(24) NOT NULL, 
	PRIMARY KEY (move_id, local_language_id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_target_prose (
	move_target_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(32), 
	description VARCHAR(128), 
	PRIMARY KEY (move_target_id, local_language_id), 
	FOREIGN KEY(move_target_id) REFERENCES move_targets (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE move_targets (
	id INTEGER NOT NULL, 
	identifier VARCHAR(32) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE moves (
	id INTEGER NOT NULL, 
	identifier VARCHAR(24) NOT NULL, 
	generation_id INTEGER NOT NULL, 
	type_id INTEGER NOT NULL, 
	power SMALLINT NOT NULL, 
	pp SMALLINT, 
	accuracy SMALLINT, 
	priority SMALLINT NOT NULL, 
	target_id INTEGER NOT NULL, 
	damage_class_id INTEGER NOT NULL, 
	effect_id INTEGER NOT NULL, 
	effect_chance INTEGER, 
	contest_type_id INTEGER, 
	contest_effect_id INTEGER, 
	super_contest_effect_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id), 
	FOREIGN KEY(type_id) REFERENCES types (id), 
	FOREIGN KEY(target_id) REFERENCES move_targets (id), 
	FOREIGN KEY(damage_class_id) REFERENCES move_damage_classes (id), 
	FOREIGN KEY(effect_id) REFERENCES move_effects (id), 
	FOREIGN KEY(contest_type_id) REFERENCES contest_types (id), 
	FOREIGN KEY(contest_effect_id) REFERENCES contest_effects (id), 
	FOREIGN KEY(super_contest_effect_id) REFERENCES super_contest_effects (id)
);
CREATE TABLE pokedex_prose (
	pokedex_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16), 
	description VARCHAR(512), 
	PRIMARY KEY (pokedex_id, local_language_id), 
	FOREIGN KEY(pokedex_id) REFERENCES pokedexes (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokedexes (
	id INTEGER NOT NULL, 
	region_id INTEGER, 
	identifier VARCHAR(16) NOT NULL, 
	is_main_series BOOLEAN NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(region_id) REFERENCES regions (id), 
	CHECK (is_main_series IN (0, 1))
);
CREATE TABLE pokemon (
	id INTEGER NOT NULL, 
	species_id INTEGER, 
	height INTEGER NOT NULL, 
	weight INTEGER NOT NULL, 
	base_experience INTEGER NOT NULL, 
	"order" INTEGER NOT NULL, 
	is_default BOOLEAN NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(species_id) REFERENCES pokemon_species (id), 
	CHECK (is_default IN (0, 1))
);
CREATE TABLE pokemon_color_names (
	pokemon_color_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(100) NOT NULL, 
	PRIMARY KEY (pokemon_color_id, local_language_id), 
	FOREIGN KEY(pokemon_color_id) REFERENCES pokemon_colors (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_colors (
	id INTEGER NOT NULL, 
	identifier VARCHAR(100) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE pokemon_dex_numbers (
	species_id INTEGER NOT NULL, 
	pokedex_id INTEGER NOT NULL, 
	pokedex_number INTEGER NOT NULL, 
	PRIMARY KEY (species_id, pokedex_id), 
	FOREIGN KEY(species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(pokedex_id) REFERENCES pokedexes (id)
);
CREATE TABLE pokemon_egg_groups (
	species_id INTEGER NOT NULL, 
	egg_group_id INTEGER NOT NULL, 
	PRIMARY KEY (species_id, egg_group_id), 
	FOREIGN KEY(species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(egg_group_id) REFERENCES egg_groups (id)
);
CREATE TABLE pokemon_evolution (
	id INTEGER NOT NULL, 
	evolved_species_id INTEGER NOT NULL, 
	evolution_trigger_id INTEGER NOT NULL, 
	trigger_item_id INTEGER, 
	minimum_level INTEGER, 
	gender_id INTEGER, 
	location_id INTEGER, 
	held_item_id INTEGER, 
	time_of_day VARCHAR(5), 
	known_move_id INTEGER, 
	minimum_happiness INTEGER, 
	minimum_beauty INTEGER, 
	relative_physical_stats INTEGER, 
	party_species_id INTEGER, 
	trade_species_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(evolved_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(evolution_trigger_id) REFERENCES evolution_triggers (id), 
	FOREIGN KEY(trigger_item_id) REFERENCES items (id), 
	FOREIGN KEY(gender_id) REFERENCES genders (id), 
	FOREIGN KEY(location_id) REFERENCES locations (id), 
	FOREIGN KEY(held_item_id) REFERENCES items (id), 
	CONSTRAINT pokemon_evolution_time_of_day CHECK (time_of_day IN ('day', 'night')), 
	FOREIGN KEY(known_move_id) REFERENCES moves (id), 
	FOREIGN KEY(party_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(trade_species_id) REFERENCES pokemon_species (id)
);
CREATE TABLE pokemon_form_generations (
	pokemon_form_id INTEGER NOT NULL, 
	generation_id INTEGER NOT NULL, 
	game_index INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_form_id, generation_id), 
	FOREIGN KEY(pokemon_form_id) REFERENCES pokemon_forms (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id)
);
CREATE TABLE pokemon_form_names (
	pokemon_form_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	form_name VARCHAR(32), 
	pokemon_name VARCHAR(32), 
	PRIMARY KEY (pokemon_form_id, local_language_id), 
	FOREIGN KEY(pokemon_form_id) REFERENCES pokemon_forms (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_form_pokeathlon_stats (
	pokemon_form_id INTEGER NOT NULL, 
	pokeathlon_stat_id INTEGER NOT NULL, 
	minimum_stat INTEGER NOT NULL, 
	base_stat INTEGER NOT NULL, 
	maximum_stat INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_form_id, pokeathlon_stat_id), 
	FOREIGN KEY(pokemon_form_id) REFERENCES pokemon_forms (id), 
	FOREIGN KEY(pokeathlon_stat_id) REFERENCES pokeathlon_stats (id)
);
CREATE TABLE pokemon_forms (
	id INTEGER NOT NULL, 
	form_identifier VARCHAR(16), 
	pokemon_id INTEGER NOT NULL, 
	introduced_in_version_group_id INTEGER, 
	is_default BOOLEAN NOT NULL, 
	is_battle_only BOOLEAN NOT NULL, 
	form_order INTEGER NOT NULL, 
	"order" INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(introduced_in_version_group_id) REFERENCES version_groups (id), 
	CHECK (is_default IN (0, 1)), 
	CHECK (is_battle_only IN (0, 1))
);
CREATE TABLE pokemon_game_indices (
	pokemon_id INTEGER NOT NULL, 
	version_id INTEGER NOT NULL, 
	game_index INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_id, version_id), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(version_id) REFERENCES versions (id)
);
CREATE TABLE pokemon_habitat_names (
	pokemon_habitat_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (pokemon_habitat_id, local_language_id), 
	FOREIGN KEY(pokemon_habitat_id) REFERENCES pokemon_habitats (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_habitats (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE pokemon_items (
	pokemon_id INTEGER NOT NULL, 
	version_id INTEGER NOT NULL, 
	item_id INTEGER NOT NULL, 
	rarity INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_id, version_id, item_id), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(version_id) REFERENCES versions (id), 
	FOREIGN KEY(item_id) REFERENCES items (id)
);
CREATE TABLE pokemon_move_method_prose (
	pokemon_move_method_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(64), 
	description VARCHAR(255), 
	PRIMARY KEY (pokemon_move_method_id, local_language_id), 
	FOREIGN KEY(pokemon_move_method_id) REFERENCES pokemon_move_methods (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_move_methods (
	id INTEGER NOT NULL, 
	identifier VARCHAR(64) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE pokemon_moves (
	pokemon_id INTEGER NOT NULL, 
	version_group_id INTEGER NOT NULL, 
	move_id INTEGER NOT NULL, 
	pokemon_move_method_id INTEGER NOT NULL, 
	level INTEGER, 
	"order" INTEGER, 
	PRIMARY KEY (pokemon_id, version_group_id, move_id, pokemon_move_method_id, level), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(move_id) REFERENCES moves (id), 
	FOREIGN KEY(pokemon_move_method_id) REFERENCES pokemon_move_methods (id)
);
CREATE TABLE pokemon_shape_prose (
	pokemon_shape_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(24), 
	awesome_name VARCHAR(16), 
	PRIMARY KEY (pokemon_shape_id, local_language_id), 
	FOREIGN KEY(pokemon_shape_id) REFERENCES pokemon_shapes (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_shapes (
	id INTEGER NOT NULL, 
	identifier VARCHAR(24) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE pokemon_species (
	id INTEGER NOT NULL, 
	identifier VARCHAR(20) NOT NULL, 
	generation_id INTEGER, 
	evolves_from_species_id INTEGER, 
	evolution_chain_id INTEGER, 
	color_id INTEGER NOT NULL, 
	shape_id INTEGER NOT NULL, 
	habitat_id INTEGER, 
	gender_rate INTEGER NOT NULL, 
	capture_rate INTEGER NOT NULL, 
	base_happiness INTEGER NOT NULL, 
	is_baby BOOLEAN NOT NULL, 
	hatch_counter INTEGER NOT NULL, 
	has_gender_differences BOOLEAN NOT NULL, 
	growth_rate_id INTEGER NOT NULL, 
	forms_switchable BOOLEAN NOT NULL, 
	"order" INTEGER NOT NULL, 
	conquest_order INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id), 
	FOREIGN KEY(evolves_from_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(evolution_chain_id) REFERENCES evolution_chains (id), 
	FOREIGN KEY(color_id) REFERENCES pokemon_colors (id), 
	FOREIGN KEY(shape_id) REFERENCES pokemon_shapes (id), 
	FOREIGN KEY(habitat_id) REFERENCES pokemon_habitats (id), 
	CHECK (is_baby IN (0, 1)), 
	CHECK (has_gender_differences IN (0, 1)), 
	FOREIGN KEY(growth_rate_id) REFERENCES growth_rates (id), 
	CHECK (forms_switchable IN (0, 1))
);
CREATE TABLE pokemon_species_flavor_summaries (
	pokemon_species_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	flavor_summary VARCHAR(512), 
	PRIMARY KEY (pokemon_species_id, local_language_id), 
	FOREIGN KEY(pokemon_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_species_flavor_text (
	species_id INTEGER NOT NULL, 
	version_id INTEGER NOT NULL, 
	language_id INTEGER NOT NULL, 
	flavor_text VARCHAR(255) NOT NULL, 
	PRIMARY KEY (species_id, version_id, language_id), 
	FOREIGN KEY(species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(version_id) REFERENCES versions (id), 
	FOREIGN KEY(language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_species_names (
	pokemon_species_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(20), 
	genus VARCHAR(16), 
	PRIMARY KEY (pokemon_species_id, local_language_id), 
	FOREIGN KEY(pokemon_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_species_prose (
	pokemon_species_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	form_description VARCHAR(1024), 
	PRIMARY KEY (pokemon_species_id, local_language_id), 
	FOREIGN KEY(pokemon_species_id) REFERENCES pokemon_species (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE pokemon_stats (
	pokemon_id INTEGER NOT NULL, 
	stat_id INTEGER NOT NULL, 
	base_stat INTEGER NOT NULL, 
	effort INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_id, stat_id), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(stat_id) REFERENCES stats (id)
);
CREATE TABLE pokemon_types (
	pokemon_id INTEGER NOT NULL, 
	type_id INTEGER NOT NULL, 
	slot INTEGER NOT NULL, 
	PRIMARY KEY (pokemon_id, slot), 
	FOREIGN KEY(pokemon_id) REFERENCES pokemon (id), 
	FOREIGN KEY(type_id) REFERENCES types (id)
);
CREATE TABLE region_names (
	region_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (region_id, local_language_id), 
	FOREIGN KEY(region_id) REFERENCES regions (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE regions (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE stat_hint_names (
	stat_hint_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	message VARCHAR(24) NOT NULL, 
	PRIMARY KEY (stat_hint_id, local_language_id), 
	FOREIGN KEY(stat_hint_id) REFERENCES stat_hints (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE stat_hints (
	id INTEGER NOT NULL, 
	stat_id INTEGER NOT NULL, 
	gene_mod_5 INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(stat_id) REFERENCES stats (id)
);
CREATE TABLE stat_names (
	stat_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	PRIMARY KEY (stat_id, local_language_id), 
	FOREIGN KEY(stat_id) REFERENCES stats (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE stats (
	id INTEGER NOT NULL, 
	damage_class_id INTEGER, 
	identifier VARCHAR(16) NOT NULL, 
	is_battle_only BOOLEAN NOT NULL, 
	game_index INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(damage_class_id) REFERENCES move_damage_classes (id), 
	CHECK (is_battle_only IN (0, 1))
);
CREATE TABLE super_contest_combos (
	first_move_id INTEGER NOT NULL, 
	second_move_id INTEGER NOT NULL, 
	PRIMARY KEY (first_move_id, second_move_id), 
	FOREIGN KEY(first_move_id) REFERENCES moves (id), 
	FOREIGN KEY(second_move_id) REFERENCES moves (id)
);
CREATE TABLE super_contest_effect_prose (
	super_contest_effect_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	flavor_text VARCHAR(64) NOT NULL, 
	PRIMARY KEY (super_contest_effect_id, local_language_id), 
	FOREIGN KEY(super_contest_effect_id) REFERENCES super_contest_effects (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE super_contest_effects (
	id INTEGER NOT NULL, 
	appeal SMALLINT NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE type_efficacy (
	damage_type_id INTEGER NOT NULL, 
	target_type_id INTEGER NOT NULL, 
	damage_factor INTEGER NOT NULL, 
	PRIMARY KEY (damage_type_id, target_type_id), 
	FOREIGN KEY(damage_type_id) REFERENCES types (id), 
	FOREIGN KEY(target_type_id) REFERENCES types (id)
);
CREATE TABLE type_names (
	type_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(12) NOT NULL, 
	PRIMARY KEY (type_id, local_language_id), 
	FOREIGN KEY(type_id) REFERENCES types (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE types (
	id INTEGER NOT NULL, 
	identifier VARCHAR(12) NOT NULL, 
	generation_id INTEGER NOT NULL, 
	damage_class_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id), 
	FOREIGN KEY(damage_class_id) REFERENCES move_damage_classes (id)
);
CREATE TABLE version_group_pokemon_move_methods (
	version_group_id INTEGER NOT NULL, 
	pokemon_move_method_id INTEGER NOT NULL, 
	PRIMARY KEY (version_group_id, pokemon_move_method_id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(pokemon_move_method_id) REFERENCES pokemon_move_methods (id)
);
CREATE TABLE version_group_regions (
	version_group_id INTEGER NOT NULL, 
	region_id INTEGER NOT NULL, 
	PRIMARY KEY (version_group_id, region_id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id), 
	FOREIGN KEY(region_id) REFERENCES regions (id)
);
CREATE TABLE version_groups (
	id INTEGER NOT NULL, 
	generation_id INTEGER NOT NULL, 
	pokedex_id INTEGER, 
	"order" INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(generation_id) REFERENCES generations (id), 
	FOREIGN KEY(pokedex_id) REFERENCES pokedexes (id)
);
CREATE TABLE version_names (
	version_id INTEGER NOT NULL, 
	local_language_id INTEGER NOT NULL, 
	name VARCHAR(32) NOT NULL, 
	PRIMARY KEY (version_id, local_language_id), 
	FOREIGN KEY(version_id) REFERENCES versions (id), 
	FOREIGN KEY(local_language_id) REFERENCES languages (id)
);
CREATE TABLE versions (
	id INTEGER NOT NULL, 
	version_group_id INTEGER NOT NULL, 
	identifier VARCHAR(32) NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(version_group_id) REFERENCES version_groups (id)
);
CREATE INDEX ix_ability_names_name ON ability_names (name);
CREATE INDEX ix_berry_firmness_names_name ON berry_firmness_names (name);
CREATE INDEX ix_conquest_episode_names_name ON conquest_episode_names (name);
CREATE INDEX ix_conquest_kingdom_names_name ON conquest_kingdom_names (name);
CREATE INDEX ix_conquest_stat_names_name ON conquest_stat_names (name);
CREATE INDEX ix_conquest_warrior_names_name ON conquest_warrior_names (name);
CREATE INDEX ix_conquest_warrior_skill_names_name ON conquest_warrior_skill_names (name);
CREATE INDEX ix_conquest_warrior_stat_names_name ON conquest_warrior_stat_names (name);
CREATE INDEX ix_contest_type_names_name ON contest_type_names (name);
CREATE INDEX ix_egg_group_prose_name ON egg_group_prose (name);
CREATE INDEX ix_encounter_condition_prose_name ON encounter_condition_prose (name);
CREATE INDEX ix_encounter_condition_value_prose_name ON encounter_condition_value_prose (name);
CREATE INDEX ix_encounter_method_prose_name ON encounter_method_prose (name);
CREATE INDEX ix_evolution_trigger_prose_name ON evolution_trigger_prose (name);
CREATE INDEX ix_generation_names_name ON generation_names (name);
CREATE INDEX ix_growth_rate_prose_name ON growth_rate_prose (name);
CREATE INDEX ix_item_category_prose_name ON item_category_prose (name);
CREATE INDEX ix_item_flag_prose_name ON item_flag_prose (name);
CREATE INDEX ix_item_names_name ON item_names (name);
CREATE INDEX ix_item_pocket_names_name ON item_pocket_names (name);
CREATE INDEX ix_language_names_name ON language_names (name);
CREATE INDEX ix_languages_official ON languages (official);
CREATE INDEX ix_location_area_prose_name ON location_area_prose (name);
CREATE INDEX ix_location_names_name ON location_names (name);
CREATE INDEX ix_move_battle_style_prose_name ON move_battle_style_prose (name);
CREATE INDEX ix_move_damage_class_prose_name ON move_damage_class_prose (name);
CREATE INDEX ix_move_flag_prose_name ON move_flag_prose (name);
CREATE INDEX ix_move_meta_ailment_chance ON move_meta (ailment_chance);
CREATE INDEX ix_move_meta_ailment_names_name ON move_meta_ailment_names (name);
CREATE UNIQUE INDEX ix_move_meta_ailments_identifier ON move_meta_ailments (identifier);
CREATE UNIQUE INDEX ix_move_meta_categories_identifier ON move_meta_categories (identifier);
CREATE INDEX ix_move_meta_crit_rate ON move_meta (crit_rate);
CREATE INDEX ix_move_meta_flinch_chance ON move_meta (flinch_chance);
CREATE INDEX ix_move_meta_healing ON move_meta (healing);
CREATE INDEX ix_move_meta_max_hits ON move_meta (max_hits);
CREATE INDEX ix_move_meta_max_turns ON move_meta (max_turns);
CREATE INDEX ix_move_meta_min_hits ON move_meta (min_hits);
CREATE INDEX ix_move_meta_min_turns ON move_meta (min_turns);
CREATE INDEX ix_move_meta_recoil ON move_meta (recoil);
CREATE INDEX ix_move_meta_stat_chance ON move_meta (stat_chance);
CREATE INDEX ix_move_meta_stat_changes_change ON move_meta_stat_changes (change);
CREATE INDEX ix_move_names_name ON move_names (name);
CREATE INDEX ix_move_target_prose_name ON move_target_prose (name);
CREATE INDEX ix_nature_names_name ON nature_names (name);
CREATE INDEX ix_pal_park_area_names_name ON pal_park_area_names (name);
CREATE INDEX ix_pokeathlon_stat_names_name ON pokeathlon_stat_names (name);
CREATE INDEX ix_pokedex_prose_name ON pokedex_prose (name);
CREATE INDEX ix_pokemon_abilities_is_hidden ON pokemon_abilities (is_hidden);
CREATE INDEX ix_pokemon_color_names_name ON pokemon_color_names (name);
CREATE INDEX ix_pokemon_form_names_form_name ON pokemon_form_names (form_name);
CREATE INDEX ix_pokemon_form_names_pokemon_name ON pokemon_form_names (pokemon_name);
CREATE INDEX ix_pokemon_habitat_names_name ON pokemon_habitat_names (name);
CREATE INDEX ix_pokemon_is_default ON pokemon (is_default);
CREATE INDEX ix_pokemon_move_method_prose_name ON pokemon_move_method_prose (name);
CREATE INDEX ix_pokemon_moves_level ON pokemon_moves (level);
CREATE INDEX ix_pokemon_moves_move_id ON pokemon_moves (move_id);
CREATE INDEX ix_pokemon_moves_pokemon_id ON pokemon_moves (pokemon_id);
CREATE INDEX ix_pokemon_moves_pokemon_move_method_id ON pokemon_moves (pokemon_move_method_id);
CREATE INDEX ix_pokemon_moves_version_group_id ON pokemon_moves (version_group_id);
CREATE INDEX ix_pokemon_order ON pokemon ("order");
CREATE INDEX ix_pokemon_shape_prose_name ON pokemon_shape_prose (name);
CREATE INDEX ix_pokemon_species_conquest_order ON pokemon_species (conquest_order);
CREATE INDEX ix_pokemon_species_names_name ON pokemon_species_names (name);
CREATE INDEX ix_pokemon_species_order ON pokemon_species ("order");
CREATE INDEX ix_region_names_name ON region_names (name);
CREATE INDEX ix_stat_hint_names_message ON stat_hint_names (message);
CREATE INDEX ix_stat_hints_gene_mod_5 ON stat_hints (gene_mod_5);
CREATE INDEX ix_stat_names_name ON stat_names (name);
CREATE INDEX ix_type_names_name ON type_names (name);
CREATE INDEX ix_version_names_name ON version_names (name);
