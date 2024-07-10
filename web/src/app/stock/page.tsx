// src/pages/stock.tsx
"use client";
import React, { useState, useEffect } from 'react';
import NavBar from '../components/navbar';
import styles from './stock.module.css';

interface Producto {
  id: number;
  nombre: string;
  cantidad_stock: number;
  precio_compra: number;
}

const StockPage: React.FC = () => {
  const [productos, setProductos] = useState<Producto[]>([]);
  const indice = parseInt(window.localStorage.getItem('indice') || '');
  const salonId = indice;

  useEffect(() => {
    const fetchProductos = async () => {
      try {
        const response = await fetch(`http://localhost:3000/api/get_producto?id=${salonId}`);
        if (!response.ok) {
          throw new Error('Error al obtener los productos');
        }
        const data = await response.json();
        setProductos(data.peluqueriaData); // Actualiza los productos con la respuesta JSON recibida
      } catch (error) {
        console.error('Error fetching productos:', error);
      }
    };

    fetchProductos();
  }, [salonId]);

  const handleAñadirExistencias = (id: number) => {
    const nuevosProductos = productos.map(producto =>
      producto.id === id ? { ...producto, cantidad_stock: producto.cantidad_stock + 1 } : producto
    );
    setProductos(nuevosProductos);
  };

  const handleQuitarExistencias = (id: number) => {
    const nuevosProductos = productos.map(producto =>
      producto.id === id ? { ...producto, cantidad_stock: producto.cantidad_stock - 1 } : producto
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
              <th>Cantidad en Stock</th>
              <th>Precio de Compra</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {productos.map(producto => (
              <tr key={producto.id}>
                <td>{producto.nombre}</td>
                <td>{producto.cantidad_stock}</td>
                <td>${producto.precio_compra}</td>
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
