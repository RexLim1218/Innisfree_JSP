<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../../assets/images/favicon/3.png" type="image/x-icon">
    <title>Innisfree | Make You Better</title>

    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

    <style>
    body {
        background-position: center;
        background-color: #eee;
        background-repeat: no-repeat;
        background-size: cover;
        color: #505050;
        font-family: "Rubik", Helvetica, Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.5;
        text-transform: none
    }

    .forgot {
        background-color: #fff;
        padding: 12px
    }

    .padding-bottom-3x {
        padding-bottom: 72px !important
    }

    .card-footer {
        background-color: #fff;
    }

    .btn {
        font-size: 13px;
    }

    .form-control:focus {
        color: #495057;
        background-color: #fff;
        border-color: #76b7e9;
        outline: 0;
        box-shadow: 0 0 0 0px #28a745;
    }
    </style>
</head>

<body oncontextmenu='return false' class="snippet-body theme-color-1">
    
    <!-- header start -->
    <%@include file="cust.Header_Log.jsp" %>
    <!-- header end -->
    
    
    <!-- breadcrumb start -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-title">
                        <h2>forget password</h2>
                    </div>
                </div>
                <div class="col-sm-6">
                    <nav aria-label="breadcrumb" class="theme-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="homepage/homepage.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="login.jsp">login</a></li>
                            <li class="breadcrumb-item active" aria-current="page">forget password</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->
    
    
    <section class="pwd-page section-b-space">
        <div class="container padding-bottom-3x mb-2">
            <div class="row justify-content-center">
                <div class="forgot col-lg-6 m-auto">
                    <h2>Forgot your password?</h2>
                    <p>Change your password in three easy steps. This will help you to secure your password!</p>
                    <div style="display: inline-block; text-align: left;">
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1.&nbsp;&nbsp;</span>Enter your email address below.</li><br>
                            <li><span class="text-primary text-medium">2.&nbsp;&nbsp;</span>Our system will send you an OTP to your email.</li><br>
                            <li><span class="text-primary text-medium">3.&nbsp;&nbsp;</span>Enter the OTP on the next page.</li>
                        </ol>
                    </div>
                </div>
                <form class="card mt-4 theme-form col-lg-8" style="border: 1px solid grey;" action="${pageContext.servletContext.contextPath}/forgotPassword" method="POST">
                    <div class="card-body form-row row">
                        <div class="form-group">
                            <h5><label for="email-for-pass">Enter your email address:</label></h5>
                            <input type="text" class="form-control" name="email" id="email-for-pass" required="" placeholder="my@email.com">
                            <small class="form-text text-muted">Enter the registered email address. Then we'll email an OTP to this address.</small>
                        </div>
                    </div>
                    <div class="card-footer" style="padding: 15px;">
                        <button class="btn btn-success" type="submit" style="border-radius: 5px;">Get New Password</button>&emsp;
                        <button class="btn btn-danger" type="button" style="border-radius: 5px;" onclick="window.location.replace('login.jsp')">Back to Login</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- footer start -->
    <%@include file="cust.Footer.jsp" %>
    <!-- footer end -->
    
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
    <script type='text/javascript' src=''></script>
    <script type='text/javascript' src=''></script>
    <script type='text/Javascript'></script>
</body>
</html>