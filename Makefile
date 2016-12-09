dockerfiles: Dockerfile.tmpl
	for tag in 0.10 0.12 4 5 6 7; do \
		test -d dockerfiles/$${tag} || mkdir -p dockerfiles/$${tag}; \
		sed -e 's!__TAG__!'$${tag}'!g' Dockerfile.tmpl >dockerfiles/$${tag}/Dockerfile; \
	done; \
	sed -e 's!__TAG__!latest!g' Dockerfile.tmpl >Dockerfile;

