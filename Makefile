NAME ?= Unitrix-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := $(KERN_VER)

SZIP := $(NAME)-$(VERSION)-STABLE-$(DATE).zip
BZIP := $(NAME)-$(VERSION)-BETA-$(DATE).zip
TZIP := $(NAME)-$(VERSION)-TEST-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Unitrix* *placeholder*

stable: $(SZIP)
beta: $(BZIP)
test: $(TZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(TZIP):
	@echo "Creating ZIP: $(TZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."		

clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
