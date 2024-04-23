# GNU Automake config

EXTRA_DIST = 1d*

all:

install:
	mkdir -p ${prefix}/model/1d
	if ! test . -ef ${prefix}/model/1d; then \
		cp 1d* ${prefix}/model/1d; \
		cp bbp1d* ${prefix}/model/1d; \
		cp nc1d* ${prefix}/model/1d; \
        fi

clean:
