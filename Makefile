ASM=nasm

SRC_DIR=./src
BUILD_DIR=./build

$(BUILD_DIR)/begin_floppy.img: $(BUILD_DIR)/begin.bin
	cp $(BUILD_DIR)/begin.bin $(BUILD_DIR)/begin_floppy.img
	truncate -s 1440K $(BUILD_DIR)/begin_floppy.img

$(BUILD_DIR)/begin.bin: $(SRC_DIR)/begin.asm
	$(ASM) $(SRC_DIR)/begin.asm -f bin -o $(BUILD_DIR)/begin.bin
