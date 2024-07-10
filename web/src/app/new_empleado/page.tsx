// src/pages/estadisticas.tsx
"use client";
import React, { useState } from 'react';
import NavBar from '../components/navbar';
import styles from './new_empleado.module.css'; // Importa estilos CSS Modules

const EstadisticasPage: React.FC = () => {
  const [nombre, setNombre] = useState('');
  const [apellido, setApellido] = useState('');
  const [rut, setRut] = useState('');

  const handleFormSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const indice = parseInt(window.localStorage.getItem('indice') || '');
    const id_salon = indice; // Aquí asigna el id_salon arbitrariamente, según tus necesidades

    const formData = {
      nombre,
      apellido,
      rut,
      id_salon
    };

    try {
      const response = await fetch('http://localhost:3000/api/new_empleado', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
      });

      if (!response.ok) {
        throw new Error('Failed to add new employee');
      }

      alert('Empleado agregado correctamente');
      setNombre('');
      setApellido('');
      setRut('');
    } catch (error) {
      console.error('Error adding employee:', error);
      alert('Hubo un error al agregar el empleado');
    }
  };

  return (
    <div>
      <NavBar />
      <div className={styles.body}>
        <h1>Nuevo Empleado</h1>
        <form onSubmit={handleFormSubmit}>
          <label>Nombre:</label>
          <input
            type="text"
            value={nombre}
            onChange={(e) => setNombre(e.target.value)}
            required
          />
          <label>Apellido:</label>
          <input
            type="text"
            value={apellido}
            onChange={(e) => setApellido(e.target.value)}
            required
          />
          <label>RUT:</label>
          <input
            type="text"
            value={rut}
            onChange={(e) => setRut(e.target.value)}
            required
          />
          <button type="submit">Agregar Empleado</button>
        </form>
      </div>
    </div>
  );
};

export default EstadisticasPage;
