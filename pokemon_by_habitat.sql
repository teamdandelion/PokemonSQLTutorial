.mode column
.headers on
.width 20 20

SELECT species_n.name, habitat_n.name
FROM pokemon_habitat_names as habitat_n
	JOIN pokemon_species as species on species.habitat_id = habitat_n.pokemon_habitat_id
	JOIN pokemon_species_names as species_n on species_n.pokemon_species_id = species.id

WHERE species.generation_id == 1
	AND species_n.local_language_id == 9
ORDER BY habitat_n.pokemon_habitat_id;
