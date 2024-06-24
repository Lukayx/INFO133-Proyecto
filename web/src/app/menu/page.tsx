
import NavBar from '../components/navbar';
import styles from './menu.module.css';

const Menu: React.FC = () => {
  return (
    <div>
      <NavBar />
      <div className={styles.body}>
        <div className={styles.buttons}>
          <button className={styles.button}>Agendar Hora</button>
          <button className={styles.button}>Nuevo Cliente</button>
        </div>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Nombre del Cliente</th>
              <th>Hora</th>
              <th>Tipo de Corte</th>
              <th>Precio</th>
            </tr>
          </thead>
          <tbody>
            {/* Aquí puedes añadir los datos de los clientes */}
            <tr>
              <td>Juan Pérez</td>
              <td>10:00</td>
              <td>Corte de Cabello</td>
              <td>$20</td>
            </tr>
            <tr>
              <td>María García</td>
              <td>11:30</td>
              <td>Corte y Peinado</td>
              <td>$30</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Menu;
