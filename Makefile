.PHONY: build
build:
	sudo docker build -t python37:1.0 .

.PHONY: run
run:
	xhost + local:root
	sudo docker run -it \
    --network="host" \
	--volume=$(CURDIR):/home \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--env=DISPLAY=$(DISPLAY) \
	--env=QT_X11_NO_MITSHM=1 \
	 python37:1.0 /bin/bash

.PHONY: test
test:
	sudo docker run -it --network="host" -v $(CURDIR):/home python37:1.0 python -m pytest /home
