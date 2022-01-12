CC=dart
FMT=format
ARGS="--help"
PROBLEM=

default: fmt

get:
	$(CC) pub get

fmt:
	$(CC) $(FMT) .
	$(CC) analyze .

clean:
	@echo "nothing here"

check:
	$(CC) test