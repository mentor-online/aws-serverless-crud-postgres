.PHONY: build clean deploy

build: 
	cd postInsert && env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ../bin/postInsert/bootstrap ./postInsert.go && cd ..
	cd postUpdate && env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ../bin/postUpdate/bootstrap ./postUpdate.go && cd ..
	cd postDelete && env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ../bin/postDelete/bootstrap ./postDelete.go && cd ..
	cd postGetUsers && env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ../bin/postGetUsers/bootstrap ./postGetUsers.go && cd ..


zip:
	zip -j bin/postInsert.zip bin/postInsert/bootstrap
	zip -j bin/postUpdate.zip bin/postUpdate/bootstrap
	zip -j bin/postDelete.zip bin/postDelete/bootstrap
	zip -j bin/postGetUsers.zip bin/postGetUsers/bootstrap

	
clean:
	rm -rf ./bin ./vendor Gopkg.lock
 
deploy: clean build zip 
	sls deploy --verbose
