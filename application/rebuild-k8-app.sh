#
# this will build the docker contianer image
# the container will be pushed to ejbest docker hub as public
docker build . -t ejbest/nodetest 
docker push ejbest/nodetest 


