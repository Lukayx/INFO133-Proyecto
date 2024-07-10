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
  const [salonId, setSalonId] = useState<number | null>(null);

  useEffect(() => {
    const fetchProductos = async () => {
      if (salonId !== null) {
        try {
          const response = await fetch(`http://localhost:3000/api/get_pelus?id=${salonId}`);
          if (!response.ok) {
            throw new Error('Error al obtener los productos');
          }
          const data = await response.json();
          setProductos(data.peluqueriaData); // Actualiza los productos con la respuesta JSON recibida
        } catch (error) {
          console.error('Error fetching productos:', error);
        }
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

  const handleSalonIdChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSalonId(Number(e.target.value));
  };

  return (
    <div>
      <NavBar />
      <div className={styles.pageContainer}>
        <h1>Stock de Productos</h1>

        {/* Input para ingresar el ID del salón */}
        <div className={styles.inputContainer}>
          <label htmlFor="salonId">ID del Salón:</label>
          <input 
            type="number" 
            id="salonId" 
            value={salonId !== null ? salonId : ''} 
            onChange={handleSalonIdChange} 
          />
        </div>

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
