# mecab-ko-web
Mecab-ko( https://github.com/koorukuroo/mecab-ko )와 Flask를 이용한 형태소 분석입니다.

# Docker
##Installation
https://docs.docker.com/
- Windows : https://download.docker.com/win/beta/InstallDocker.msi
- Mac : https://download.docker.com/mac/beta/Docker.dmg

# Usage
## Docker 실행
```
$ sudo docker pull koorukuroo/mecab-ko-web:0.1
$ sudo docker run -i -t koorukuroo/mecab-ko-web:0.1
172.17.0.43 (Docker Container IP)
127.0.0.1
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```
## Python
```
>>> import urllib2
>>> response = urllib2.urlopen('http://172.17.0.43:5000/?text=안녕')
>>> text = response.read()
>>> print text
안녕	NNG,*,T,안녕,*,*,*,*
EOS
```

# Docker
https://registry.hub.docker.com/u/koorukuroo/mecab-ko-web
