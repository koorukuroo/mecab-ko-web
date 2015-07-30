FROM ubuntu:14.04
MAINTAINER Kyunghoon <kyunghoon@unist.ac.kr>

# Essentials
RUN apt-get update
RUN apt-get install -y wget build-essential autotools-dev automake libmecab2 libmecab-dev git
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip 

# Mecab
RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz | tar zxfv -
RUN cd mecab-0.996-ko-0.9.2; ./configure; make; make install; ldconfig

# Mecab-Ko-Dic
RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150707.tar.gz | tar zxfv -
RUN cd mecab-ko-dic-2.0.1-20150707; sh ./autogen.sh
RUN cd mecab-ko-dic-2.0.1-20150707; ./configure; make; make install; ldconfig

# Mecab-Python
RUN git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git
RUN cd mecab-python-0.996; python setup.py build; python setup.py install

# Pip Installation
RUN pip install flask

# Cleaning
RUN apt-get remove -y build-essential
RUN rm -rf mecab-*

#CMD ["mecab"]
#CMD ["python"]
#CMD ["
RUN git clone https://gist.github.com/29e4c9e852d21d000193.git
RUN mv 29e4c9e852d21d000193/web.py .
RUN rm -rf 29e4c9e852d21d000193
EXPOSE 5000
CMD ifconfig | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'; python web.py

