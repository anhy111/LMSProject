<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=card1o:400i|Rubik:400,700&display=swap");
:root {
  --d: 700ms;
  --e: cubic-bezier(0.19, 1, 0.22, 1);
  --font-sans: "Rubik", sans-serif;
  --font-serif: "card1o", serif;
}

* {
  box-sizing: border-box;
}

.page-content1 {
  display: grid;
  grid-gap: 1rem;
  padding: 1rem;
  max-width: 1024px;
  margin: 0 auto;
  font-family: var(--font-sans);
}

@media (min-width: 900px) {
  .page-content1 {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 1000px) {
  .page-content1 {
    grid-template-columns: repeat(4, 1fr);
  }
}
.card1 {
  position: relative;
  display: flex;
  align-items: flex-end;
  overflow: hidden;
  padding: 1rem;
  width: 100%;
  text-align: center;
  color: black;
  background-color: whitesmoke;
}

@media (min-width: 600px) {
  .card1 {
    height: 350px;
  }
}
.card1:before {
  content1: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 110%;
  background-size: cover;
  background-position: 0 0;
  transition: transform calc(var(--d) * 1.5) var(--e);
  pointer-events: none;
}

.card1:after {
  content1: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 200%;
  pointer-events: none;
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.009) 11.7%, rgba(0, 0, 0, 0.034) 22.1%, rgba(0, 0, 0, 0.072) 31.2%, rgba(0, 0, 0, 0.123) 39.4%, rgba(0, 0, 0, 0.182) 46.6%, rgba(0, 0, 0, 0.249) 53.1%, rgba(0, 0, 0, 0.32) 58.9%, rgba(0, 0, 0, 0.394) 64.3%, rgba(0, 0, 0, 0.468) 69.3%, rgba(0, 0, 0, 0.54) 74.1%, rgba(0, 0, 0, 0.607) 78.8%, rgba(0, 0, 0, 0.668) 83.6%, rgba(0, 0, 0, 0.721) 88.7%, rgba(0, 0, 0, 0.762) 94.1%, rgba(0, 0, 0, 0.79) 100%);
  transform: translateY(-50%);
  transition: transform calc(var(--d) * 2) var(--e);
}

.card1:nth-child(1):before {
  background-image: url(https://images.unsplash.com/photo-1517021897933-0e0319cfbc28?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE0NTg5fQ);
}

.card1:nth-child(2):before {
  background-image: url(https://images.unsplash.com/photo-1533903345306-15d1c30952de?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE0NTg5fQ);
}

.card1:nth-child(3):before {
  background-image: url(https://images.unsplash.com/photo-1545243424-0ce743321e11?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE0NTg5fQ);
}

.card1:nth-child(4):before {
  background-image: url(https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE0NTg5fQ);
}

.content1 { 
  position: relative; 
  display: flex; 
  flex-direction: column; 
  align-items: center; 
  width: 100%; 
  padding: 0; 
  transition: transform var(--d) var(--e); 
  z-index: 1; 
} 

.content1 > * + * { 
  margin-top: 1rem; 
} 

.title1 {
  font-size: 1.3rem;
  font-weight: bold;
  line-height: 1.2;
}

.copy {
  font-family: var(--font-serif);
  font-size: 1.125rem;
  font-style: italic;
  line-height: 1.35;
}

.copy2 {
  font-family: var(--font-serif);
  font-size: 1.125rem;
  font-style: italic;
  line-height: 1.35;
}

.btn1 {
  cursor: pointer;
  margin-top: 1.5rem;
  padding: 0.75rem 1.5rem;
  font-size: 0.65rem;
  font-weight: bold;
  letter-spacing: 0.025rem;
  text-transform: uppercase;
  color: white;
  background-color: black;
  border: none;
}

.btn1:hover {
  background-color: #0d0d0d;
}

.btn1:focus {
  outline: 1px dashed yellow;
  outline-offset: 3px;
}

@media (hover: hover) and (min-width: 600px) {
  .card1:after {
    transform: translateY(0);
  }

  .content1 {
    transform: translateY(calc(100% - 4.5rem));
  }

  .content1 > *:not(.title1) {
    opacity: 0;
    transform: translateY(1rem);
    transition: transform var(--d) var(--e), opacity var(--d) var(--e);
  }

  .card1:hover,
.card1:focus-within {
    align-items: center;
  }

  .card1:hover:before,
.card1:focus-within:before {
    transform: translateY(-4%);
  }

  .card1:hover:after,
.card1:focus-within:after {
    transform: translateY(-50%);
  }

  .card1:hover .content1,
.card1:focus-within .content1 {
    transform: translateY(0);
  }

  .card1:hover .content1 > *:not(.title1),
.card1:focus-within .content1 > *:not(.title1) {
    opacity: 1;
    transform: translateY(0);
    transition-delay: calc(var(--d) / 8);
  }

  .card1:focus-within:before, .card1:focus-within:after,
.card1:focus-within .content1,
.card1:focus-within .content1 > *:not(.title1) {
    transition-duration: 0s;
  }
}

</style>

<main class="page-content1">
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
  <div class="card1">
    <div class="content1">
      <h2 class="title1">Mountain View</h2>
      <p class="copy">줄바꾸기</p>
      <p class="copy2">줄바꾸기</p>
      <button class="btn1">View Trips</button>
    </div>
  </div>
</main>
