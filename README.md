# Docker for magento

## Information
TBD

## Create new Magento 2 project (__https://test-project.local/__):

* For simplisity we will use same names for project folder: `projects/test-project`, nginx config file: `test-project.local.conf` project url: `https://test-project.local/`.
* Clone you project's repo into `projects/` folder, for example your project files stored here `projects/test-project`.
* Copy nginx config from `builds/nginx/default-configs/` folder or add your own magento 2 nginx config:
```
cp builds/nginx/default-configs/magento2.local.conf builds/nginx/projects-configs/test-project.local.conf
```
* In your nginx conf `builds/nginx/projects-configs/test-project.local.conf` change change following lines:
```nginx
#...
  ssl_certificate /certs/test-project.local/cert.pem; 
  ssl_certificate_key /certs/test-project.local/key.pem;

  server_name test-project.local;
  set $MAGE_ROOT /var/www/test-project.local;
```
They all should have `test-project.local` (your project name).
* Add volumes to nginx and php service into `docker-compose.yml` file:
```docker
nginx:
#...
    volumes:
      - ./projects/test-project/:/var/www/test-project.local/
php_7_4:
#...
    volumes:
      - ./projects/test-project/:/var/www/test-project.local/
```
* Restore db dump into mysql container, or install fresh magento.


