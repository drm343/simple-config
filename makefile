all:
	@echo "do nothing"

install:
	sh ./install.sh

install.slackware: install
	sh ./install-slackware.sh
