[![Build Status](https://travis-ci.org/adaRn/microlibrary.svg?branch=master)](https://travis-ci.org/adaRn/microlibrary)

# μlibrary
It is a simple Rails app to manage books, perhaps in a small firm's library.

Running sample: http://microlibrary-rails.herokuapp.com/

## Running from Docker
```
git clone https://github.com/adaRn/microlibrary.git
cd microlibrary
docker build -t mlibrary .
docker run -v `pwd`:/usr/src/app -p 3000:3000 --name ml
```
