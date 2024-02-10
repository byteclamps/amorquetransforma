<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>.::FUMIAQUET::.</title>
	<!-- mobile responsive meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="Content-Security-Policy" content="default-src * 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-inline' 'unsafe-eval'; connect-src * 'unsafe-inline'; img-src * data: blob: 'unsafe-inline'; frame-src *; style-src * 'unsafe-inline';">

    <!--- plugins --->
    <link rel="stylesheet" href="/plugins/bootstrapvalidator/bootstrapValidator.min.css">

	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/responsive.css">

	<link rel="apple-touch-icon" sizes="180x180" href="images/favicons/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="favico.ico">
</head>
<body>

<div class="boxed_wrapper">

<div class="top-bar">
    <div class="container">
        <div class="clearfix">
            <!--- <div class="top-bar-text float_left">
                <button class="thm-btn donate-box-btn">Donar</button>
            </div> --->
            <div class="right-column float_right">
                <ul class="list_inline contact-info">
                    <li><span class="icon-phone"></span>Teléfonos: 809-276-3344 / 809-603-6733</li>
                    <li><span class="icon-back"></span>Correo: amorquetransforma@hotmail.com</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<section class="theme_menu stricky">
    <div class="container">
        <div class="row pull-left">
            <!--- <div class="col-md-3">
                <div class="main-logo">
                    <a href="index.cfm"><h3>FUMIAQUET</h3></a>
                </div>
            </div> --->
            <div class="col-md-12">
                <nav class="defaultmainmenu" id="main_menu">
                   <ul class="defaultmainmenu-menu">
                        <li class=""><a style="<cfif findNoCase('index', CGI.SCRIPT_NAME, 0) gt 0 or CGI.SCRIPT_NAME eq '/index.cfm'>color: #209BCA;</cfif>" href="/index.cfm">Inicio</a></li>
                        <li class=""><a style="<cfif findNoCase('nosotros', CGI.SCRIPT_NAME, 0) gt 0>color: #209BCA;</cfif>" href="/nosotros.cfm">¿Quiénes sómos?</a></li>
                        <li class=""><a style="<cfif findNoCase('voluntarios', CGI.SCRIPT_NAME, 0) gt 0>color: #209BCA;</cfif>" href="/voluntarios.cfm">Voluntarios</a></li>
                        <li class=""><a style="<cfif findNoCase('actividades', CGI.SCRIPT_NAME, 0) gt 0>color: #209BCA;</cfif>" href="/actividades.cfm">Actividades</a></li>
                        <li class=""><a style="<cfif findNoCase('contacto', CGI.SCRIPT_NAME, 0) gt 0>color: #209BCA;</cfif>" href="/contacto.cfm">Contacto</a></li>
                        <!--- <li class=""><a href="/info.docx">Descargar resumen</a></li> --->
                    </ul>
                </nav> 
            </div>
            <div class="right-column">

                <div class="nav_side_content">
                    <ul class="social-icon">
                        <li><a href="https://www.instagram.com/fumiaquet_/" target="_blank"><i class="fa fa-instagram"></i></a></li>
                    </ul>
               </div>  
            </div>
        </div>
   </div>
</section>