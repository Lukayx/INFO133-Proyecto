// pages/register.tsx
"use client";
import { useState, useEffect, ChangeEvent, FormEvent } from 'react';
import { useRouter } from 'next/navigation';
import styles from './register.module.css';

interface Comuna {
  id: number;
  nombre: string;
}

export default function Register() {
  const [formData, setFormData] = useState({
    rut: '',
    name: '',
    salonName: '',
    comuna: '', // Valor inicial del select
  });
  const [comunas, setComunas] = useState<Comuna[]>([]);
  const router = useRouter();

  useEffect(() => {
    // Función para obtener las comunas desde la API
    const fetchComunas = async () => {
      try {
        const response = await fetch('/api/get_comuna');
        const data = await response.json();
        setComunas(data.comunaData);
      } catch (error) {
        console.error('Error fetching comunas:', error);
      }
    };

    fetchComunas();
  }, []); // El array vacío asegura que esto se ejecute solo una vez al cargar la página

  const handleChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    console.log('Form data submitted:', formData);

    // Enviar los datos al servidor
    try {
      const response = await fetch('/api/new_pelu', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          rut_empresa: formData.rut,
          nombre: formData.salonName,
          id_comuna: parseInt(formData.comuna, 10), // Asegurarse de que sea un número
        }),
      });

      if (!response.ok) {
        throw new Error('Error al registrar la peluquería');
      }

      const data = await response.json();
      console.log('Registro exitoso:', data);

      // Navegar a la página de menú después de registrarse
      router.push('/');
    } catch (error) {
      console.error('Error registrando la peluquería:', error);
      // Puedes mostrar un mensaje de error al usuario si lo deseas
    }
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
            <option value="">Seleccionar</option>
            {comunas.map((comuna) => (
              <option key={comuna.id} value={comuna.id.toString()}>{comuna.nombre}</option>
            ))}
          </select>

          <button type="submit" className={styles.button}>
            Registrarse
          </button>
        </form>
      </div>
    </main>
  );
}
