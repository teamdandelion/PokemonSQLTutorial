.mode column
.headers on
-- .width 20 20

SELECT sname.name, COUNT(*) as "Num in family"
FROM pokemon_species_names as sname
	JOIN pokemon_species as species 
		ON species.id = sname.pokemon_species_id
	-- JOIN pokemon_evolution as evol
	-- 	ON evol.evolved_species_id = species.id
	-- JOIN evolution_trigger_prose as trigger_prose
	-- 	ON evol.evolution_trigger_id = trigger_prose.evolution_trigger_id
WHERE species.generation_id == 1
	AND sname.local_language_id == 9
GROUP BY species.evolution_chain_id
ORDER BY "Num in family"
;
