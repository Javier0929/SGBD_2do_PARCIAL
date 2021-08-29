
--Trigger 
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