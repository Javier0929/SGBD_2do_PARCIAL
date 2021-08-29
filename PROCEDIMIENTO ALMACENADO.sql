CREATE OR REPLACE FUNCTION subasta(variable CHARACTER)
RETURNS int
AS
$BODY$
DECLARE total int;
BEGIN
SELECT
 count (id_subasta) INTO total 
FROM 
  public.subasta;
RETURN total;
END;$BODY$
LANGUAGE plpgsql;

select subasta('Subasta Inglesa');

