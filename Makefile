.PHONY: all clean install

all:
	$(MAKE) all -C src

clean:
	$(MAKE) clean -C src

install:
	$(MAKE) install -C src
