# Setup guide

1. Install Docker and Docker Compose
2. Open command line and cd to the project folder
3. Build image: `docker build -t sh-wipe-data .`
4. Start containers: `docker-compose up -d`

# Test lambda function
1. Use Postman or similar tool and make request `DELETE http://localhost:3000/wipe_log`
2. Pass the **body** with the following JSON object

```json
{
  "user_ids": [array of user ids]
}
```

# Deploy to AWS
1. Set your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables accordingly.
2. `rake deploy`
3. Go to AWS Console and update necessary environment variables on the new function
- Note: to update code of deployed function, type `rake update_function['wipe_log']`
