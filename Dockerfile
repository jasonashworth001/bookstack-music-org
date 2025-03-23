version: "3.3"

services:
  bookstack:
    image: lscr.io/linuxserver/bookstack:latest
    container_name: bookstack
    environment:
      - PUID=1000
      - PGID=1000
      - APP_URL=https://wikichi.org
      - DB_HOST=bookstack_db
      - DB_USER=bookstack
      - DB_PASS=pbY6HGwHje!H_AgCzgWv
      - DB_DATABASE=bookstackapp
    volumes:
      - ./bookstack/config:/config
    ports:
      - 80:80
    depends_on:
      - bookstack_db

  bookstack_db:
    image: mysql:5.7
    container_name: bookstack_db
    environment:
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_DATABASE=bookstackapp
      - MYSQL_USER=bookstack
      - MYSQL_PASSWORD=pbY6HGwHje!H_AgCzgWv
    volumes:
      - ./bookstack/db:/var/lib/mysql
