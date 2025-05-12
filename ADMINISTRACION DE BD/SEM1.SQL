-- a) Instalador Oracle  => https://docs.google.com/document/d/1i0mQTCcHqFbsyJZmZlNWNflNFYEX_0TdSjwU3VvjRmc/edit?usp=sharing
-- b) Errores de instalacion => https://docs.google.com/document/d/1aI5df8xnmTP1QdTgC5TdcoIYCc0c42e9pLpEPj_TgDY/edit?usp=drive_link

-- #ARQUITECTURA DE ORACLE
    -- La arquitectura de una base de datos Oracle se compone de tres elementos principales:
        -- La  instancia, que incluye estructuras de memoria y procesos.
        -- La base de datos, compuesta por archivos físicos almacenados en disco.
        -- Los procesos del usuario, que interactúan con la instancia para ejecutar operaciones.

-- #1. Procesos del usuario y del servidor "PGA (Program Global Area)""
    -- Cuando un usuario ejecuta una consulta en Oracle, se crea un user process que se comunica con un server process. 
    -- Este último es responsable de ejecutar las instrucciones en la base de datos. 
    -- Cada server process utiliza una memoria privada llamada PGA (Program Global Area), 
    -- la cual contiene datos temporales y específicos de la sesión.

-- #2. "SGA (System Global Area)"
    -- La instancia de Oracle incluye una zona de memoria compartida denominada SGA, que contiene los siguientes componentes:
    -- Database Buffer Cache: almacena en memoria bloques de datos leídos desde disco, con el fin de mejorar el rendimiento.
    -- Redo Log Buffer: guarda los cambios realizados en la base de datos, permitiendo su recuperación en caso de fallo.
    -- Shared Pool:
        -- Library Cache: contiene sentencias SQL y sus planes de ejecución analizados.
        -- Data Dictionary Cache: almacena metadatos sobre usuarios, estructuras de la base de datos y privilegios.

-- #3. Procesos en segundo plano (background processes)
    -- Oracle utiliza procesos que se ejecutan automáticamente en segundo plano para gestionar y mantener la base de datos. Entre ellos se encuentran:
    -- SMON (System Monitor): se encarga de la recuperación de la instancia en caso de fallos.
    -- PMON (Process Monitor): limpia los procesos de usuario que hayan fallado, liberando recursos.
    -- RECO (Recoverer Process): resuelve transacciones en duda en bases de datos distribuidas.
    -- Otros procesos adicionales, como ARCn, se encargan de archivar información de recuperación.       

-- #4. Procesos de escritura y recuperación
    -- Existen procesos específicos encargados de escribir y sincronizar los datos entre la memoria y los archivos físicos:
        -- DBWn (Database Writer): escribe los bloques modificados desde el buffer de memoria hacia los archivos de datos.
        -- CKPT (Checkpoint): registra los puntos de control en los archivos de control y cabeceras de los archivos de datos.
        -- LGWR (Log Writer): escribe el contenido del redo log buffer en los archivos redo log.
        -- ARCn (Archiver): genera copias de los redo logs para respaldo y recuperación.

-- #5. Archivos físicos de la base de datos
    -- Los datos y estructuras de Oracle se almacenan físicamente en disco mediante diferentes tipos de archivos:
        -- Data files: contienen los datos reales, como tablas, índices y vistas.
        -- Control files: contienen información crítica sobre la estructura y el estado de la base de datos.
        -- Online redo log files: registran los cambios recientes en los datos.
        -- Archived log files: contienen copias de los redo logs utilizados para fines de respaldo y recuperación.