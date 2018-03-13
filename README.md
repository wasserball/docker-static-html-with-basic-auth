# Host static HTML with Basic Auth (.htaccess / .htpasswd)

This docker-image can be used to host (for testing) static HTML-Files with Basic Auth 

### default values
username: `root`

password: `vjEdkvbaq9bauJuBmwNE`

## generate your own password
- use md5 Password `http://www.htpasswdgenerator.de/`
- replace result (example: `root:$1$qoTrIqHu$JNSTlAb2ujbqDumGaKTpL0`) within `.htpasswd`

## static files
 - put all your static content in `./build/` --> you need to have an `index.html` in the root directory
 - the `build` directory will be copied to dir `/usr/share/nginx/www`
 
## docker-compose

run  `docker-compose up` to test the password


or use the pre built version (`docker-compose-custom.yml`)

- environment var `HTPASSWD` can be used to set the password (the default password will be removed!!!)
- !!! you have to replace (escape) every `$` with `$$`

```
'root:$1$qoTrIqHu$JNSTlAb2ujbqDumGaKTpL0'
will be
'root:$$1$$qoTrIqHu$$JNSTlAb2ujbqDumGaKTpL0'
```

```
version: '3'
services:
  www:
    image: wasserball/docker-static-html-with-htaccess
    ports:
      - "80:80"
    environment:
      HTPASSWD: 'root:$1$qoTrIqHu$JNSTlAb2ujbqDumGaKTpL0'
    volumes:
      #- ".htpasswd:/etc/nginx/.htpasswd" # can be used to replace the PW if you are not using the environment var
      - "build:/usr/share/nginx/www"
```


run  `docker-compose -f docker-compose-custom.yml up`
