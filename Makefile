NAME ?= StormBreaker-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := $(KERN_VER)

SZIP := $(NAME)-r$(REVISION)-$(DATE).zip
BZIP := $(NAME)-r$(REVISION)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Storm* *placeholder*

stable: $(SZIP)
beta: $(BZIP)

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
	
clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
