"use client";
import React, { useState, useEffect } from 'react';
import NavBar from '../components/navbar';
import styles from './ventas.module.css';

const VentasPage: React.FC = () => {
  const [ventasData, setVentasData] = useState<any[]>([]);
  const indice = parseInt(window.localStorage.getItem('indice') || '');
  const id = indice
  useEffect(() => {
    const fetchVentas = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/get_ventas?id='+id);
        if (!response.ok) {
          throw new Error('Error fetching ventas data');
        }
        const data = await response.json();
        setVentasData(data.citasData); // Asigna los datos de ventas a ventasData
      } catch (error) {
        console.error('Error fetching ventas data:', error);
        // Manejo de errores
      }
    };

    fetchVentas();
  }, []); // Se ejecuta solo al montar el componente

  return (
    <div>
      <NavBar />
      <div className={styles.pageContainer}>
        <h1>Datos de Ventas</h1>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>ID</th>
              <th>Fecha</th>
              <th>Hora Inicio</th>
              <th>Tipo de Servicio</th>
              <th>Cliente</th>
              <th>Empleado</th>
            </tr>
          </thead>
          <tbody>
            {ventasData.map((venta) => (
              <tr key={venta.id}>
                <td>{venta.id}</td>
                <td>{venta.fecha}</td>
                <td>{venta.hora_inicio}</td>
                <td>{venta.servicio}</td>
                <td>{venta.cliente}</td>
                <td>{venta.empleado}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default VentasPage;
