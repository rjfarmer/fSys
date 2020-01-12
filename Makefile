.PHONY: all clean install

all:
	$(MAKE) all -C src

clean:
	$(MAKE) clean -C src

install:
	$(MAKE) install -C src


test: install
	pip install --user -r requirements.txt
	python3 test/run_tests.py
