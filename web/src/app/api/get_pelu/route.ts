// pages/api/get_pelus.ts
import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET() {
    try {
        const response = await conn.query('SELECT id, rut_empresa FROM salon;');
        console.log(response.rows); // Solo para verificar en la consola

        return NextResponse.json({
            peluqueriaData: response.rows
        });
    } catch (error) {
        console.error('Error fetching peluqueria data:', error);
        return NextResponse.json({ error: 'Failed to fetch peluqueria data' });
    }
}
