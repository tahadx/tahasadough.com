DIST     = dist
BIN      = bin
TAILWIND = $(BIN)/tailwindcss

.PHONY: all build check css dev serve clean

all: build

# The real build lives in scripts/build so hosts can run it without make.
build:
	scripts/build

css:
	scripts/build --css-only

check:
	scripts/verify

serve:
	python3 -m http.server 8080

dev:
	scripts/build --css-only
	./$(TAILWIND) -i ./input.css -o ./style.css --watch &
	@echo "Serving http://localhost:8080 — rebuilds CSS on save, reload for HTML edits."
	python3 -m http.server 8080

clean:
	rm -rf $(DIST) $(BIN) style.css
