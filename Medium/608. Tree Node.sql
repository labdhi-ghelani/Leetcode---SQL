My solution:

SELECT
    id AS `Id`,
    CASE
        WHEN tree.p_id  is null
          THEN 'Root'  
        WHEN tree.id IN (select t1.p_id from tree t1)
          THEN 'Inner'
        ELSE 'Leaf'
    END AS Type
FROM
    tree
ORDER BY `Id`;
;

