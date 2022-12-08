/* What is each pokemon's primary type? */
SELECT p.name Pokemon, t.name Type
FROM pokemons p
JOIN types t
ON p.primary_type=t.id;

/* What is Rufflet's secondary type? Flying */
SELECT p.name Pokemon, t.name 2Type
FROM pokemons p
JOIN types t
WHERE p.secondary_type=t.id
AND p.name='Rufflet';

/* What are the names of the pokemon that belong to the trainer with trainerID 303? */
SELECT t.trainername Trainer, p.name Pokemon
FROM pokemon_trainer pt
JOIN trainers t ON pt.trainerID=t.trainerId
JOIN pokemons p ON pt.pokemon_id=p.id
WHERE pt.trainerID=303;

/* How many pokemon have a secondary type Poison */
SELECT COUNT(*)
FROM pokemons p
JOIN types t
WHERE p.secondary_type=t.id
AND t.name='Poison';

/* What are all the primary types and how many pokemon have that type? */
SELECT t.name Type, COUNT(p.primary_type) 'Pokemon of Type'
FROM types t JOIN pokemons p ON p.primary_type=t.id
GROUP BY t.id;

/* How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? */
SELECT trainerID Trainer, COUNT(trainerID) 'No of Pokemon'
FROM pokemon_trainer WHERE pokelevel>99
GROUP BY trainerID HAVING COUNT(trainerID)>1;

/* How many pokemon only belong to one trainer and no other? */
SELECT p.name Pokemon, COUNT(pt.trainerID) Count
FROM pokemon_trainer pt
JOIN pokemons p ON p.id=pt.pokemon_id
GROUP BY pokemon_id HAVING COUNT(pt.trainerID) = 1;