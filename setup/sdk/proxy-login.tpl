<?php
    if (! isset($_GET['redirect_uri'])) {
        http_response_code(400);
        die();
    }

    require_once("{{SDKHOME}}/proxy-spid-php.php");

    const PROXY_CONFIG_FILE = "{{SDKHOME}}/spid-php-proxy.json";

    $proxy_config = file_exists(PROXY_CONFIG_FILE)? json_decode(file_get_contents(PROXY_CONFIG_FILE), true) : array();
    $production = $proxy_config['production'];

    $state = '';

    $spidsdk = new PROXY_SPID_PHP('{{PROXY_CLIENT_ID}}', $_GET['redirect_uri'], $state, $production);
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soluzione FAD - Login con Identità Digitale</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-italia@2.10.0/dist/css/bootstrap-italia.min.css" integrity="sha256-gkL3YqSO9nOGjwRgg8IEdAXo+A/qWqPfj9tNSb974TY=" crossorigin="anonymous">
    <?php $spidsdk->insertSPIDButtonCSS(); ?>
    <?php $spidsdk->insertSPIDButtonJS(); ?>
    <style>
        .spid-idp-button .spid-idp-button-menu li > a img {
            box-sizing: content-box; !important;
        }
    </style>
</head>
<style>
</style>
<body class="d-flex flex-column min-vh-100">
<!-- Header -->
<header class="container mt-4 p-0">
    <div class="pb-3 mb-4 border-bottom">
        <a href="https://soluzionefad.it" class="d-flex align-items-center text-body-emphasis text-decoration-none">
            <img src="https://soluzionefad.it/public/images/landing/elements/header/logo-sf.svg" width="150" alt="Soluzione FAD">
        </a>
    </div>
</header>
<!-- Main content -->
<main class="container flex-grow-1 d-flex align-items-center justify-content-center p-0">
    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                <h2>Accedi con SPID</h2>
                <p>Il Sistema Pubblico di Identità Digitale (SPID) è il sistema di accesso che consente di utilizzare, con un'identità digitale unica, i servizi online della Pubblica Amministrazione e dei privati accreditati.</p>
                <?php $spidsdk->insertSPIDButton("L"); ?>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                <h2>Accedi con CIE</h2>
                <p>La Carta di Identità Elettronica (CIE) è il documento personale che attesta l'identità del cittadino, permette l'accesso ai servizi digitali della Pubblica Amministrazione e dei privati accreditati.</p>
                <?php $spidsdk->insertCIEButton(); ?>
            </div>
        </div>
    </div>
</main>
<!-- Footer -->
<footer class="container mt-auto d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top text-muted">
    <p class="col-md-4 mb-0 text-body-secondary">
        Soluzione FAD s.r.l.
        <text style="font-family: Arial, Helvetica, sans-serif;">©</text>
        <?php echo date('Y') ?>
        <br>VAT 01408710778 Cap. soc. 10.000,00€ i.v.
    </p>
    <a href="https://soluzionefad.it" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <img src="https://soluzionefad.it/public/images/landing/elements/footer/logo-mini-dark.svg" alt="Soluzione FAD" width="20" style="opacity: 0.4;">
    </a>
    <ul class="nav col-md-4 justify-content-end">
        <li class="nav-item"><a href="https://soluzionefad.it/cookie" class="nav-link px-2 text-secondary">Cookie</a></li>
        <li class="nav-item"><a href="https://soluzionefad.it/privacy" class="nav-link px-2 text-secondary">Privacy</a></li>
    </ul>
</footer>
<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap-italia@2.10.0/dist/js/bootstrap-italia.bundle.min.js" integrity="sha256-DVZLrEEzytf5R/7yrYa+cw74cbHGctliabs2lZXV2n0=" crossorigin="anonymous"></script>-->
</body>
</html>
