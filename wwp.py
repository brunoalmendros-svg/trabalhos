import pyautogui as py
import time as t

# Abrir o Chrome
t.sleep(0.5)
py.press('winleft')
t.sleep(0.5)
py.write('chrome')
t.sleep(0.5)
py.press('enter')
t.sleep(1.5)

# Abrir WhatsApp Web
py.write('web.whatsapp.com', interval=0.05)
py.press('enter')
t.sleep(10.0)  

# ALERTA 1
py.write('11983760579', interval=0.05)  
t.sleep(1.5)
py.press('enter')
t.sleep(2.0)
py.write('Este é um alerta automático. Favor verificar o sistema!', interval=0.05)
t.sleep(1.0)
py.press('enter')  # Envia mensagem
t.sleep(2.0)

# ALERTA 2
py.click(200, 200)  
t.sleep(1.0)
py.write('11987545258', interval=0.05)
t.sleep(1.5)
py.press('enter')
t.sleep(2.0)
py.write('Este é outro alerta automático. Atenção ao sistema!', interval=0.05)
t.sleep(1.0)
py.press('enter')