package=comet
pyenv=ENV2
UNAME=$(shell uname)
export ROOT_DIR=${PWD}/cloudmesh/rest/server
MONGOD=mongod --dbpath ~/.cloudmesh/data/db --bind_ip 127.0.0.1
EVE=cd $(ROOT_DIR); $(pyenv); python service.py
VERSION=`head -1 VERSION`

define banner
	@echo
	@echo "###################################"
	@echo $(1)
	@echo "###################################"
endef

ifeq ($(UNAME),Darwin)
define terminal
	osascript -e 'tell application "Terminal" to do script "$(1)"'
endef
endif
ifeq ($(UNAME),Linux)
define terminal
	echo "Linux not yet supported, fix me"
endef
endif
ifeq ($(UNAME),Windows)
define terminal
	echo "Windows not yet supported, fix me"
endef
endif



setup:
	# brew update
	# brew install mongodb
	# brew install jq
	rm -rf ~/.cloudmesh/data/db
	mkdir -p ~/.cloudmesh/data/db

kill:
	killall mongod

source:
	pip install -e .
	cms help

doc:
	cd docs; make html

view:
	open docs/build/html/index.html

publish:
	ghp-import -n -p docs/build/html

clean:
	rm -rf *.zip
	rm -rf *.egg-info
	rm -rf *.eggs
	rm -rf docs/build
	rm -rf build
	rm -rf dist
	find . -name '__pycache__' -delete
	find . -name '*.pyc' -delete
	find . -name '*.pye' -delete
	rm -rf .tox
	rm -f *.whl
	find . -name '*~' -delete


install:
	cd ../common; pip install .
	cd ../cmd5; pip install .
	pip install .

######################################################################
# PYPI
######################################################################


twine:
	pip install -U twine

dist:
	python setup.py sdist bdist_wheel
	twine check dist/*

build: clean
	$(call banner, "bbuild")
	bump2version --allow-dirty build
	python setup.py sdist bdist_wheel
	# git push origin master --tags
	twine check dist/*
	twine upload --repository testpypi  dist/*

patch: clean
	$(call banner, "patch")
	bump2version patch --allow-dirty
	@cat VERSION
	@echo

minor: clean
	$(call banner, "minor")
	bump2version minor --allow-dirty
	@cat VERSION
	@echo

release: clean
	$(call banner, "release")
	@ bump2version release --tag --allow-dirty
	@cat VERSION
	@echo
	python setup.py sdist bdist_wheel
	git push origin master --tags
	twine check dist/*
	twine upload --repository testpypi https://test.pypi.org/legacy/ dist/*
	@bump2version --new-version "$(VERSION)-dev0" part --allow-dirty
	@bump2version patch --allow-dirty
	$(call banner, "new-version")
	@cat VERSION
	@echo

dev:
	bump2version --new-version "$(VERSION)-dev0" part --allow-dirty
	bump2version patch --allow-dirty
	@cat VERSION
	@echo

reset:
	bump2version --new-version "4.0.0-dev0" part --allow-dirty

upload:
	twine check dist/*
	twine upload dist/*

pip: patch
	pip install --index-url https://test.pypi.org/simple/ \
	    --extra-index-url https://pypi.org/simple cloudmesh-$(package)

log:
	$(call banner, log)
	gitchangelog | fgrep -v ":dev:" | fgrep -v ":new:" > ChangeLog
	git commit -m "chg: dev: Update ChangeLog" ChangeLog
	git push
