IMAGE_NAME=tumi4/python-3.9-bullseye-poetry

CI_COMMIT_SHA=$(git rev-parse HEAD)
CI_COMMIT_BRANCH=$(git symbolic-ref --short HEAD)
CI_COMMIT_SHORT_SHA=$(git rev-parse --short HEAD)

docker build \
--build-arg=COMMIT=$CI_COMMIT_SHA  \
--build-arg=BRANCH=$CI_COMMIT_BRANCH \
--build-arg=COMMIT_SHORT=$CI_COMMIT_SHORT_SHA \
--build-arg=TAG=$CI_COMMIT_TAG \
--tag $IMAGE_NAME:$CI_COMMIT_SHA \
--tag $IMAGE_NAME:latest \
--tag $IMAGE_NAME:$CI_COMMIT_SHORT_SHA \
--tag $IMAGE_NAME:$CI_COMMIT_BRANCH \
.
