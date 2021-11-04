<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css"/>
    <title>메인화면</title>
    <style>
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <nav class="py-0 bg-success border-bottom">
            <div class="container d-flex flex-wrap">
              <ul class="nav me-auto">
                <li class="nav-item"><a href="#" class="nav-link link-light px-2 active" aria-current="page">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">About</a></li>
              </ul>
              <ul class="nav">
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">Login</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-light px-2">Sign up</a></li>
              </ul>
            </div>
        </nav>
        
        <nav class="navbar navbar-expand-sm bg-light justify-content-center p-0">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link p-3" href="#">카테고리</a>
              </li>
            </ul>
          </nav>
    </div>
    
    <div class = "btn_container">
        <button type="button" id="call_my_btn" class="btn btn-dark" onclick="location.href = 'mypage/my'">마이페이지</button>
        <button type="button" class="btn btn-dark" onclick="location.href = 'otherpage/other'">타인페이지</button>
        <button type="button" class="btn btn-dark" onclick="location.href = 'safePurchase'">안전결제</button>
    </div>
    
    <div class="container">
      <footer class="row row-cols-5 py-5 my-5 border-top">
        <div class="col">
          <a href="/" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
          </a>
          <p class="text-muted">© 2021</p>
        </div>
    
        <div class="col">
    
        </div>
    
        <div class="col">
          <h5>Section</h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
          </ul>
        </div>
    
        <div class="col">
          <h5>Section</h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
          </ul>
        </div>
    
        <div class="col">
          <h5>Section</h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
          </ul>
        </div>
      </footer>
    </div>
    
</body>
</html>