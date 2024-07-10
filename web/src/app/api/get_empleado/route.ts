import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET(request: { url: string | URL; }) {
    try {
        const { searchParams } = new URL(request.url);
        const salonId = searchParams.get('salonId');

        if (!salonId) {
            return NextResponse.json({ error: 'Missing salonId parameter' }, { status: 400 });
        }

        const query = `SELECT t.id, t.nombre FROM empleados t WHERE t.id_salon = $1`;
        const values = [salonId];
        const response = await conn.query(query, values);

        return NextResponse.json({ empleados: response.rows });
    } catch (error) {
        console.error('Error fetching empleados data:', error);
        return NextResponse.json({ error: 'Failed to fetch empleados data' }, { status: 500 });
    }
}
