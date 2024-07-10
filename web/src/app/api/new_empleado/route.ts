// pages/api/empleados.ts
import { NextRequest, NextResponse } from 'next/server';
import { conn } from '../../utils/database';

export async function PUT(request: NextRequest) {
    try {
        // Obtener los datos del cuerpo de la solicitud
        const { id_salon, nombre, apellido, rut } = await request.json();

        // Validar que todos los campos necesarios están presentes
        if (!id_salon || !nombre || !apellido || !rut) {
            return NextResponse.json({ error: 'Todos los campos son obligatorios' }, { status: 400 });
        }

        // Insertar el nuevo empleado en la base de datos
        const query = `
            INSERT INTO empleados (id_salon, nombre, apellido, rut)
            VALUES ($1, $2, $3, $4)
            RETURNING *;
        `;
        const values = [id_salon, nombre, apellido, rut];
        const response = await conn.query(query, values);

        console.log(response.rows[0]); // Solo para verificar en la consola

        // Responder con los datos del nuevo empleado creado
        return NextResponse.json({
            empleadoData: response.rows[0]
        });
    } catch (error) {
        console.error('Error creating new employee:', error);
        return NextResponse.json({ error: 'Failed to create new employee' }, { status: 500 });
    }
}
