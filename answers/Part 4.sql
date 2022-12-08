SELECT p.name 'Pokemon Name', tr.trainername 'Trainer Name', pt.pokelevel 'Level',
t.name 'Primary Type', t2.name 'Secondary Type'
FROM pokemon_trainer pt
JOIN pokemons p ON pt.pokemon_id=p.id
JOIN trainers tr ON tr.trainerId=pt.trainerID
JOIN types t ON t.id=p.primary_type
JOIN types t2 ON t2.id=p.secondary_type
ORDER BY pt.hp DESC, pt.defense DESC, pt.attack DESC;

/* HP most important, don't care about MaxHP, cause they don't have it. Then defense, then offense */