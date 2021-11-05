.DEFAULT_GOAL := build
.PHONY: install

install:
	sudo pacman -S - < pkglist.txt

config_header:
	./scripts/build_config_header.sh