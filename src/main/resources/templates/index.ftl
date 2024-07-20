<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${title}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .hero {
            background: #f8f9fa;
            padding: 50px 0;
            text-align: center;
        }
        .feature {
            padding: 20px 0;
        }
        .testimonial {
            background: #e9ecef;
            padding: 50px 0;
        }
        .contact {
            padding: 50px 0;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">MyApp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#features">Features</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#testimonials">Testimonials</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#contact">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<div class="hero">
    <div class="container">
        <h1>Welcome to ${title}</h1>
        <p class="lead">A brief description of what your application does.</p>
        <a href="#features" class="btn btn-primary btn-lg">Learn More</a>
    </div>
</div>

<div id="features" class="feature">
    <div class="container">
        <h2>Features</h2>
        <div class="row">
            <#list features as feature>
                <div class="col-md-4">
                    <h3>${feature.title}</h3>
                    <p>${feature.description}</p>
                </div>
            </#list>
        </div>
    </div>
</div>

<div id="testimonials" class="testimonial">
    <div class="container">
        <h2>Testimonials</h2>
        <div id="testimonialCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <#list testimonials as testimonial>
                    <div class="carousel-item <#if testimonial?index == 0>active</#if>">
                        <div class="d-flex justify-content-center">
                            <div class="col-md-8">
                                <p class="lead">${testimonial.message}</p>
                                <p><strong>${testimonial.author}</strong></p>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
            <a class="carousel-control-prev" href="#testimonialCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#testimonialCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>

<div id="contact" class="contact">
    <div class="container">
        <h2>Contact Us</h2>

        <#if successMessage??>
            <div class="alert alert-success">${successMessage}</div>
        </#if>

        <form id="contactForm" method="post" action="/contact">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                <div class="invalid-feedback">Please enter your name.</div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" name="message" rows="5" placeholder="Enter your message"></textarea>
                <div class="invalid-feedback">Please enter your message.</div>
            </div>
            <button type="submit" class="btn btn-primary">Send Message</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.getElementById('contactForm').addEventListener('submit', function(event) {
        let isValid = true;

        const name = document.getElementById('name');
        if (!name.value) {
            name.classList.add('is-invalid');
            isValid = false;
        } else {
            name.classList.remove('is-invalid');
        }

        const email = document.getElementById('email');
        if (!email.value || !email.value.includes('@')) {
            email.classList.add('is-invalid');
            isValid = false;
        } else {
            email.classList.remove('is-invalid');
        }

        const message = document.getElementById('message');
        if (!message.value) {
            message.classList.add('is-invalid');
            isValid = false;
        } else {
            message.classList.remove('is-invalid');
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
</body>
</html>
