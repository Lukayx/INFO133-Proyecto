"use client";
import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import DatePicker from 'react-datepicker'; // Importa react-datepicker
import 'react-datepicker/dist/react-datepicker.css'; // Estilos por defecto de react-datepicker
import NavBar from '../components/navbar';
import styles from './menu.module.css';
import { format, addMinutes } from 'date-fns'; // Importa addMinutes para ajustar la hora actual

const Menu: React.FC = () => {
  const [showForm, setShowForm] = useState(false);
  const [clientes, setClientes] = useState([
    { nombre: 'Juan Pérez', hora: '12:56 del día 06-07', tipoCorte: 'Corte de Cabello', precio: '$20', peluquero: 'Juan' },
    { nombre: 'María García', hora: '14:56 del día 06-07', tipoCorte: 'Corte y Peinado', precio: '$30', peluquero: 'María' },
  ]);
  const [formData, setFormData] = useState({ nombre: '', tipoCorte: '', precio: '' });
  const [selectedStylist, setSelectedStylist] = useState<string>(''); // Estado para el peluquero seleccionado
  const [selectedDate, setSelectedDate] = useState<Date | null>(null); // Estado para la fecha seleccionada

  const router = useRouter();

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prevData => ({ ...prevData, [name]: value }));
  };

  const handleStylistChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedStylist(e.target.value);
  };

  const handleAddCliente = () => {
    if (!selectedDate) {
      alert('Por favor selecciona una hora.');
      return;
    }

    const hora = format(selectedDate, ' HH:mm \'del día\' dd-MM');
    
    const newCliente = {
      nombre: formData.nombre,
      hora: hora,
      tipoCorte: formData.tipoCorte,
      precio: `$${formData.precio}`,
      peluquero: selectedStylist
    };
    setClientes(prevClientes => [...prevClientes, newCliente]);
    setShowForm(false);
    setFormData({ nombre: '', tipoCorte: '', precio: '' });
    setSelectedStylist('');
    setSelectedDate(null);
  };

  const handleSelectNow = () => {
    setSelectedDate(new Date()); // Establece la fecha y hora actual
  };

  const navigateToLogin = () => {
    router.push('/'); // Navegar a la página de inicio de sesión
  };

  return (
    <div>
      <NavBar />
      <div className={styles.body}>
        <div className={styles.buttons}>
          <button className={styles.button} onClick={() => setShowForm(true)}>Nuevo Cliente</button>
          <button className={styles.button} onClick={navigateToLogin}>Cerrar Sesión</button>
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
            <label htmlFor="stylist">Peluquero:</label>
            <select
              id="stylist"
              name="stylist"
              value={selectedStylist}
              onChange={handleStylistChange}
            >
              <option value="">Selecciona un peluquero...</option>
              <option value="Juan">Juan</option>
              <option value="María">María</option>
              {/* Agrega más opciones según los peluqueros disponibles */}
            </select>
            
            <label htmlFor="time">Hora:</label>
            <div className={styles.datePickerContainer}>
              <DatePicker
                selected={selectedDate}
                onChange={(date: Date | null) => setSelectedDate(date)}
                showTimeSelect
                minDate={new Date()} // Solo permite fechas y horas desde ahora en adelante
                dateFormat="Pp"
              />
              <button className={styles.nowButton} onClick={handleSelectNow}>Ahora</button>
            </div>
            
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
              <th>Peluquero</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map((cliente, index) => (
              <tr key={index}>
                <td>{cliente.nombre}</td>
                <td>{cliente.hora}</td>
                <td>{cliente.tipoCorte}</td>
                <td>{cliente.precio}</td>
                <td>{cliente.peluquero}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Menu;
