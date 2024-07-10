
import { conn } from '../../utils/database';
import { NextResponse } from 'next/server';



export async function GET() {
    try {
        let indice = 3;
        const response = await conn.query('select p.id, p.nombre, dp.precio_compra, dp.precio_venta, dp.cantidad_stock from salon s inner join detalle_producto dp on dp.id_salon = s.id inner join producto p on p.id = dp.id_producto where s.id ='+indice+";");
        console.log(response.rows); // Solo para verificar en la consola

        return NextResponse.json({
            comunaData: response.rows
        });
    } catch (error) {
        console.error('Error fetching comuna data:', error);
        return NextResponse.json({ error: 'Failed to fetch comuna data' });
    }
}
