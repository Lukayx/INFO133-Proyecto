// src/pages/stock.tsx
"use client"; //es increible pero esta weaita de acá me deja usar el usestate xd?
// src/pages/stock.tsx

import React, { useState } from 'react';
import NavBar from '../components/navbar';
import styles from './stock.module.css'; // Importa los estilos CSS

interface Producto {
  id: number;
  nombre: string;
  cantidad: number;
  precioCompra: number;
}

const StockPage: React.FC = () => {
  // Ejemplo de lista de productos (simulación de datos)
  const [productos, setProductos] = useState<Producto[]>([
    { id: 1, nombre: 'Producto A', cantidad: 10, precioCompra: 15 },
    { id: 2, nombre: 'Producto B', cantidad: 5, precioCompra: 20 },
    { id: 3, nombre: 'Producto C', cantidad: 8, precioCompra: 12 },
    { id: 4, nombre: 'Producto D', cantidad: 15, precioCompra: 18 },
  ]);

  // Función para añadir más existencias a un producto
  const handleAñadirExistencias = (id: number) => {
    const nuevosProductos = productos.map(producto =>
      producto.id === id ? { ...producto, cantidad: producto.cantidad + 1 } : producto
    );
    setProductos(nuevosProductos);
  };

  // Función para quitar existencias de un producto
  const handleQuitarExistencias = (id: number) => {
    const nuevosProductos = productos.map(producto =>
      producto.id === id ? { ...producto, cantidad: producto.cantidad - 1 } : producto
    );
    setProductos(nuevosProductos);
  };

  return (
    <div>
      <NavBar />
      <div className={styles.pageContainer}>
        <h1>Stock de Productos</h1>

        {/* Tabla de productos */}
        <table className={styles.productosTable}>
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Cantidad</th>
              <th>Precio de Compra</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {productos.map(producto => (
              <tr key={producto.id}>
                <td>{producto.nombre}</td>
                <td>{producto.cantidad}</td>
                <td>${producto.precioCompra}</td>
                <td>
                  <button onClick={() => handleAñadirExistencias(producto.id)}>+</button>
                  <button onClick={() => handleQuitarExistencias(producto.id)}>-</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default StockPage;
