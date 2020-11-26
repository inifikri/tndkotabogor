<!DOCTYPE html>
<html lang="en">
    
<head>
    <!-- META SECTION -->
    <title>TNDE Pemerintah Kota Bogor</title>            
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
        
    <link rel="icon" href="<?php echo base_url('assets/img/icon.png') ?>" type="image/x-icon" />
    <!-- END META SECTION -->
        
    <!-- CSS INCLUDE -->        
    <link rel="stylesheet" type="text/css" id="theme" href="<?php echo base_url('assets/css/theme-default.css') ?>"/>
    <!-- EOF CSS INCLUDE -->                           
</head>

    <body>

        <!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <?php $this->load->view('sidebar'); ?>
            
            <!-- PAGE CONTENT -->
            <div class="page-content">
                
                <?php $this->load->view('header'); ?>                  

                <?php $this->load->view($content); ?>    
                                                
            </div>            
            <!-- END PAGE CONTENT -->

        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if you want to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="<?php echo site_url('login/logout') ?>" class="btn btn-success btn-lg" style="background-color: #d67011; border: none;">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close" style="border: none;">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->

        <!-- START PRELOADS -->
        <audio id="audio-alert" src="<?php echo base_url('assets/audio/alert.mp3') ?>" preload="auto"></audio>
        <audio id="audio-fail" src="<?php echo base_url('assets/audio/fail.mp3') ?>" preload="auto"></audio>
        <!-- END PRELOADS -->                  
            
        <!-- START SCRIPTS -->

            <!-- START PLUGINS -->
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/jquery/jquery.min.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/jquery/jquery-ui.min.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/bootstrap/bootstrap.min.js') ?>"></script>        
            <!-- END PLUGINS -->     

            <!-- START ALL PAGE PLUGINS-->        
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/icheck/icheck.min.js') ?>"></script>        
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js') ?>"></script>

            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/highlight/jquery.highlight-4.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/faq.js') ?>"></script>
            
            <!-- FORM -->
            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/bootstrap/bootstrap-datepicker.js') ?>'></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/bootstrap/bootstrap-timepicker.min.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/bootstrap/bootstrap-colorpicker.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/bootstrap/bootstrap-file-input.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/bootstrap/bootstrap-select.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/tagsinput/jquery.tagsinput.min.js') ?>"></script> 
            <!-- END FORM -->
  
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/rickshaw/d3.v3.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/rickshaw/rickshaw.min.js') ?>"></script>

            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/moment.min.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.min.js') ?>"></script>

            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/codemirror/codemirror.js') ?>"></script>        
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/htmlmixed/htmlmixed.js') ?>"></script>
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/xml/xml.js') ?>"></script>
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/javascript/javascript.js') ?>"></script>
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/css/css.js') ?>"></script>
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/clike/clike.js') ?>"></script>
            <script type='text/javascript' src="<?php echo base_url('assets/js/plugins/codemirror/mode/php/php.js') ?>"></script>    

            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins/summernote/summernote.js') ?>"></script>

            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/noty/jquery.noty.js') ?>'></script>
            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/noty/layouts/topCenter.js') ?>'></script>
            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/noty/layouts/topLeft.js') ?>'></script>
            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/noty/layouts/topRight.js') ?>'></script>            
            
            <script type='text/javascript' src='<?php echo base_url('assets/js/plugins/noty/themes/default.js') ?>'></script>
            <?php if ($this->session->flashdata('error')) { ?>
                <!-- error -->
                <div class="message-box message-box-danger animated fadeIn" id="message-error">
                    <div class="mb-container">
                        <div class="mb-middle">
                            <div class="mb-title"><span class="fa fa-times"></span> <?php echo $this->session->flashdata('error') ?></div>
                            <div class="mb-footer">
                                <button class="btn btn-default btn-lg pull-right mb-control-close" id="close-message-error">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- error -->

                <script type="text/javascript">
                    $('#message-error').show();
                    $('#close-message-error').click(function () {
                        $('#message-error').hide();
                    });
                </script>
            <?php }elseif ($this->session->flashdata('success')) { ?>
                <!-- success -->
                <div class="message-box message-box-warning animated fadeIn" id="message-box-warning">
                    <div class="mb-container">
                        <div class="mb-middle">
                            <div class="mb-title"><span class="fa fa-check"></span> <?php echo $this->session->flashdata('success'); ?></div>
                            <div class="mb-footer">
                                <button class="btn btn-default btn-lg pull-right mb-control-close" id="close-message-box-warning">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- success -->

                <script type="text/javascript">
                    $('#message-box-warning').show();
                    $('#close-message-box-warning').click(function () {
                        $('#message-box-warning').hide();
                    });
                </script>
            <?php } ?>
            <!-- END ALL PAGE PLUGINS-->  

            <!-- START TEMPLATE -->
            <script type="text/javascript" src="<?php echo base_url('assets/js/settings.js') ?>"></script>
            <script type="text/javascript" src="<?php echo base_url('assets/js/plugins.js') ?>"></script>        
            <script type="text/javascript" src="<?php echo base_url('assets/js/actions.js') ?>"></script>
            <!-- END TEMPLATE -->

    <!-- END SCRIPTS -->  

    </body>

</html>