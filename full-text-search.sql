
-- perform full-text searches on the "team_name" and "league" columns using the @@ operator and the to_tsquery function
SELECT team_name FROM soccer WHERE search_vector_team_name @@ to_tsquery('united');
SELECT * FROM soccer WHERE search_vector_team_name @@ to_tsquery('united');
SELECT team_name FROM soccer WHERE search_vector_league @@ to_tsquery('premier');
SELECT * FROM soccer WHERE search_vector_league @@ to_tsquery('premier');


SELECT team_name FROM soccer WHERE search_vector_team_name @@ plainto_tsquery('manchester united');
SELECT * FROM soccer WHERE search_vector_team_name @@ plainto_tsquery('liverpool', );
SELECT team_name FROM soccer WHERE search_vector_league @@ plainto_tsquery('premier league');
SELECT *  FROM soccer WHERE search_vector_league @@ plainto_tsquery('premier league');

-- perAND and OR operators, and the to_tsquery and plainto_tsquery functions
SELECT team_name FROM soccer WHERE search_vector_team_name @@ (to_tsquery('manchester') && to_tsquery('liver'));
SELECT * FROM soccer WHERE search_vector_team_name @@ ( to_tsquery('manchester') || to_tsquery('liver') );
SELECT * FROM soccer WHERE search_vector_team_name @@ ( to_tsquery('manchester') || to_tsquery('premier') );
SELECT * FROM soccer WHERE search_vector_team_name @@ ( to_tsquery('manchester') || plainto_tsquery('premier league') );


-- perform more complicate seach with the @@, ||, AND and OR operators, and the to_tsquery and plainto_tsquery functions

SELECT * FROM soccer
  WHERE search_vector_team_name @@ ( to_tsquery('manchester') )
  AND search_vector_league @@ ( plainto_tsquery('premier league') );
  
SELECT * FROM soccer
  WHERE search_vector_team_name @@ ( to_tsquery('juventus') )
  OR search_vector_league @@ ( plainto_tsquery('premier league') );
  
SELECT * FROM soccer
  WHERE search_vector_team_name @@ ( to_tsquery('juventus') )
  OR search_vector_league @@ ( plainto_tsquery('Serie A') );
  
SELECT * FROM soccer
  WHERE search_vector_team_name @@ ( to_tsquery('juventus') )
  OR search_vector_team_name @@ ( plainto_tsquery('Inter') )
  OR search_vector_league @@ ( plainto_tsquery('Premier') )
  ORDER BY team_name;
  
SELECT * FROM soccer
  WHERE search_vector_team_name @@ ( to_tsquery('juventus') )
  OR search_vector_team_name @@ ( plainto_tsquery('inter') )
  OR search_vector_league @@ ( to_tsquery('premier') )
  OR search_vector_league @@ ( plainto_tsquery('ligue 1') )
  ORDER BY team_name;
