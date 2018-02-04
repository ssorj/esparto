PORT := /dev/ttyUSB0
BAUD := 115200

ARGON_DIR := ~/code/argon

.PHONY: install
install:
#	ampy --port ${PORT} --baud ${BAUD} rmdir /argon
	ampy --port ${PORT} --baud ${BAUD} mkdir /argon
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/common.py /argon/common.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/data.py /argon/data.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/data_debug.py /argon/data_debug.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/__init__.py /argon/__init__.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/frames.py /argon/frames.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/frames_debug.py /argon/frames_debug.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/transport.py /argon/transport.py
	ampy --port ${PORT} --baud ${BAUD} put ${ARGON_DIR}/python/argon/transport_debug.py /argon/transport_debug.py
	ampy --port ${PORT} --baud ${BAUD} put bme280.py /bme280.py

.PHONY: test
test:
	ampy --port ${PORT} --baud ${BAUD} run test.py

.PHONY: test2
test2:
	ampy --port ${PORT} --baud ${BAUD} run test2.py

.PHONY: ls
ls:
	ampy --port ${PORT} --baud ${BAUD} ls
	ampy --port ${PORT} --baud ${BAUD} ls /argon

.PHONY: repl
repl:
	picocom ${PORT} -b ${BAUD}
