WITH RECURSIVE sub_os(Id, ParentId, Name, Level, Path, Space) AS (
     SELECT Id, ParentId, Name, 1, Name, '' FROM os WHERE ParentId = 0 
     UNION ALL 
     SELECT o.Id, o.ParentId, o.Name, Level + 1, (so.Path || '\' || o.Name), Space || '    ' 
          FROM os o, sub_os so 
     WHERE o.ParentId = so.Id 
)
SELECT Space || Name AS Name  FROM sub_os 
order by Path
