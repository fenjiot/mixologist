SELECT
  recipes.id AS searchable_id,
  'Recipe' AS searchable_type,
  recipes.name AS term
FROM recipes

UNION

SELECT
  recipes.id AS searchable_id,
  'Recipe' AS searchable_type,
  recipes.instructions AS term
FROM recipes

UNION

SELECT
  ingredients.id AS searchable_id,
  'Ingredient' AS searchable_type,
  ingredients.name AS term
FROM ingredients

UNION

SELECT
  ingredients.id AS searchable_id,
  'Ingredient' AS searchable_type,
  ingredients.description AS term
FROM ingredients
