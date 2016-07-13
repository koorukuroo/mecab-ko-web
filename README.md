# mecab-ko-web
Mecab-ko( https://github.com/koorukuroo/mecab-ko )와 Flask를 이용한 형태소 분석입니다.

## Docker Installation
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
도커 정보
https://registry.hub.docker.com/u/koorukuroo/mecab-ko-web
### 기본적인 Docker 명령어
- 컨테이너 목록 출력
 - docker ps -a
- 실행된 컨테이너 목록 출력
 - docker ps
- 컨테이너 종료
 - docker kill <CONTAINER ID>
- 이미지 목록 출력
 - docker images
- 이미지 삭제
 - docker rmi koorukuroo/mecab-ko-web
- 컨테이너 접속
 - docker attach <CONTAINER ID>
 
- Dockerfile 빌드
 - docker build -t koorukuroo/mecab-ko-web .
- 빌드된 Dockerfile 백그라운드에서 실행
 - docker run -d -t koorukuroo/mecab-ko-web
- 빌드된 Dockerfile 인터렉티브 모드에서 실행
 - docker run -i -t koorukuroo/mecab-ko-web
- 빌드된 Dockerfile bash로 진입
 - docker run -i -t koorukuroo/mecab-ko-web /bin/bash
