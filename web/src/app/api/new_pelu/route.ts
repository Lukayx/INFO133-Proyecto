// pages/api/salon.ts
import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function PUT(request: Request) {
    try {
        // Obtener los datos del cuerpo de la solicitud
        const { nombre, id_comuna, rut_empresa } = await request.json();

        // Validar que todos los campos necesarios están presentes
        if (!nombre || !id_comuna || !rut_empresa) {
            return NextResponse.json({ error: 'Todos los campos son obligatorios' }, { status: 400 });
        }

        // Insertar el nuevo salón en la base de datos
        const response = await conn.query(
            'INSERT INTO salon (nombre, id_comuna, rut_empresa) VALUES ($1, $2, $3) RETURNING *',
            [nombre, id_comuna, rut_empresa]
        );

        console.log(response.rows[0]); // Solo para verificar en la consola

        // Responder con los datos del nuevo salón creado
        return NextResponse.json({
            salonData: response.rows[0]
        });
    } catch (error) {
        console.error('Error creating new salon:', error);
        return NextResponse.json({ error: 'Failed to create new salon' }, { status: 500 });
    }
}
