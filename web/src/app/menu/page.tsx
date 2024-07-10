// src/pages/menu.tsx
"use client";
import React, { useState, useEffect } from 'react';
import NavBar from '../components/navbar';
import styles from './menu.module.css'; // Importa estilos CSS Modules

interface Empleado {
  id: number;
  nombre: string;
}

const MenuPage: React.FC = () => {
  const [id_servicio, setIdServicio] = useState('');
  const [id_cliente, setIdCliente] = useState('');
  const [id_horario, setIdHorario] = useState('');
  const [id_empleado, setIdEmpleado] = useState('');
  const [fecha, setFecha] = useState('');
  const [empleados, setEmpleados] = useState<Empleado[]>([]);

  const indice = parseInt(window.localStorage.getItem('indice') || '');
  const id_salon = indice;

  useEffect(() => {
    const fetchEmpleados = async () => {
      try {
        const response = await fetch(`http://localhost:3000/api/get_empleado?salonId=${id_salon}`);
        if (!response.ok) {
          throw new Error('Error al obtener los empleados');
        }
        const data = await response.json();
        setEmpleados(data.empleados);
      } catch (error) {
        console.error('Error fetching empleados:', error);
      }
    };

    fetchEmpleados();
  }, [id_salon]);

  const handleFormSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

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
          <label>Empleado:</label>
          <select
            value={id_empleado}
            onChange={(e) => setIdEmpleado(e.target.value)}
            required
          >
            <option value="">Seleccione un empleado</option>
            {empleados.map(empleado => (
              <option key={empleado.id} value={empleado.id}>
                {empleado.nombre}
              </option>
            ))}
          </select>
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
