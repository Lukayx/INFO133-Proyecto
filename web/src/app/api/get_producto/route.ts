// pages/api/get_pelus.ts
import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';

export async function GET(request) {
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
            SELECT p.id, p.nombre, dp.precio_compra, dp.precio_venta, dp.cantidad_stock
            FROM salon s
            INNER JOIN detalle_producto dp ON dp.id_salon = s.id
            INNER JOIN producto p ON p.id = dp.id_producto
            WHERE s.id = $1;
        `;
        const values = [id];
        const response = await conn.query(query, values);

        console.log(response.rows); // Solo para verificar en la consola

        return NextResponse.json({
            peluqueriaData: response.rows
        });
    } catch (error) {
        console.error('Error fetching peluqueria data:', error);
        return NextResponse.json({ error: 'Failed to fetch peluqueria data' }, { status: 500 });
    }
}
