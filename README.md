# Pound

A Docker image for Pound, the SSL proxy and load-balancer.

## Starting the container
```
docker pull pascaldevink/pound:latest
docker run -d --name pound -p 8080:8080 pascaldevink/pound:latest
```

## Linking to your application
```
docker run --name some-name --link some-pound:pound -d application-that-uses-pound
```
