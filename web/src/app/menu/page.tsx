"use client";

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import NavBar from '../components/navbar';
import styles from './menu.module.css';
import { format } from 'date-fns';

interface Cliente {
  rut: string;
  hora: string;
  tipoCorte: string;
  peluquero: string;
}

const Menu: React.FC = () => {
  const [showForm, setShowForm] = useState(false);
  const [clientes, setClientes] = useState<Cliente[]>([
    { rut: '123456789', hora: '12:56 del día 06-07', tipoCorte: 'Corte de Cabello', peluquero: 'Juan' },
    { rut: '987654321', hora: '14:56 del día 06-07', tipoCorte: 'Corte y Peinado', peluquero: 'María' },
  ]);
  const [formData, setFormData] = useState({ rut: '', tipoCorte: '' });
  const [selectedStylist, setSelectedStylist] = useState<string>('');
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [peluqueros, setPeluqueros] = useState<{ id: number; nombre: string }[]>([]);
  const [clienteId, setClienteId] = useState<number | null>(null);

  const router = useRouter();
  const salonId = parseInt(localStorage.getItem('indice') || '0', 10); // Ajusta el valor predeterminado según tu lógica

  useEffect(() => {
    const fetchPeluqueros = async () => {
      try {
        const response = await fetch(`http://localhost:3000/api/get_empleado?salonId=${salonId}`);
        const data = await response.json();
        setPeluqueros(data.empleados || []);
      } catch (error) {
        console.error('Error fetching peluqueros:', error);
      }
    };

    fetchPeluqueros();
  }, [salonId]);

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prevData => ({ ...prevData, [name]: value }));

    if (name === 'rut') {
      fetchClienteId(value);
    }
  };

  const fetchClienteId = async (rut: string) => {
    try {
      const response = await fetch(`http://localhost:3000/api/get_cliente?rut=${rut}`);
      const data = await response.json();
      if (data.clienteId) {
        setClienteId(data.clienteId);
      } else {
        setClienteId(null);
      }
    } catch (error) {
      console.error('Error fetching cliente ID:', error);
      setClienteId(null);
    }
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

    const newCliente: Cliente = {
      rut: formData.rut,
      hora: hora,
      tipoCorte: formData.tipoCorte,
      peluquero: selectedStylist
    };

    setClientes(prevClientes => [...prevClientes, newCliente]);
    setShowForm(false);
    setFormData({ rut: '', tipoCorte: '' });
    setSelectedStylist('');
    setSelectedDate(null);
    setClienteId(null);
  };

  const navigateToLogin = () => {
    router.push('/');
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
              name="rut"
              value={formData.rut}
              onChange={handleFormChange}
              placeholder="RUT del Cliente"
            />
            {clienteId !== null && (
              <p>ID del Cliente: {clienteId}</p>
            )}
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
              {peluqueros.map((peluquero) => (
                <option key={peluquero.id} value={peluquero.nombre}>{peluquero.nombre}</option>
              ))}
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
              <button className={styles.nowButton} onClick={() => setSelectedDate(new Date())}>Ahora</button>
            </div>

            <button onClick={handleAddCliente}>Agregar Cliente</button>
            <button onClick={() => setShowForm(false)}>Cancelar</button>
          </div>
        )}
        <table className={styles.table}>
          <thead>
            <tr>
              <th>RUT del Cliente</th>
              <th>Hora</th>
              <th>Tipo de Corte</th>
              <th>Peluquero</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map((cliente, index) => (
              <tr key={index}>
                <td>{cliente.rut}</td>
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
