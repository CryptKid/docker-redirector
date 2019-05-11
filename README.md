# docker-redirector
A simple NGINX that redirects all traffic to a given URL.
It is meant to be run behind a reverse proxy and redirect old/unused (Sub-)Domains.

## Config
Configuration is kept extremly simple, all you need to do is adding up to three environmental vars in your docker-command, docker-compose-file or how ever you want to start it.

| Var         | Meaning                                                                                           | Example                                             |
| ----------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| dest        | The url all traffic should go to, write only the base domain (https://a.bc.de) if you use keep\_uri | dest=https://github.com/cryptkid/docker-redirector" |
| access\_log | The file to write an access-log to. Default: off"                                                   | access\_log=/var/log/access.log                     |
| keep\_uri   | Keep request uri, redirect from a.example.com/bla to b.example.com/bla and not to b.example.com   | keep\_uri=true                                      |

## Examples

### Docker command

Redirect all queries to this repo:

```
docker run -e dest='https://github.com/cryptkid/docker-redirector' -e access_log='off' -e keep_uri='false' -it cryptkiddie2/redirector:latest
```

Redirect to  b.example.com keeping the requested uri
(a.example.com/bla -> b.example.com/bla)

```
docker run -e dest='https://b.example.com' -e access_log='off' -e keep_uri='true' -it cryptkiddie2/redirector:latest
``` 

### docker-compose

There is an [an example docker-compose.yml](https://github.com/CryptKid/docker-redirector/blob/master/examples/docker-compose.yml)

## ToDo and known issues

- Allow multiple redirects for different sources in one container

- https not supported (does not matter in my case because I run it behind [traefik](https://traefik.io/)

If there was anybody out there wanting to help, he/she/it could work on this and open a PR
