import styles from './navbar.module.css';
import Link from 'next/link';

const NavBar: React.FC = () => {
  return (
    <nav className={styles.navBar}>
      <Link href="/menu" passHref>
        <span className={styles.navItem}>Inicio</span>
      </Link>
      <Link href="/ventas" passHref>
        <span className={styles.navItem}>Ventas</span>
      </Link>
      <Link href="/stock" passHref>
        <span className={styles.navItem}>Stock</span>
      </Link>
      <Link href="/estadisticas" passHref>
        <span className={styles.navItem}>Estadísticas</span>
      </Link>
    </nav>
  );
}

export default NavBar;
