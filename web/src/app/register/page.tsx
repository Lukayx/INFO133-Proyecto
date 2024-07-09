// pages/register.tsx
"use client";
import { useState, ChangeEvent, FormEvent } from 'react';
import { useRouter } from 'next/navigation';
import styles from './register.module.css';

export default function Register() {
  const [formData, setFormData] = useState({
    rut: '',
    name: '',
    salonName: '',
    comuna: 'Seleccionar', // Valor inicial del select
  });
  const router = useRouter();

  const handleChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    console.log('Form data submitted:', formData);
    // Aquí puedes manejar el envío del formulario, por ejemplo, enviando los datos a tu servidor
    router.push('/menu'); // Navegar a la página de menú después de registrarse
  };

  return (
    <main className={styles.main}>
      <h1 className={styles.title}>Registro de Peluquería</h1>
      <div className={styles.registerBox}>
        <form className={styles.form} onSubmit={handleSubmit}>
          <label htmlFor="rut" className={styles.label}>RUT:</label>
          <input
            type="text"
            id="rut"
            name="rut"
            className={styles.input}
            value={formData.rut}
            onChange={handleChange}
            required
          />

          <label htmlFor="name" className={styles.label}>Nombre:</label>
          <input
            type="text"
            id="name"
            name="name"
            className={styles.input}
            value={formData.name}
            onChange={handleChange}
            required
          />

          <label htmlFor="salonName" className={styles.label}>Nombre de la Peluquería:</label>
          <input
            type="text"
            id="salonName"
            name="salonName"
            className={styles.input}
            value={formData.salonName}
            onChange={handleChange}
            required
          />

          <label htmlFor="comuna" className={styles.label}>Comuna:</label>
          <select
            id="comuna"
            name="comuna"
            className={styles.input}
            value={formData.comuna}
            onChange={handleChange}
            required
          >
            <option value="Seleccionar">Seleccionar</option>
            <option value="pico">Santiago</option>
            <option value="Provi">Providencia</option>
            <option value="colina1">Las Condes</option>
            <option value="Ñuñoa">Ñuñoa</option>
            {/* Agrega más opciones según tus necesidades */}
          </select>

          <button type="submit" className={styles.button}>
            Registrarse
          </button>
        </form>
      </div>
    </main>
  );
}
