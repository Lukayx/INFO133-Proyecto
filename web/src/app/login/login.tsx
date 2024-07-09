"use client";
import { useState, ChangeEvent } from 'react';
import { useRouter } from 'next/navigation';
import styles from './login.module.css';

export default function Login() {
  const [rut, setRut] = useState<string>('');
  const router = useRouter();

  const handleRutChange = (e: ChangeEvent<HTMLInputElement>) => {
    let value = e.target.value.replace(/[^0-9kK]/g, ''); // Eliminar cualquier carácter que no sea un número o la 'k' o 'K'
    if (value.length > 1) {
      value = value.slice(0, -1) + '-' + value.slice(-1); // Agregar guión antes del último dígito
    }
    setRut(value);
  };

  const handleLoginClick = () => {
    if (!rut.trim()) {
      alert('Por favor ingrese un RUT válido');
      return;
    }
    console.log(rut);//aqui pueden hacer validacion chavales  

    router.push('/menu'); // Navegar a la página de menú si el RUT no está vacío
  };

  return (
    <main className={styles.main}>
      <h1 className={styles.title}>Sistema de Peluquerías</h1>
      <div className={styles.loginBox}>
        <form className={styles.form}>
          <label htmlFor="rut" className={styles.label}>RUT:</label>
          <input
            type="text"
            id="rut"
            name="rut"
            className={styles.input}
            value={rut}
            onChange={handleRutChange}
            required
          />
          
          <label htmlFor="password" className={styles.label}>Contraseña:</label>
          <input type="password" id="password" name="password" className={styles.input} required />
          
          <button type="button" className={styles.button} onClick={handleLoginClick}>
            Iniciar Sesión
          </button>
        </form>
        <div className={styles.links}>
          <a href="/register" className={styles.link}>¿Aún no te has registrado?</a>
        </div>
      </div>
    </main>
  );
}
