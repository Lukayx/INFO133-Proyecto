// get_empleado.ts
import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET(request: { url: string | URL; }) {
    try {
        // Obtén el ID del salón desde los parámetros de la URL
        const { searchParams } = new URL(request.url);
        const salonId = searchParams.get('salonId');

        // Verifica que el ID del salón esté presente
        if (!salonId) {
            return NextResponse.json({ error: 'Missing salonId parameter' }, { status: 400 });
        }

        // Consulta SQL para obtener los empleados del salón
        const query = `
            SELECT t.id, t.nombre
            FROM trabajador t
            INNER JOIN salon_trabajador st ON st.id_trabajador = t.id
            WHERE st.id_salon = $1;
        `;
        const values = [salonId];
        const response = await conn.query(query, values);

        // Devuelve los datos de los empleados en formato JSON
        return NextResponse.json({
            empleados: response.rows
        });
    } catch (error) {
        console.error('Error fetching empleados data:', error);
        return NextResponse.json({ error: 'Failed to fetch empleados data' }, { status: 500 });
    }
}
