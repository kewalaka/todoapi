# build project - using --force-rm doesn't remove the intermediate container
docker build . -t todoapi

# remove the intermediate build container
docker image prune -f

# run:
#    docker run --rm -it -p 8000:80
# & navigate to http://localhost:8000

# tidy up all images & stopped containers
# docker system prune