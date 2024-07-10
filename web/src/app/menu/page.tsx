// src/pages/menu.tsx
"use client";
import React, { useState } from 'react';
import NavBar from '../components/navbar';
import styles from './menu.module.css'; // Importa estilos CSS Modules

const MenuPage: React.FC = () => {
  const [id_servicio, setIdServicio] = useState('');
  const [id_cliente, setIdCliente] = useState('');
  const [id_horario, setIdHorario] = useState('');
  const [id_empleado, setIdEmpleado] = useState('');
  const [fecha, setFecha] = useState('');

  const handleFormSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const indice = parseInt(window.localStorage.getItem('indice') || '');
    const id_salon = indice; // Aquí asigna el id_salon arbitrariamente, según tus necesidades

    const formData = {
      id_salon,
      id_servicio,
      id_cliente,
      id_horario,
      id_empleado,
      fecha
    };

    try {
      const response = await fetch('http://localhost:3000/api/new_cita', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
      });

      if (!response.ok) {
        throw new Error('Failed to create new appointment');
      }

      alert('Cita agregada correctamente');
      setIdServicio('');
      setIdCliente('');
      setIdHorario('');
      setIdEmpleado('');
      setFecha('');
    } catch (error) {
      console.error('Error creating appointment:', error);
      alert('Hubo un error al agregar la cita');
    }
  };

  return (
    <div>
      <NavBar />
      <div className={styles.body}>
        <h1>Nueva Cita</h1>
        <form onSubmit={handleFormSubmit}>
          <label>ID Servicio:</label>
          <input
            type="text"
            value={id_servicio}
            onChange={(e) => setIdServicio(e.target.value)}
            required
          />
          <label>ID Cliente:</label>
          <input
            type="text"
            value={id_cliente}
            onChange={(e) => setIdCliente(e.target.value)}
            required
          />
          <label>ID Horario:</label>
          <input
            type="text"
            value={id_horario}
            onChange={(e) => setIdHorario(e.target.value)}
            required
          />
          <label>ID Empleado:</label>
          <input
            type="text"
            value={id_empleado}
            onChange={(e) => setIdEmpleado(e.target.value)}
            required
          />
          <label>Fecha (YYYY-MM-DD):</label>
          <input
            type="date"
            value={fecha}
            onChange={(e) => setFecha(e.target.value)}
            required
          />
          <button type="submit">Agregar Cita</button>
        </form>
      </div>
    </div>
  );
};

export default MenuPage;
