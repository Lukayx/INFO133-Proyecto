"use client";
import React, { useState } from 'react';
import { useRouter } from 'next/navigation'; // Corregido: cambia de 'next/navigation' a 'next/router'
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import NavBar from '../components/navbar';
import styles from './menu.module.css';
import { format } from 'date-fns';

const Menu: React.FC = () => {
  const [showForm, setShowForm] = useState(false);
  const [clientes, setClientes] = useState([
    { nombre: 'Juan Pérez', hora: '12:56 del día 06-07', tipoCorte: 'Corte de Cabello', peluquero: 'Juan' },
    { nombre: 'María García', hora: '14:56 del día 06-07', tipoCorte: 'Corte y Peinado', peluquero: 'María' },
  ]);
  const [formData, setFormData] = useState({ nombre: '', tipoCorte: '' });
  const [selectedStylist, setSelectedStylist] = useState<string>('');
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);

  const indice = parseInt(process.env.NEXT_PUBLIC_INDICE || '0'); // Asegúrate de manejar el caso en que no haya ningún valor definido
  console.log('Índice de esta wea es estoy en menu:', indice);

  const router = useRouter();
  
  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
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
      peluquero: selectedStylist
    }; 

    setClientes(prevClientes => [...prevClientes, newCliente]);
    setShowForm(false);
    setFormData({ nombre: '', tipoCorte: '' });
    setSelectedStylist('');
    setSelectedDate(null);
  };

  const handleSelectNow = () => {
    setSelectedDate(new Date());
  };

  const navigateToLogin = () => {
    router.push('/'); // Navegar a la página de inicio de sesión
  };

  const tipoCorteOptions = [
    'Corte de Cabello',
    'Corte y Peinado',
    'Manicure',
    'Pedicure',
    'Tratamiento Capilar',
    'Tinte',
    'Otros'
  ];

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
            <label htmlFor="tipoCorte">Tipo de Corte:</label>
            <select
              id="tipoCorte"
              name="tipoCorte"
              value={formData.tipoCorte}
              onChange={handleFormChange}
            >
              <option value="">Selecciona un tipo de corte...</option>
              {tipoCorteOptions.map((option, index) => (
                <option key={index} value={option}>{option}</option>
              ))}
            </select>

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
                minDate={new Date()}
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
              <th>Peluquero</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map((cliente, index) => (
              <tr key={index}>
                <td>{cliente.nombre}</td>
                <td>{cliente.hora}</td>
                <td>{cliente.tipoCorte}</td>
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
