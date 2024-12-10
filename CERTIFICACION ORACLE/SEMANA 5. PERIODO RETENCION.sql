-- CONFIGURACION DEL PERIODO DE RETENCION
/* El script /var/opt/oracle/cleandb/cleandblogs.pl es el encargado de
automatizar tareas de archivado y depuración de archivos de diagnóstico
y logs en un despliegue de DBCS, entre ellos los archivos generados por
auditoria (*.aud) que dependiendo de la configuración y actividad de la
base de datos pueden ser muchos.
Este script corre semanalmente como un crontab y por defecto
elimina los archivos de auditoria (*.aud) que tienen una antigüedad
mayor a 14 días, según podemos verlo en la definición de la
documentación correspondiente: */