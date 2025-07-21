<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy New Year 2025</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            background: linear-gradient(to bottom, #000428, #004e92);
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            position: relative;
        }

        h1 {
            font-size: 4rem;
            font-weight: bold;
            color: #fff;
            text-shadow: 0 0 20px rgba(255, 255, 255, 0.8), 
                         0 0 30px rgba(255, 255, 255, 0.6),
                         0 0 40px rgba(255, 255, 255, 0.4);
            animation: glow 2s infinite alternate;
        }

        @keyframes glow {
            to {
                text-shadow: 0 0 30px rgba(255, 255, 255, 1), 
                             0 0 40px rgba(255, 255, 255, 0.8),
                             0 0 50px rgba(255, 255, 255, 0.6);
            }
        }

        /* Balloons */
        .balloon {
            position: absolute;
            width: 60px;
            height: 80px;
            border-radius: 50%;
            background: radial-gradient(circle, #fff 10%, #ff69b4 80%);
            animation: floatUp 5s infinite ease-in-out;
        }

        .balloon:nth-child(odd) {
            background: radial-gradient(circle, #fff 10%, #87CEEB 80%);
        }

        @keyframes floatUp {
            0% {
                transform: translateY(100%);
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh);
                opacity: 0;
            }
        }

        .balloon:nth-child(1) {
            left: 10%;
            animation-delay: 0s;
        }

        .balloon:nth-child(2) {
            left: 30%;
            animation-delay: 2s;
        }

        .balloon:nth-child(3) {
            left: 50%;
            animation-delay: 1s;
        }

        .balloon:nth-child(4) {
            left: 70%;
            animation-delay: 3s;
        }

        .balloon:nth-child(5) {
            left: 90%;
            animation-delay: 4s;
        }

        /* Confetti */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #fff;
            opacity: 0.8;
            border-radius: 50%;
            animation: fall 3s infinite linear;
        }

        @keyframes fall {
            0% {
                transform: translateY(-10vh) rotate(0deg);
                opacity: 1;
            }
            50% {
                transform: translateY(50vh) rotate(180deg);
                opacity: 0.8;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        .confetti:nth-child(1) {
            left: 20%;
            animation-delay: 0s;
        }

        .confetti:nth-child(2) {
            left: 40%;
            animation-delay: 1s;
        }

        .confetti:nth-child(3) {
            left: 60%;
            animation-delay: 0.5s;
        }

        .confetti:nth-child(4) {
            left: 80%;
            animation-delay: 1.5s;
        }

        .confetti:nth-child(5) {
            left: 10%;
            animation-delay: 2s;
        }
    </style>
</head>
<body>
    <h1>Happy New Year 2025!</h1>
        <h1>khlifi houcem!</h1>
        <h1>Gitlab Webhook</h1>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>

    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
</body>
</html>
