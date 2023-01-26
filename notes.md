## Dependencies

- esptool
- ampy

## Unfiled

picocom /dev/ttyUSB0 -b115200
ampy --port /dev/ttyUSB0 --baud 115200 run test.py
esptool.py --chip esp32 --port /dev/ttyUSB0 write_flash -z 0x1000 esp32-20180217-v1.9.3-318-g60c6b880.bin

- https://www.reddit.com/r/RISCV/comments/10l9mfo/my_visionfive2_quickstart_may_help_others/ - Guidance on setting up a serial console
