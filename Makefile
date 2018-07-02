NAME=systools
VERSION=2.0

.PHONY: package
package: *
	rm *.rpm || echo
	docker run --rm -it -v $(CURDIR): $(CURDIR) -w  $(CURDIR) fpm-builder fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -x "*.DS_Store" ./bin/=/usr/bin/


