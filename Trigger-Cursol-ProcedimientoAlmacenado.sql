--Trigger ---


CREATE OR REPLACE FUNCTION articulosMaximo() RETURNS TRIGGER
AS
$articulosMaximo$
  DECLARE
    cantidad int;
    maximo int = 6;
BEGIN
    select count (articulo.descripcion_articulo) into cantidad from articulo;
    if ( maximo < cantidad ) then
      RAISE EXCEPTION 'No se permite mas de 5 articulos por día';
    END if;
    RETURN new;
END;
$articulosMaximo$
LANGUAGE plpgsql;
--before after instead of
create trigger articulosMaximo before insert
on articulo fOR EACH ROW
execute procedure articulosMaximo();


--INSERTAR DATOS VERIFICAR TRIGGER
insert into articulo values ('16','1','1','3','laptop',' laptp HP core i3 7th Gen','nuevo','600','2/06/2019', '20/08/2019');





---CURSOR---

do $$
DECLARE
    sum bigint;  
    can bigint;
    reco varchar;
    guardar varchar;
    recorrer record;
    -- Declaración EXPLICITA del cursor
    c_nombre CURSOR FOR SELECT * FROM public.articulo,public.comprador
    where 
        comprador.id_comprador = articulo.id_comprador;
BEGIN
   -- Procesa el cursor
   FOR can IN c_nombre
   LOOP
	sum = count(can.id_articulo);
   END LOOP;
   
   FOR reco IN c_nombre
   LOOP
	guardar = reco.nombre_comprador;
   END LOOP;
   open c_nombre;
   fetch c_nombre into recorrer;
   raise notice 'Nombre del Articulo: %-- Comprador: %-- Cantidad: %',recorrer.nombre_articulo, guardar, sum;
END $$ 
LANGUAGE 'plpgsql'



---PROCEDIMIENTO ALMACENADO---

-DROP FUNCTION subasta(character)

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