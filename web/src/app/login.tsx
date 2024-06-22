import Link from 'next/link';
import styles from './login.module.css';

export default function Login() {
  return (
    <main className={styles.main}>
      <h1 className={styles.title}>Sistema de Peluquerías</h1>
      <div className={styles.loginBox}>
        <form className={styles.form}>
          <label htmlFor="rut" className={styles.label}>RUT:</label>
          <input type="text" id="rut" name="rut" className={styles.input} required />
          
          <label htmlFor="password" className={styles.label}>Contraseña:</label>
          <input type="password" id="password" name="password" className={styles.input} required />
          
          {/* Utiliza onClick para manejar el evento de clic */}
          <Link href="/menu">
            <button type="button" className={styles.button}>
              Iniciar Sesión
            </button>
          </Link>
        </form>
        <div className={styles.links}>
          {/* Enlace para navegar a la página de registro */}
          <a href="/register" className={styles.link}>¿Aún no te has registrado?</a>
        </div>
      </div>
    </main>
  );
}
