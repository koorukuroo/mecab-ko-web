# mecab-ko-web
Mecab-ko( https://github.com/koorukuroo/mecab-ko )와 Flask를 이용한 형태소 분석입니다.

## Docker Installation
https://docs.docker.com/
- Windows : https://download.docker.com/win/beta/InstallDocker.msi
- Mac : https://download.docker.com/mac/beta/Docker.dmg

### Mac
1. brew cask install virtualbox --appdir=/Applications
2. docker-machine create --driver virtualbox default
3. docker-machine env default
4. docker-machine ip default
5. sudo route add 172.17.0.0/16 192.168.99.100
6. docker-machine ssh default
7. docker pull koorukuroo/mecab-ko-web
8. docker run -d koorukuroo/mecab-ko-web
9. exit
10. curl 172.17.0.2:5000/?text=테스트

##### References
- https://gist.github.com/makuk66/8380c901a9a620df7023
- https://forums.docker.com/t/access-host-not-vm-from-inside-container/11747/30
- https://github.com/docker/docker/issues/19119
- https://docs.docker.com/docker-for-mac/networking/#/i-can-t-ping-my-containers


# Usage
## Docker 실행
```
$ sudo docker pull koorukuroo/mecab-ko-web
$ sudo docker run -i -t koorukuroo/mecab-ko-web
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
- 컨테이너 삭제
 - docker rm <CONTAINER ID>
- 존재하는 컨테이너 전체 삭제
 - docker rm $(docker ps -a -q)
- 이미지 삭제
 - docker rmi koorukuroo/mecab-ko-web
- 존재하는 이미지 전체 삭제
 - docker rmi $(docker images -q)
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
- 네트워크 환경 체크
 - docker network inspect bridge
