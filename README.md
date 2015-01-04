# Pound

A Docker image for Pound, the SSL proxy and load-balancer.

## Starting the container
```
docker pull pascaldevink/pound:latest
docker run -d --name pound -p 8080:8080 pascaldevink/pound:latest
```

## Configuration for SSL
By default, pound uses a default backend on localhost, but since there isn't one, we have to setup the pound configuration.
Also, by default it's setup as a load-balancer with just 1 backend and doesn't use SSL.

With the following pound.cfg:

```
User "www-data"
Group "www-data"
LogLevel        1
Alive           30
Control "/var/run/pound/poundctl.socket"

ListenHTTPS
  Address 0.0.0.0
  Port    443
  Cert    "/var/lib/pound/certificate.pem"
  AddHeader "X-Forwarded-Proto: https"
  xHTTP   1
End

Service
  BackEnd
    Address web
    Port    80
    TimeOut 60
  End
End
```

And a linked container named web (can be anything that provides HTTP, such as nginx or apache) and assuming you have a .pem file on hand, you can run pound with:

```
docker run -d -v /myapp/pound/pound.cfg:/etc/pound.cfg -v /myapp/pound/certificate.pem:/var/lib/pound/certificate.pem --link web:web --name pound -p 443:443 pascaldevink/pound:latest
```
