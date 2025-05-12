select 
a.*,
b.*
from parametros a
left join detalle_parametros b on b.id_parametro=a.id_parametro
where b.id_dparametro is null;
