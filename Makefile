export AMPY_PORT := /dev/ttyUSB0
export AMPY_BAUD := 115200

ARGON_DIR := ~/code/argon

.PHONY: default
default: repl

.PHONY: init
init:
	ampy mkdir /argon

.PHONY: install
install:
#	mpy-cross bme280.py -o bme280.mpy
	ampy put bme280.py /bme280.py
	ampy put test.py /test.py

.PHONY: install-argon
install-argon:
	(ampy mkdir /argon 2>/dev/null || :)
	scripts/install-argon ${ARGON_DIR}

.PHONY: ls
ls:
	ampy ls

.PHONY: repl
repl:
	picocom ${AMPY_PORT} -b ${AMPY_BAUD}

.PHONY: flash-micropython
flash-micropython:
	esptool --chip esp32 --port ${AMPY_PORT} write_flash -z 0x1000 esp32-*.bin
