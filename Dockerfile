FROM ubuntu:16.04
LABEL maintainer Kyunghoon <kyunghoon@unist.ac.kr>

# Mirror Change to daumkakao
RUN cp /etc/apt/sources.list /etc/apt/sources.list.org
RUN sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' < /etc/apt/sources.list.org > /etc/apt/sources.list

# Essentials
RUN apt-get update
RUN apt-get install -y wget build-essential autotools-dev automake libmecab2 libmecab-dev git
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip

# Mecab
RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz | tar zxfv -
RUN cd mecab-0.996-ko-0.9.2; ./configure; make; make install; ldconfig

# Mecab-Ko-Dic
# RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150920.tar.gz | tar zxfv -
# RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.3-20170922.tar.gz | tar zxfv -
RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.0-20180716.tar.gz | tar zxfv -
RUN cd mecab-ko-dic-2.1.0-20180716; sh ./autogen.sh
RUN cd mecab-ko-dic-2.1.0-20180716; ./configure; make; make install; ldconfig

# Mecab-Python
RUN git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git
RUN cd mecab-python-0.996; python setup.py build; python setup.py install

# Pip Installation
RUN pip install flask

# Cleaning
RUN apt-get remove -y build-essential
RUN rm -rf mecab-*

# Flask
RUN git clone https://gist.github.com/29e4c9e852d21d000193.git
RUN mv 29e4c9e852d21d000193/web.py .
RUN rm -rf 29e4c9e852d21d000193

# Execution
EXPOSE 5000
CMD ifconfig | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'; python web.py
