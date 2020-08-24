NAME ?= StormBreaker-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := $(KERN_VER)
REVISION_TAG := $(REVISION)

ZIP := $(NAME)-$(VERSION)-r$(REVISION_TAG)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Storm* *placeholder*

zip: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
