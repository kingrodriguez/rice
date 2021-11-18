.DEFAULT_GOAL := build
.PHONY: install
PRODROOT="/"
PRODHOME="${HOME}"
TESTROOT="${PWD}/testroot"
TESTHOME="${TESTROOT}/home/testuser"

install:
	sudo pacman -S - < pkglist.txt

clean:
	rm -rf ${TESTROOT}

test_config:
	./src/build_config.sh ${TESTHOME}
