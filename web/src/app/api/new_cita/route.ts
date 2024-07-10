// pages/api/new_cita.ts
import { NextRequest, NextResponse } from 'next/server';
import { conn } from '../../utils/database';

export async function PUT(request: NextRequest) {
    try {
        // Obtener los datos del cuerpo de la solicitud
        const { id_salon, id_servicio, id_cliente, id_horario, id_empleado, fecha } = await request.json();

        // Validar que todos los campos necesarios están presentes
        if (!id_salon || !id_servicio || !id_cliente || !id_horario || !id_empleado || !fecha) {
            return NextResponse.json({ error: 'Todos los campos son obligatorios' }, { status: 400 });
        }

        // Insertar la nueva cita en la base de datos
        const query = `
            INSERT INTO cita (id_salon, id_servicio, id_cliente, id_horario, id_empleado, fecha)
            VALUES ($1, $2, $3, $4, $5, $6)
            RETURNING *;
        `;
        const values = [id_salon, id_servicio, id_cliente, id_horario, id_empleado, fecha];
        const response = await conn.query(query, values);

        console.log(response.rows[0]); // Solo para verificar en la consola

        // Responder con los datos de la nueva cita creada
        return NextResponse.json({
            citaData: response.rows[0]
        });
    } catch (error) {
        console.error('Error creating new appointment:', error);
        return NextResponse.json({ error: 'Failed to create new appointment' }, { status: 500 });
    }
}
