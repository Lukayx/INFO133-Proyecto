-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP SEQUENCE public.boleta_id_seq;

CREATE SEQUENCE public.boleta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.boleta_id_seq1;

CREATE SEQUENCE public.boleta_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.cliente_id_seq;

CREATE SEQUENCE public.cliente_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.cliente_id_seq1;

CREATE SEQUENCE public.cliente_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.comuna_id_seq;

CREATE SEQUENCE public.comuna_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.comuna_id_seq1;

CREATE SEQUENCE public.comuna_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.costo_servicio_id_seq;

CREATE SEQUENCE public.costo_servicio_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.empleados_id_seq;

CREATE SEQUENCE public.empleados_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.empleados_id_seq1;

CREATE SEQUENCE public.empleados_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.hecho_boleta_venta_id_seq;

CREATE SEQUENCE public.hecho_boleta_venta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.hecho_cita_id_seq;

CREATE SEQUENCE public.hecho_cita_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.hecho_cita_id_seq1;

CREATE SEQUENCE public.hecho_cita_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.hecho_inventario_id_seq;

CREATE SEQUENCE public.hecho_inventario_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.horario_id_seq;

CREATE SEQUENCE public.horario_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.horario_id_seq1;

CREATE SEQUENCE public.horario_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.producto_id_seq;

CREATE SEQUENCE public.producto_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.producto_id_seq1;

CREATE SEQUENCE public.producto_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.salon_id_seq;

CREATE SEQUENCE public.salon_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.salon_id_seq1;

CREATE SEQUENCE public.salon_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.tipo_servicio_id_seq;

CREATE SEQUENCE public.tipo_servicio_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.tipo_servicio_id_seq1;

CREATE SEQUENCE public.tipo_servicio_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.boleta definition

-- Drop table

-- DROP TABLE public.boleta;

CREATE TABLE public.boleta (
	id serial4 NOT NULL,
	CONSTRAINT boleta_pkey PRIMARY KEY (id)
);


-- public.cliente definition

-- Drop table

-- DROP TABLE public.cliente;

CREATE TABLE public.cliente (
	id serial4 NOT NULL,
	nombre varchar(30) NOT NULL,
	apellido varchar(30) NOT NULL,
	rut int4 NOT NULL,
	telefono int4 NULL,
	sexo varchar(13) NOT NULL,
	CONSTRAINT cliente_pkey PRIMARY KEY (id),
	CONSTRAINT cliente_sexo_check CHECK (((sexo)::text = ANY (ARRAY[('Mujer'::character varying)::text, ('Hombre'::character varying)::text])))
);


-- public.comuna definition

-- Drop table

-- DROP TABLE public.comuna;

CREATE TABLE public.comuna (
	id serial4 NOT NULL,
	nombre varchar(40) NULL,
	CONSTRAINT comuna_pkey PRIMARY KEY (id)
);


-- public.empleados definition

-- Drop table

-- DROP TABLE public.empleados;

CREATE TABLE public.empleados (
	id serial4 NOT NULL,
	nombre varchar(30) NOT NULL,
	apellido varchar(30) NOT NULL,
	rut int4 NOT NULL,
	CONSTRAINT empleados_pkey PRIMARY KEY (id)
);


-- public.horario definition

-- Drop table

-- DROP TABLE public.horario;

CREATE TABLE public.horario (
	id serial4 NOT NULL,
	hora_inicio time NOT NULL,
	hora_fin time NOT NULL,
	CONSTRAINT horario_pkey PRIMARY KEY (id)
);


-- public.producto definition

-- Drop table

-- DROP TABLE public.producto;

CREATE TABLE public.producto (
	id serial4 NOT NULL,
	nombre varchar(40) NULL,
	CONSTRAINT producto_pkey PRIMARY KEY (id)
);


-- public.salon definition

-- Drop table

-- DROP TABLE public.salon;

CREATE TABLE public.salon (
	id serial4 NOT NULL,
	nombre varchar(50) NULL,
	rut_empresa int4 NULL,
	CONSTRAINT salon_pkey PRIMARY KEY (id)
);


-- public.tipo_servicio definition

-- Drop table

-- DROP TABLE public.tipo_servicio;

CREATE TABLE public.tipo_servicio (
	id serial4 NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT tipo_servicio_pkey PRIMARY KEY (id)
);


-- public.hecho_boleta_venta definition

-- Drop table

-- DROP TABLE public.hecho_boleta_venta;

CREATE TABLE public.hecho_boleta_venta (
	fecha date NULL,
	id_salon int4 NULL,
	id_cliente int4 NULL,
	id_comuna int4 NULL,
	id serial4 NOT NULL,
	id_producto int4 NOT NULL,
	id_boleta int4 NOT NULL,
	CONSTRAINT hecho_boleta_venta_pk PRIMARY KEY (id),
	CONSTRAINT hecho_boleta_venta_boleta_fk FOREIGN KEY (id_boleta) REFERENCES public.boleta(id),
	CONSTRAINT hecho_boleta_venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id),
	CONSTRAINT hecho_boleta_venta_id_comuna_fkey FOREIGN KEY (id_comuna) REFERENCES public.comuna(id),
	CONSTRAINT hecho_boleta_venta_id_salon_fkey FOREIGN KEY (id_salon) REFERENCES public.salon(id),
	CONSTRAINT hecho_boleta_venta_producto_fk FOREIGN KEY (id_producto) REFERENCES public.producto(id)
);


-- public.hecho_cita definition

-- Drop table

-- DROP TABLE public.hecho_cita;

CREATE TABLE public.hecho_cita (
	id serial4 NOT NULL,
	fecha date NULL,
	id_salon int4 NULL,
	id_empleado int4 NULL,
	id_cliente int4 NULL,
	id_servicio int4 NULL,
	id_horario int4 NULL,
	id_comuna int4 NULL,
	id_costo_servicio int4 NULL,
	CONSTRAINT hecho_cita_pkey PRIMARY KEY (id),
	CONSTRAINT hecho_cita_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id),
	CONSTRAINT hecho_cita_id_comuna_fkey FOREIGN KEY (id_comuna) REFERENCES public.comuna(id),
	CONSTRAINT hecho_cita_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id),
	CONSTRAINT hecho_cita_id_horario_fkey FOREIGN KEY (id_horario) REFERENCES public.horario(id),
	CONSTRAINT hecho_cita_id_salon_fkey FOREIGN KEY (id_salon) REFERENCES public.salon(id),
	CONSTRAINT hecho_cita_id_servicio_fkey FOREIGN KEY (id_servicio) REFERENCES public.tipo_servicio(id)
);


-- public.hecho_inventario definition

-- Drop table

-- DROP TABLE public.hecho_inventario;

CREATE TABLE public.hecho_inventario (
	fecha date NULL,
	precio_compra int4 NULL,
	precio_venta int4 NULL,
	cantidad_stock int4 NULL,
	id serial4 NOT NULL,
	id_salon int4 NOT NULL,
	id_producto int4 NOT NULL,
	CONSTRAINT hecho_inventario_pk PRIMARY KEY (id),
	CONSTRAINT hecho_inventario_producto_fk FOREIGN KEY (id_producto) REFERENCES public.producto(id),
	CONSTRAINT hecho_inventario_salon_fk FOREIGN KEY (id_salon) REFERENCES public.salon(id)
);