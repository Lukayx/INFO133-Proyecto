import styles from './navbar.module.css';

const NavBar: React.FC = () => {
  return (
    <nav className={styles.navBar}>
      <span className={styles.navItem}>Inicio</span>
      <span className={styles.navItem}>Ventas</span>
      <span className={styles.navItem}>Stock</span>
      <span className={styles.navItem}>Estadísticas</span>
    </nav>
  );
}

export default NavBar;
