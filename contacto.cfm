<cfinclude template="header.cfm">
<cfinclude template="common.cfm">

<cfset printNavigationBar('Contacto', 'website_files/images/finca_ninos_cocos/4.jpg')>

<!--- <cfmail from="amorquetransforma@hotmail.com" 
        subject="Hola de prueba" 
        to="gustavojoseh@gmail.com"
        charset="utf-8"
        priority="normal"
        type="html">
            Hola de prueba
        </cfmail> --->

<section class="contact sec-padd2">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="section-title">
                    <h2>Envíanos un <span class="thm-color">mensaje</span></h2>
                </div>
                <div class="default-form-area">
                    <form id="contact_form" name="contact_form" class="default-form" action="contact_proccess.cfm" method="post">
                        <div class="row clearfix">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="full_name" id="full_name" class="form-control" value="" placeholder="Tu nombre completo">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control" value="" placeholder="Tu correo electrónico">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="phone" id="phone" class="form-control" value="" placeholder="Teléfono">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="subject" id="subject" class="form-control" value="" placeholder="Tema">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <textarea name="content_message" id="content_message" class="form-control textarea" placeholder="Detalle del mensaje a enviar"></textarea>
                                </div>
                            </div>   
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div id="messageBox"></div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="">
                                    <button class="thm-btn" type="submit" data-loading-text="Please wait...">Enviar mensaje</button>
                                </div>
                            </div>   

                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="section-title">
                    <h2>Contacto <span class="thm-color">rápido</span></h2>
                </div>
                <div class="content">
                    <div class="text">
                        <p>Una descripción para el contacto rápido</p>
                    </div>
                    <ul class="contact-info">
                        <li><i class="icon-arrows"></i><span>Dirección:</span> Calle 5 número 2A Reparto Kokette, Santiago República Dominicana</li>
                        <li><i class="icon-phone"></i><span> Teléfono:</span> 809-276-3344 <br> 809-603-6733</li>
                    </ul>
                    <!--- <ul class="social-icon">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-feed"></i></a></li>
                        <li><a href="#"><i class="fa fa-skype"></i></a></li>
                    </ul> --->
                </div>
            </div>
            

        </div>
    </div>
</section>

<cfinclude template="footer.cfm">

<script type="text/javascript">
    $(document).ready(function() {
        $('#contact_form').on('submit', function(event) {
            event.preventDefault();

            $.getJSON('contact_process.cfm', {
                full_name: $('#full_name').val(),
                email: $('#email').val(),
                phone: $('#phone').val(),
                subject: $('#subject').val(),
                content_message: $('#content_message').val(),
            }, function(data) {
                if (data.ERROR) {
                    $('#messageBox').empty().append('<div class="alert alert-danger">' + data.ERROR_MESSAGE + '</div>');
                } else {
                    $('#messageBox').empty().append('<div class="alert alert-success">' + data.MESSAGE + '</div>');
                    $('#full_name').val("");
                    $('#email').val("");
                    $('#phone').val("");
                    $('#subject').val("");
                    $('#content_message').val("");
                }
            });
        });
    });
</script>