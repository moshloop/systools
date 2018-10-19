NAME=systools
tag := $(shell git tag --points-at HEAD )

ifdef tag
else
  tag := $(shell git describe --abbrev=0 --tags)-debug
endif


.PHONY: package
package: *
	$(shell rm *.rpm || true)
	$(shell rm *.deb || true)
	docker run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) alanfranz/fpm-within-docker:ubuntu-xenial fpm  -s dir -t deb -n $(NAME) -v $(VERSION) ./bin/=/usr/bin/
	mv *.deb $(NAME).deb
	docker run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) alanfranz/fpm-within-docker:centos-7 fpm  -s dir -t rpm -n $(NAME) -v $(VERSION)  ./bin/=/usr/bin/
	mv *.rpm $(NAME).rpm