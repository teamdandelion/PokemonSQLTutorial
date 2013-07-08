.mode column
.headers on
-- .width 20 20

SELECT sname.name, pokemon.*, species.*
FROM pokemon
	JOIN pokemon_species as species 
		ON pokemon.species_id = species.id
	JOIN pokemon_species_names as sname
		ON sname.pokemon_species_id = species.id

WHERE species.generation_id == 1
	AND sname.local_language_id == 9
-- ORDER BY trigger_prose.evolution_trigger_id;
;
