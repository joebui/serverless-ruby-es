# Setup guide

- Install Docker and Docker Compose
- Open command line and cd to the project folder
- Build image: `docker build -t sh-wipe-data .`
- Start `docker-compose up -d`

# Test lambda function
- `docker exec -it lambda bash`
- `sls invoke local -f hello`

# Deploy function to AWS
- Update `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
- `rake deploy`
