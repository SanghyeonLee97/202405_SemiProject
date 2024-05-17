<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>
<link href="style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
   main{
      padding:0px; margin: 0px;
   }
   main>section>section>section{
      width: 100%; height: 160px;
      margin-top: 20px;
      background-color: #ddffff;
      position: relative;
   }
   main>section{
      position: relative;
   }

   main>section>section{
      width:50%;   
   }
   main>section>nav{
      width:100%; height:35px;
      background: skyblue;
   }
   #leftside{
      width:15%; height: 600px;
      background: green;
      position: absolute;
      left: 0; top: 100px;
      z-index: 1;
   }
   #rightside{
      width:15%; height: 600px;
      background: green;
      position: absolute;
      right: 0; top: 100px;
      z-index: 1;
   }
   main>section>section>section>article{
      width: 140px; height: 100px;
      background-color: #ddffdd;
      position: absolute;
   }
   main>section>section>section>article:nth-child(1){
      left: 220px;
   }
   main>section>section>section>article:nth-child(2){
      left: 420px;
   }
   main>section>section>section>article:nth-child(3){
      left: 620px;
   }
   main>section>section>section>article:nth-child(4){
      left: 820px;
   }
   
   footer{
   clear : both;
   }
</style>
</head>
<body>
   <hr>
   <header>header</header>
   <hr>
   <main>
      <section>
         <nav>nav</nav>
         <aside id="leftside">aside</aside>
         <section>
            <section>section
               <article>article</article>
               <article>article</article>
               <article>article</article>
               <article>article</article>
            </section>
            <section>section
               <article>article</article>
               <article>article</article>
               <article>article</article>
               <article>article</article>
            </section>
            <section>section
               <article>article</article>
               <article>article</article>
               <article>article</article>
               <article>article</article>
            </section>
            <section>section
               <article>article</article>
               <article>article</article>
               <article>article</article>
               <article>article</article>
            </section>   
         </section>
         <aside id="rightside">aside</aside>
      </section>
   </main>
   <footer>footer</footer>
</body>
</html>