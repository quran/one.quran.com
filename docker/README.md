# Docker Configuration for OneQuran

These are some instructions for building the OneQuran Docker images.

## Build Instructions

1. build the image `docker build -t quran/one.quran.com .`
2. run the image linked to `postgres:9.4`
3. if the database doesn't exist, run `RAILS_ENV=production rake db:create`
4. run `RAILS_ENV=production rake db:migrate` the first time, and whenever the database changes

## Sample `docker-compose.yml`:

```yaml
service:
  image: quran/one.quran.com
  ports:
  - "5000:3000"
  links:
  - postgres:postgres
  volumes:
  - "/path/to/nginx/logs:/var/log/nginx"
postgres:
  image: postgres:9.4
  environment:
  - POSTGRES_PASSWORD=replace_with_your_password
  volumes:
  - "/path/to/database:/var/lib/postgresql/data"
```
