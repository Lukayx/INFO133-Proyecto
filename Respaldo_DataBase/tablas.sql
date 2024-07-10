create table comuna(
	id serial primary key,
	nombre varchar(40) unique
);

create table salon(
	id serial primary key,
	nombre varchar(50),
	id_comuna int not null,
	rut_empresa int unique,
	foreign key (id_comuna) references comuna
);

create table tipo_servicio(
	id serial primary key,
	nombre varchar (50)
);


create table costo_servicio(
	id_salon int,
	id_servicio int,
	costo int not null,
	primary key (id_salon, id_servicio),
	foreign key (id_salon) references salon,
	foreign key (id_servicio) references tipo_servicio
);


create table empleados(
	id serial primary key,
	id_salon int not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	rut int not null unique,
	foreign key (id_salon) references salon
);

create table horario(
	id serial primary key,
	hora_inicio Time not null,
	hora_fin Time not null
);

create table cliente(
	id serial primary key,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	rut int not null unique,
	telefono int,
	sexo varchar(13) not null,
	id_comuna int,
	foreign key (id_comuna) references comuna,
	check (sexo in ('Mujer', 'Hombre'))
);

create table cita(
	id serial,
	id_salon int,
	id_servicio int,
	id_cliente int,
	id_horario int,
	id_empleado int,
	fecha date,
	foreign key (id_salon) references salon,
	foreign key (id_servicio) references tipo_servicio,
	foreign key (id_cliente) references cliente,
	foreign key (id_horario) references horario,
	foreign key (id_empleado) references empleados,
	primary key (id, id_salon), 
	CONSTRAINT unique_key_triple UNIQUE (id_salon, id_horario, fecha)
);

create table boleta_venta (
	id serial primary key,
	id_cliente int not null,
	id_salon int not null, 
	fecha date,
	foreign key (id_cliente) references cliente,
	foreign key (id_salon) references salon
);

create table producto (
	id serial primary key,
	nombre varchar(40)
);

create table detalle_producto(
	id_producto int,
	id_salon int, 
	precio_compra int,
	precio_venta int,
	cantidad_stock int,
	primary key(id_salon, id_producto),
	foreign key (id_salon) references salon,
	foreign key (id_producto) references producto
);

create table producto_boleta(
	id_producto int not null,
	id_boleta int not null,
	primary key (id_boleta, id_producto),
	foreign key (id_boleta) references boleta_venta(id),
	foreign key (id_producto) references producto(id)
	
);