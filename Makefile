.PHONY: help
help: ## 帮助文件
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: FORCE
FORCE:

IMAGE_DIR=src/facechain
NAMESPACE=aliyun-fc
REPO=fc-facechain
VERSION=v2
OSS_PREFIX=facechain/${VERSION}
CACHE_DIR=nas/facechain
FILE_LIST=dist/files.list

.PHONY: build
build: ${IMAGE_DIR}/Dockerfile ${IMAGE_DIR}/entrypoint.sh ## 构建镜像
	DOCKER_BUILDKIT=1 docker build -f ${IMAGE_DIR}/Dockerfile -t ${REPO}:${VERSION} ./${IMAGE_DIR}

.PHONY: push-hangzhou
push-hangzhou:  ## push 镜像到上海
	docker tag ${REPO}:${VERSION} registry.cn-hangzhou.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION} && \
	docker push registry.cn-hangzhou.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION}

.PHONY: push-shanghai
push-shanghai:  ## push 镜像到上海
	docker tag ${REPO}:${VERSION} registry.cn-shanghai.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION} && \
	docker push registry.cn-shanghai.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION}

.PHONY: push-sg
push-sg:  ## push 镜像到上海
	docker tag ${REPO}:${VERSION} registry-vpc.ap-southeast-1.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION} && \
	docker push registry-vpc.ap-southeast-1.aliyuncs.com/${NAMESPACE}/${REPO}:${VERSION}

.PHONY: push
push: push-shanghai push-hangzhou ## 推送到所有需要的地域

.PHONY: dev
dev: build  ## 本地启动测试
	docker run --rm -it --name=${REPO} --net=host --gpus=all -v ${shell pwd}/nas:/mnt/auto ${REPO}:${VERSION}

.PHONY: exec
exec: ## 登入容器实例
	docker exec -it ${REPO} /bin/bash

dist/facechain.zip: FORCE
	cd nas && \
	zip -r ../dist/facechain.zip facechain/ -x facechain/worker_data/

.PHONY: zip
zip: facechain.zip ## 打包 zip

.PHONY: push-zip
push-zip: ## 推送 zip
	@$(shell cat .env) node ./scripts/upload.js "dist/facechain.zip" "facechain.zip"


push-oss: ## 推送 oss 文件
	export $(shell cat .env) && \
	find ${CACHE_DIR} -type f | grep -E 'facechain/root|facechain/workspace' | grep -vE 'root/\.[^/]+$$' | sed 's@${CACHE_DIR}/@@g' > ${FILE_LIST} && \
	cat ${FILE_LIST}  | xargs -I {} -P32 node ./scripts/upload.js "${CACHE_DIR}/{}" "${OSS_PREFIX}/{}" && \
	node ./scripts/upload.js "${FILE_LIST}" "${OSS_PREFIX}/$(shell basename ${FILE_LIST})" && \
	echo done

test-deploy: ## 直接执行 s deploy
	@cd src && \
	cat s.yaml | sed 's/{{[^}]*}}//g' > s-pre.yaml && \
	s deploy -t s-pre.yaml --skip-push --use-local && \
	rm s-pre.yaml