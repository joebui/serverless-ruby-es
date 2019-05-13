# Setup guide

1. Install Docker and Docker Compose
2. Open command line and cd to the project folder
3. Build image: `docker build -t sh-wipe-data .`
4. Start `docker-compose up -d`

# Test lambda function
1. `docker exec -it lambda bash`
2. `rake invoke['1 2 3']`

# Deploy function to AWS
1. Update your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in **docker-compose.yml**
2. `rake deploy`
3. Go to AWS Console and update necessary environment variables on the new function
- Note: to update a deployed function, type `rake update_function['hello']`
