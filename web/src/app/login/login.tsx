"use client";
import { useState, useEffect, ChangeEvent } from 'react';
import { useRouter } from 'next/navigation';
import styles from './login.module.css';
interface Peluqueria {
  id: number;
  rut_empresa: string; // Asumo que el RUT de la empresa es un string según los datos de ejemplo
}

export default function Login() {
  const [rut, setRut] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [peluquerias, setPeluquerias] = useState<Peluqueria[]>([]);
  const [loading, setLoading] = useState(true);
  const router = useRouter();

  useEffect(() => {
    const fetchPeluquerias = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/get_pelu');
        if (!response.ok) {
          throw new Error('Error al obtener las peluquerías');
        }
        const data = await response.json();
        setPeluquerias(data.peluqueriaData); // Asegúrate de usar el mismo nombre que recibes de la API
        setLoading(false);
      } catch (error) {
        console.error('Error fetching peluquerías:', error);
        setLoading(false);
      }
    };

    fetchPeluquerias();
  }, []);

  const handleRutChange = (e: ChangeEvent<HTMLInputElement>) => {
    let value = e.target.value.replace(/[^0-9kK]/g, ''); // Eliminar cualquier carácter que no sea un número o la 'k' o 'K'
    
    setRut(value);
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setPassword(e.target.value);
  };

  const handleLoginClick = async () => {
    try {
      if (!rut.trim()) {
        alert('Por favor ingrese un RUT válido');
        return;
      }

      // Verificar si peluquerias contiene datos
      if (peluquerias.length === 0) {
        console.log('No hay datos de peluquerías disponibles');
        return;
      }
      const ruts = peluquerias.map(peluqueria => parseInt(peluqueria.rut_empresa));

      if (ruts.indexOf(parseInt(rut)) != -1 ) {
        console.log('Peluquería encontrada:',);
        let index = ruts.indexOf(parseInt(rut)) //este indice voy a importar para el siguiente que será el menu

        
        // Aquí puedes almacenar el id de la peluquería para usar en las siguientes páginas, por ejemplo, en el estado global o en un contexto
        router.push(`/menu?indice=${index}`);
      } else {
        alert('Peluquería no encontrada');
        console.log(ruts)
        console.log(rut)
      }
    } catch (error) {
      console.error('Error al buscar la peluquería:', error);
    }
  };

  if (loading) {
    return <p>Cargando...</p>;
  }

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
          <input
            type="password"
            id="password"
            name="password"
            className={styles.input}
            value={password}
            onChange={handlePasswordChange}
            required
          />

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
