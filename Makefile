NAME=aws-systools
VERSION=1.4

.PHONY: package
package: *
	rm *.rpm || echo
	docker run --rm -it -v $(CURDIR):/work -w /work fpm-builder fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -x "*.DS_Store" ./bin/=/usr/bin/
	s3cmd put -P *.rpm s3://vg-binary-mirror/

