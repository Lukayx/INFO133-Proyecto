import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET(request: { url: string | URL; }) {
    try {
        // Obtén el RUT de la URL
        const { searchParams } = new URL(request.url);
        const rut = searchParams.get('rut');

        // Verifica que el RUT esté presente
        if (!rut) {
            return NextResponse.json({ error: 'Missing rut parameter' }, { status: 400 });
        }

        // Realiza la consulta con el RUT proporcionado
        const query = `
            SELECT id FROM cliente WHERE rut = $1;
        `;
        const values = [rut];
        const response = await conn.query(query, values);

        // Verifica si se encontró algún cliente con ese RUT
        if (response.rows.length === 0) {
            return NextResponse.json({ error: 'Cliente no encontrado' }, { status: 404 });
        }

        console.log(response.rows); // Para verificar en la consola

        return NextResponse.json({
            clienteId: response.rows[0].id
        });
    } catch (error) {
        console.error('Error fetching cliente data:', error);
        return NextResponse.json({ error: 'Failed to fetch cliente data' }, { status: 500 });
    }
}
