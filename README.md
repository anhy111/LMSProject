# Learning Management System

![ddit 메인 화면 캡처](https://user-images.githubusercontent.com/107231837/211437489-77a27e9b-5d76-42b3-8ed6-735ac298f45c.PNG)

## Summary

## Features

Images are stored at AWS S3. Resizing using Lambda.

* Image
  * aws s3
  * lambda for resizing

## Tech Stack

* Java
* Javascript
* Spring
* Spring-Session
* Spring-Security
* Spring-Jpa
* Tomcat
* Mybatis

## Database

## Spring

## Future Works

## Research

### aws-ec2
<details>
<summary>세부 사항</summary>
<div markdown="1">

#### basic setup for ubuntu
<pre>
<code>
$ sudo apt-get update
$ sudo apt-get install -y build-essential
</code>
</pre>
#### npm install for ubuntu
<pre>
<code>
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash --
$ sudo apt-get install -y nodejs
</code>
</pre>

#### mysql install for ubuntu
<pre>
<code>
$ sudo apt-get install -y mysql-server
$ sudo su
$ mysql_secure_installation
$ mysql -u root -p
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
$ vim .env
$ npx sequelize db:create
</code>
</pre>

</div>
</details>
