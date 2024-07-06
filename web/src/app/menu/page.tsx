"use client";

import React, { useState } from 'react';
import NavBar from '../components/navbar';
import styles from './menu.module.css';
import { format } from 'date-fns';

const Menu: React.FC = () => {
  const [showForm, setShowForm] = useState(false);
  const [clientes, setClientes] = useState([
    { nombre: 'Juan Pérez', hora: '12:56 del día 06-07	', tipoCorte: 'Corte de Cabello', precio: '$20' },
    { nombre: 'María García', hora: '14:56 del día 06-07	', tipoCorte: 'Corte y Peinado', precio: '$30' },
  ]);
  const [formData, setFormData] = useState({ nombre: '', tipoCorte: '', precio: '' });

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prevData => ({ ...prevData, [name]: value }));
  };

  const handleAddCliente = () => {
    const now = new Date();
    const newCliente = {
      nombre: formData.nombre,
      hora: format(now, ' HH:mm \'del día\' dd-MM'),
      tipoCorte: formData.tipoCorte,
      precio: `$${formData.precio}`
    };
    setClientes(prevClientes => [...prevClientes, newCliente]);
    setShowForm(false);
    setFormData({ nombre: '', tipoCorte: '', precio: '' });
  };

  return (
    <div>
      <NavBar />
      <div className={styles.body}>
        <div className={styles.buttons}>
          <button className={styles.button} onClick={() => setShowForm(true)}>Nuevo Cliente</button>
        </div>
        {showForm && (
          <div className={styles.form}>
            <input
              type="text"
              name="nombre"
              value={formData.nombre}
              onChange={handleFormChange}
              placeholder="Nombre del Cliente"
            />
            <input
              type="text"
              name="tipoCorte"
              value={formData.tipoCorte}
              onChange={handleFormChange}
              placeholder="Tipo de Corte"
            />
            <input
              type="number"
              name="precio"
              value={formData.precio}
              onChange={handleFormChange}
              placeholder="Precio"
            />
            <button onClick={handleAddCliente}>Agregar Cliente</button>
            <button onClick={() => setShowForm(false)}>Cancelar</button>
          </div>
        )}
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Nombre del Cliente</th>
              <th>Hora</th>
              <th>Tipo de Corte</th>
              <th>Precio</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map((cliente, index) => (
              <tr key={index}>
                <td>{cliente.nombre}</td>
                <td>{cliente.hora}</td>
                <td>{cliente.tipoCorte}</td>
                <td>{cliente.precio}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Menu;
