
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