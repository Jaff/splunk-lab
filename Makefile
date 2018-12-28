IMG=$(shell basename $(CURDIR))
REG=docker.tivo.com/mjaffe
IID=$(REG)/$(IMG)

all:
	@echo "build | push | shell | run | stop"

build:
	docker build -t $(IID) .

push:
	docker push $(IID)

shell:
	docker exec -it $(IMG) bash

run: build  push
	docker run -d --restart=unless-stopped \
	--net splunk --name $(IMG) --hostname $(IMG) \
	--env SPLUNK_START_ARGS='--accept-license --seed-passwd changeme' \
	-p 1514:1514 -p 8000:8000 -p 8088:8088 -p 8089:8089 -p 8191:8191 -p 9997:9997 \
	-v $(PWD)/data:/data -v $(PWD):/mnt -v $(PWD)/logs:/opt/splunk/var/log  $(IID)

stop:
	docker stop $(IMG) ; docker rm -f $(IMG)
