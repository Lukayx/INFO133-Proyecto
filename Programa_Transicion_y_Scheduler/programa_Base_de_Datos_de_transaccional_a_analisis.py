
import psycopg2

# Conexiones a las bases de datos
conn_origen = psycopg2.connect(
    host="localhost",
    database="salonBelleza",
    user="postgres",
    password="tomikito"
)

conn_destino = psycopg2.connect(
    host="localhost",
    database="salonAnalisis",
    user="postgres",
    password="tomikito"
)

# Función para transferir los datos
def transferir_datos():
    cur_origen = conn_origen.cursor()
    cur_destino = conn_destino.cursor()

    
    #horario
    cur_origen.execute("SELECT * FROM horario")
    datos_horario = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO horario (id, hora_inicio, hora_fin) VALUES (%s, %s, %s) ON CONFLICT DO NOTHING", datos_horario)

    #comuna
    cur_origen.execute("SELECT * FROM comuna")
    datos_comuna = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO comuna (id, nombre) VALUES (%s, %s) ON CONFLICT DO NOTHING", datos_comuna)

    #producto
    cur_origen.execute("SELECT * FROM producto")
    datos_producto = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO producto (id, nombre) VALUES (%s, %s) ON CONFLICT DO NOTHING", datos_producto)

    #tipo_servicio
    cur_origen.execute("SELECT * FROM tipo_servicio")
    datos_tipo_servicio = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO tipo_servicio (id, nombre) VALUES (%s, %s)ON CONFLICT DO NOTHING", datos_tipo_servicio)

    #empleado
    cur_origen.execute("SELECT id,nombre,apellido,rut FROM empleados")
    datos_empleados = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO empleados (id, nombre,apellido,rut) VALUES (%s, %s,%s,%s) ON CONFLICT DO NOTHING", datos_empleados)

    #salon
    cur_origen.execute("SELECT id,nombre,rut_empresa from Salon")
    datos_salon = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO Salon (id,nombre,rut_empresa) VALUES (%s, %s,%s) ON CONFLICT DO NOTHING", datos_salon)

    #cliente
    cur_origen.execute("SELECT id,nombre,apellido,rut,telefono,sexo from cliente")
    datos_cliente = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO cliente (id,nombre,apellido,rut,telefono,sexo) VALUES (%s, %s,%s,%s, %s,%s) ON CONFLICT DO NOTHING", datos_cliente)

    #boleta
    cur_origen.execute("SELECT id from boleta_venta")
    datos_boleta = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO boleta (id) VALUES (%s) ON CONFLICT DO NOTHING", datos_boleta)

    #hecho_inventario
    cur_origen.execute("Select * from detalle_producto")
    datos_inventario = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO hecho_inventario (id_producto,id_salon,precio_compra,precio_venta,cantidad_stock) VALUES(%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING",datos_inventario)

    cur_origen.execute("""SELECT c.id, c.id_salon, c.id_empleado, c.id_cliente, c.id_horario, c.id_servicio, cs.costo, co.id, c.fecha
                       FROM cita c
                       INNER JOIN costo_servicio cs ON c.id_salon = cs.id_salon AND c.id_servicio = cs.id_servicio
                       INNER JOIN comuna co ON c.id_salon = co.id
        """)
    datos = cur_origen.fetchall()

    cur_destino.executemany("""
            INSERT INTO hecho_cita (id,id_salon, id_empleado, id_cliente, id_horario, id_servicio,id_costo_servicio, id_comuna, fecha
            ) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s) ON CONFLICT DO NOTHING
        """, datos)
    
    cur_origen.execute("""
    SELECT bv.fecha, bv.id_cliente, bv.id_salon, p.id, bv.id, co.id
    FROM boleta_venta bv
    INNER JOIN producto_boleta pb ON bv.id = pb.id_boleta
    INNER JOIN producto p ON pb.id_producto = p.id
    INNER JOIN cliente c ON bv.id_cliente = c.id
    INNER JOIN salon s ON bv.id_salon = s.id
    INNER JOIN comuna co ON s.id_comuna = co.id
""")
    datos_boleta = cur_origen.fetchall()
    cur_destino.executemany("INSERT INTO hecho_boleta_venta (fecha,id_cliente,id_salon,id_producto,id_boleta,id_comuna) VALUES (%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING", datos_boleta)
    
    
   
    # Commit y cerrar conexiones
    conn_destino.commit()
    cur_origen.close()
    cur_destino.close()

transferir_datos()