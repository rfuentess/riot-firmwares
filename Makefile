# Helper Makefile

.PHONY: all clean
all: build

# Clean all firmwares
clean:
	for fw in `ls apps`; do make -C apps/$$fw distclean; done

# Build all firmwares
build:
	for fw in `ls apps`; do make -C apps/$$fw all; done

init_submodules:
	git submodule update --init --recursive

build_tinydtls:
	make USE_COAPS="true" BROKER_PORT=5684 -C apps/node_iotlab_a8_m3  all

# FIXME Remove this once the support for secure_sock is added to the master
init_dtls:
	cd RIOT; \
	git remote add rfuentess https://github.com/rfuentess/riot.git; \
	git checkout Module_DTLS;
