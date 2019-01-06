import argon.main
import argon.message
import bme280
import gc
import machine
import network
import time

def setup():
    sta_if = network.WLAN(network.STA_IF);
    sta_if.active(True)
    sta_if.connect("1 Beaconcrest Court", "billerica15")

    while not sta_if.isconnected():
        time.sleep(1)

    print("WIFI UP")

    gc.collect()
    print("MEM FREE", gc.mem_free())

def bme():
    i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4))
    bme = bme280.BME280(i2c=i2c)
    print(bme.values)
    
def run():
    i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4))
    bme = bme280.BME280(i2c=i2c)

    message = argon.message.Message()
    
    while True:
        time.sleep(10)

        message.body = "[" + ", ".join(bme.values) + "]"

        try:
            argon.main.send("amqp.zone", "5672", "test", message)
        except Exception as e:
            print("ERROR! {}".format(str(e)))

        gc.collect()
        print("MEM FREE", gc.mem_free())
