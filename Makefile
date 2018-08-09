NAME=systools
VERSION=2.1

.PHONY: package
package: *
	rm *.rpm || echo
	rm *.deb || echo
	docker run --rm -it -v $(CURDIR):$(CURDIR) -w  $(CURDIR) alanfranz/fpm-within-docker:centos-7 fpm  -s dir -t rpm -n $(NAME) -v $(VERSION) -x "*.DS_Store" ./bin/=/usr/bin/

	docker run --rm -it -v $(CURDIR):$(CURDIR) -w  $(CURDIR) alanfranz/fpm-within-docker:ubuntu-xenial fpm  -s dir -t deb -n $(NAME) -v $(VERSION) -x "*.DS_Store" ./bin/=/usr/bin/