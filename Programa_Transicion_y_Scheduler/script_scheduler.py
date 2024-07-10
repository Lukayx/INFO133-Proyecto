import schedule
import time
import os

def ejecutar_Transicion():
    os.system("python programa_Base_de_Datos_de_transaccional_a_analisis.py")

schedule.every(7).days.at("02:00").do(ejecutar_Transicion)  # ejecutar cada 7 días a las 2:00 AM

while True:
    schedule.run_pending()
    time.sleep(1)