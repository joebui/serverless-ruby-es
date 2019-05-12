# Setup guide

- Install Docker and Docker Compose
- Open command line and cd to the project folder
- Build image: `docker build -t sh-wipe-data .`
- Start `docker-compose up -d`

# Test lambda function
- `docker exec -it lambda bash`
- `sls invoke local -f hello`

# Deploy function to AWS
- Update your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in *docker-compose.yml*
- `rake deploy`
- Go to AWS Console and update necessary environment variables on the new function
