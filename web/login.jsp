<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome for icons -->
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
    <style>
      body {
        background: #f4f4f4;
        font-family: 'Poppins', sans-serif;
      }
      .login-container {
        margin-top: 10%;
        margin-bottom: 5%;
      }
      .login-card {
        padding: 3rem;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease-in-out;
      }
      .login-card:hover {
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
      }
      .login-card h3 {
        text-align: center;
        margin-bottom: 2rem;
        color: #0062cc;
        font-weight: 600;
      }
      .input-group-text {
        background: transparent;
        border: none;
      }
      .form-control:focus {
        box-shadow: none;
        border-color: #0062cc;
      }
      .form-control {
        border-radius: 5px;
        height: 45px;
      }
      .btn-login {
        background-color: #0062cc;
        border: none;
        color: #fff;
        padding: 0.75rem;
        border-radius: 5px;
        font-weight: 600;
        transition: all 0.3s ease;
      }
      .btn-login:hover {
        background-color: #004a9c;
        transform: translateY(-2px);
      }
      .forgot-password {
        font-size: 0.9rem;
        color: #0062cc;
        text-decoration: none;
      }
      .forgot-password:hover {
        text-decoration: underline;
      }
      .text-center a {
        color: #0062cc;
      }
      .text-center a:hover {
        color: #004a9c;
        text-decoration: underline;
      }
      .login-card i {
        font-size: 1.5rem;
        color: #0062cc;
      }
      .text-danger {
        font-size: 1rem;
      }
      @media (max-width: 576px) {
        .login-card {
          padding: 2rem;
        }
      }
    </style>
  </head>
  <body>
    <div class="container login-container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="login-card">
            <h3><i class="fa-solid fa-car-side"></i> Mega City Cab Login</h3>
            <form action="login" method="post">
              <div class="mb-3 input-group">
                <span class="input-group-text">
                  <i class="fa-solid fa-user"></i>
                </span>
                <input
                  type="text"
                  name="username"
                  id="username"
                  class="form-control"
                  placeholder="Username"
                  required autofocus
                />
              </div>
              <div class="mb-3 input-group">
                <span class="input-group-text">
                  <i class="fa-solid fa-lock"></i>
                </span>
                <input
                  type="password"
                  name="password"
                  id="password"
                  class="form-control"
                  placeholder="Password"
                  required
                />
              </div>
              <div class="d-grid">
                <input type="submit" value="Login" class="btn btn-login" />
              </div>
            </form>
            <div class="mt-3 text-center">
              <a href="registration.jsp" class="text-decoration-none">
                <i class="fa-solid fa-user-plus"></i> Register
              </a>
            </div>
            <div class="mt-2 text-center">
              <p class="text-danger">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
