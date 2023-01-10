# Learning Management System

![ddit 메인 화면 캡처](https://user-images.githubusercontent.com/107231837/211437489-77a27e9b-5d76-42b3-8ed6-735ac298f45c.PNG)

## 💼Summary

![106693916-d2fe5c00-661a-11eb-98d5-961bd62bafca](https://user-images.githubusercontent.com/107231837/211445227-5f496deb-2119-4e2a-8aad-6ac310c52cbf.png)


## 🌟Features
Register user using nickname, email, password, image. Login / Logout using cookie. Edit User for nickname or image.

* User
  * Register & Edit
    * nickname, email, image
  * Login & Logout
    * cookie & session & passport
User Information & Follow list on Profile.

* Profile
  * User Information
  * Followers & Followings List

Add, Remove, Edit a tweet(post). User can retweet others' post. User can add Hashtag on a post. Visitor can add a Comment, Like on a post.

* Post
  * Add & Remove & Edit a post
  * Retweet
  * Comment
  * Like
  * Hashtag
    * regex, "/(#[^\s#]+)/g"

Images are stored at AWS S3. Resizing using Lambda.

* Image
  * aws s3
  * lambda for resizing

## 🔧Tech Stack

* Java
* Javascript
* Spring
* Spring-Session
* Spring-Security
* Spring-Jpa
* Tomcat
* Mybatis
* OracleDatabase

## 🗃️Database
![105812886-4e945380-5ff2-11eb-9f55-8d95b7dbbd15](https://user-images.githubusercontent.com/107231837/211446844-29e7f6f2-06f3-460f-8e56-0ba950878c31.png)

## 📚Spring
![108622394-dd727f80-747b-11eb-913c-fea473baa019](https://user-images.githubusercontent.com/107231837/211446695-018fa89e-00ab-444b-af8a-d8aa57f8b354.png)
## 🗓️Future Works

## 🏫Research

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
