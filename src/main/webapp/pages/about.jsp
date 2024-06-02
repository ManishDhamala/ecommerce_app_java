<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>

<head>

    <link rel="stylesheet"  href="../styles/global.css">
    <link rel="stylesheet"  href="../styles/css/header.styles.css">
    <link rel="stylesheet"  href="../styles/css/carousel.styles.css">

    <title>About Us</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Global Styles */

    body {
        font-family: Arial, sans-serif;
    }

    /* Header */








    .nav-links li {
        margin-right: 20px;
    }

    .nav-links a {
        color: rgb(0, 0, 0);
        padding: 10px;
        font-weight: bold;
        text-decoration: none;
    }

    .nav-links a:hover {
        background-color: #ffa846;
        border-radius: 4px;
        color: white;
    }

    /* About Section */

    .about {
        background: #ffffff;

        /*
                background: linear-gradient(360deg, rgb(245, 255, 245) 0%, #ffa846 100%);*/
        /* padding: 100px 0 20px 0;*/
        text-align: center;

    }

    .about h1 {
        font-size: 4rem;
        margin-bottom: 20px;
        color:#ffffff;
    }

    .about p {
        font-size: 1rem;
        color: #323030;
        max-width: 1000px;
        margin: 0 auto;
    }

    .about-info {
        margin: 2rem 2rem;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: left;
    }

    .about-img {
        width: 20rem;
        height: 20rem;

    }

    .about-img img {
        width: 120%;
        height: 120%;
        border-radius: 5px;
        object-fit: cover;
        padding-right: 50px;
        padding-bottom: 20px;
    }

    .about-info p {
        font-size: 1.3rem;
        margin: 0 2rem;
        text-align: justify;
    }

    button {
        border: none;
        outline: 0;
        padding: 10px;
        margin: 2rem;
        font-size: 1rem;
        color: white;
        background-color: #ffa846;;
        text-align: center;
        cursor: pointer;
        width: 15rem;
        border-radius: 4px;
    }

    button:hover {
        background-color: #ffa846;;
    }

    /* Team Section */

    .team {
        padding: 30px 0;
        text-align: center;
    }

    .team h1 {
        font-size: 2.5rem;
        margin-bottom: 20px;
    }

    .team-cards {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 15px;
        margin-top: 20px;
    }

    .card {
        background-color: white;
        border-radius: 6px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
        overflow: hidden;
        transition: transform 0.2s, box-shadow 0.2s;
        width: 18rem;
        height: 25rem;
        margin-top: 10px;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 5px rgba(0, 0, 0, 0.5);
    }

    .card-img {
        width: 18rem;
        height: 12rem;
    }

    .card-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .card-info .button {
        background-color: #ffa846;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .card-info .button:hover {
        background-color: #ff8c00;
    }

    .card-name {
        font-size: 1.5rem;
        margin: 10px 0;
    }

    .card-role {
        font-size: 1rem;
        color: #888;
        margin: 5px 0;
    }

    .card-email {
        font-size: 1rem;
        color: #555;
    }

    /* Footer */
    footer {
        background-color: #222;
        color: white;
        text-align: center;
        padding: 20px 0;
    }

    @media (max-width: 768px) {
        nav {
            display: block;
        }



        .nav-links li {
            margin-right: 0;
        }

        .about h1 {
            font-size: 2rem;
        }

        .about p {
            font-size: 0.9rem;
        }

        .about-info {
            flex-direction: column;
            text-align: center;
        }

        .about-img {
            width: 100%;
            height: 100%;
            margin-bottom: 1rem;
        }

        .about-info p {
            margin: 1rem 2rem;
        }

        .about-info button {
            margin: 1rem 2rem;
            width: 10rem;
        }

        .team {
            margin: 0 1rem;
        }
    }

</style>
<jsp:include page="header.jsp"/>
<body>
<section style="position: relative;">
    <div class="carousel-item active c-item">
        <img src="${pageContext.request.contextPath}/assets/gadgetsone.jpg" class="d-block w-100 c-img" alt="Slide 1">
        <div class="carousel-caption top-0 mt-4">
            <p class="mt-5 fs-3 text-uppercase"></p>
            <h1 class="display-1 fw-bolder text-capitalize">About Us</h1>
        </div>
    </div>
</section>
<section>
    <div class="text-container">
        <p style="font-weight: bold; color: #ff8c00; text-align: center;">.GADGET is a leading platform........</p>
        <p style="text-align: center">We work on UI/UX and functionality as well, so that a plugin comes with proper structure and stunning looks that suit your web app and website. We take a small toolkit here and ride it well so that it is fit for your use. One who performs well and looks even better. Here, we are trying to give you all kinds of technical content, whether it is related to designing or functionality. We are creating content in a lot of languages and will continue to make it free of charge even if you use it without any problem. Which is a very important thing. Here you can also share the content you create; if our technical team likes it, then we will also share it on our blog. In the end, I would say to keep visiting our website and enjoy the quality content.</p>
    </div>

</section>








<section class="team">
    <h1>Meet Our Team</h1>
    <div class="team-cards">

        <!-- Cards here -->
        <!-- Card 1 -->

        <div class="card">
            <div class="card-img">
                <img
                        src="../assets/Sushil.jpg" alt="User 1">
            </div>
            <div class="card-info">
                <h2 class="card-name">Sushil Dawadi</h2>
                <p class="card-role"> Founder</p>
                <p class="card-email">sushildawadi14@gmail.com</p>
                <p><button class="button" onclick="window.open( 'https://www.facebook.com/SushilDawadi07', '_blank')">Contact</button></p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <div class="card-img">
                <img
                        src="../assets/sachin.jpg" alt="User 3">
            </div>
            <div class="card-info">
                <h2 class="card-name">Sachin Sapkota</h2>
                <p class="card-role">Founder</p>
                <p class="card-email">sacheensapkota10@gmail.com</p>
                <p><button class="button" onclick="window.open('https://www.facebook.com/sapkota.sacheen', '_blank')">Contact</button></p>
            </div>
        </div>



        <!-- Card 3 -->
        <div class="card">
            <div class="card-img">
                <img
                        src="../assets/abishkar.jpg" alt="User 2">
            </div>
            <div class="card-info">
                <h2 class="card-name">Abishkar Chapagain</h2>
                <p class="card-role">Founder</p>
                <p class="card-email">abishkarchapagain1@gmail.com</p>
                <p><button class="button" onclick="window.open('https://www.facebook.com/abishkar.chapagain', '_blank')">Contact</button></p>
            </div>
        </div>


        <!-- card 4 -->
        <div class="card">
            <div class="card-img">
                <img
                        src="../assets/Manish.jpg" alt="User 3">
            </div>
            <div class="card-info">
                <h2 class="card-name">Manish Dhamala</h2>
                <p class="card-role">Founder</p>
                <p class="card-email">dhamalamanish32@gmail.com</p>
                <p><button class="button" onclick="window.open( 'https://www.facebook.com/manish.dhamala.11', '_blank')">Contact</button></p>
            </div>
        </div>
        <!-- card 5 -->
        <div class="card">
            <div class="card-img">
                <img
                        src="../assets/Hem.jpg" alt="User 3">
            </div>
            <div class="card-info">
                <h2 class="card-name">Hem Bahadur Pun</h2>
                <p class="card-role">Founder</p>
                <p class="card-email">hemthegentlemen@gmail.com</p>
                <p><button class="button" onclick="window.open(  'https://www.facebook.com/heemal.himalpun', '_blank')">Contact</button></p>
            </div><%-- onclick="window.open('https://www.facebook.com/your-facebook-page', '_blank')--%>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>

</html>

