<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Http</title>
  <link rel="stylesheet" href="app.css" />
  <script src="app.js" defer></script>
</head>
<body>
<template id="single-post">
  <li class="post-item">
    <h2></h2>
    <p></p>
    <button>DELETE</button>
  </li>
</template>
<section id="new-post">
  <form>
    <div class="form-control">
      <label for="title">Title</label>
      <input type="text" id="title" />
    </div>
    <div class="form-control">
      <label for="content">Content</label>
      <textarea rows="3" id="content"></textarea>
    </div>
    <button type="submit">ADD</button>
  </form>
</section>
<section id="available-posts">
  <button>FETCH POSTS</button>
  <ul class="posts"></ul>
</section>
</body>
</html>
