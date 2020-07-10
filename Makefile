
TARGET   =  local_postgrest_0

# default target: help
help:
	@echo 'Use "build" target'

build:
	docker build -t $(TARGET) .
