import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET(request: { url: string | URL; }) {
    try {
        // Obtén el ID de la URL
        const { searchParams } = new URL(request.url);
        const id = searchParams.get('id');

        // Verifica que el ID esté presente
        if (!id) {
            return NextResponse.json({ error: 'Missing id parameter' }, { status: 400 });
        }

        // Realiza la consulta con el ID proporcionado
        const query = `
            SELECT c.fecha, s.id AS salon, ts.nombre AS servicio, cl.nombre AS cliente, h.hora_inicio, e.nombre AS empleado
            FROM cita c
            INNER JOIN salon s ON c.id_salon = s.id
            INNER JOIN tipo_servicio ts ON c.id_servicio = ts.id
            INNER JOIN cliente cl ON c.id_cliente = cl.id
            INNER JOIN horario h ON c.id_horario = h.id
            INNER JOIN empleados e ON c.id_empleado = e.id
            WHERE s.id = $1
            ORDER BY c.fecha, h.hora_inicio;
        `;
        const values = [id];
        const response = await conn.query(query, values);

        console.log(response.rows); // Solo para verificar en la consola

        return NextResponse.json({
            citasData: response.rows
        });
    } catch (error) {
        console.error('Error fetching citas data:', error);
        return NextResponse.json({ error: 'Failed to fetch citas data' }, { status: 500 });
    }
}
