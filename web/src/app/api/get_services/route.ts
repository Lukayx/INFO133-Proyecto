import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET() {
    try {
        const response = await conn.query('SELECT id, nombre FROM tipo_servicio;');
        console.log(response.rows); // Solo para verificar en la consola

        return NextResponse.json({
            comunaData: response.rows
        });
    } catch (error) {
        console.error('Error fetching comuna data:', error);
        return NextResponse.json({ error: 'Failed to fetch comuna data' });
    }
}
