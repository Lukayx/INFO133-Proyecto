// src/pages/ventas.tsx
"use client"; //es increible pero esta weaita de acá me deja usar el usestate xd?
import React, { useState } from 'react';
import NavBar from '../components/navbar';
import { format } from 'date-fns';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import styles from './ventas.module.css';

interface CorteDePelo {
  id: number;
  fecha: string;
  hora: string;
  tipoCorte: string;
  precio: string;
}

const VentasPage: React.FC = () => {
  const [fechaInicial, setFechaInicial] = useState<Date | null>(null);
  const [fechaFinal, setFechaFinal] = useState<Date | null>(null);

  // Simulación de datos de cortes de pelo
  const cortesDePelo: CorteDePelo[] = [
    { id: 1, fecha: '2024-07-06', hora: '10:00', tipoCorte: 'Corte de Cabello', precio: '$20' },
    { id: 2, fecha: '2024-07-06', hora: '11:30', tipoCorte: 'Corte y Peinado', precio: '$30' },
    { id: 3, fecha: '2024-07-05', hora: '09:00', tipoCorte: 'Corte de Barba', precio: '$15' },
    { id: 4, fecha: '2024-07-05', hora: '14:00', tipoCorte: 'Corte y Tinte', precio: '$40' },
  ];

  // Función para filtrar cortes de pelo por rango de fechas
  const filtrarPorFechas = () => {
    if (!fechaInicial || !fechaFinal) return cortesDePelo;
    return cortesDePelo.filter(corte => {
      const corteDate = new Date(corte.fecha);
      return corteDate >= fechaInicial && corteDate <= fechaFinal;
    });
  };

  return (
    <div>
      <NavBar />
      <div className={styles.pageContainer}>
        <h1>Ventas</h1>
        {/* Selector de fechas */}
        <div className={styles.datePickerContainer}>
          <DatePicker
            selected={fechaInicial}
            onChange={(date: Date | null) => setFechaInicial(date)}
            placeholderText="Fecha inicial"
            dateFormat="dd/MM/yyyy"
          />
          <DatePicker
            selected={fechaFinal}
            onChange={(date: Date | null) => setFechaFinal(date)}
            placeholderText="Fecha final"
            dateFormat="dd/MM/yyyy"
          />
        </div>
        {/* Sección de separación por fecha */}
        {Object.keys(filtrarPorFechas()).map((fecha, index) => (
          <div key={index} className={styles.sectionContainer}>
            <h2 className={styles.dateHeader}>{format(new Date(fecha), 'dd-MM-yyyy')}</h2>
            <table className={styles.tableContainer}>
              <thead>
                <tr>
                  <th>Hora</th>
                  <th>Tipo de Corte</th>
                  <th>Precio</th>
                </tr>
              </thead>
              <tbody>
                {/* Filtrar y mostrar cortes de pelo por fecha */}
                {filtrarPorFechas().map(corte => (
                  <tr key={corte.id}>
                    <td>{corte.hora}</td>
                    <td>{corte.tipoCorte}</td>
                    <td>{corte.precio}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ))}
      </div>
    </div>
  );
};

export default VentasPage;
