<!-- START PAGE SIDEBAR -->
<div class="page-sidebar">
    
    <!-- START X-NAVIGATION -->
    <ul class="x-navigation">
        
        <li class="xn-logo">
            <a href="<?php echo site_url('home/dashboard') ?>"><b>TNDE</b></a>
            <a href="#" class="x-navigation-control"></a>
        </li>
        <li class="xn-profile">
            <a href="#" class="profile-mini">
                <?php if (empty($this->session->userdata('foto'))) { ?>
                    <img src="<?php echo base_url('assets/imagesusers/user-default.png'); ?>" alt="<?php echo $this->session->userdata('nama') ?>"/>
                <?php }else{ ?>
                    <img src="<?php echo base_url('assets/imagesusers/'.$this->session->userdata('foto')); ?>" alt="<?php echo $this->session->userdata('nama') ?>"/>
                <?php } ?>
            </a>
            <div class="profile">
                <div class="profile-image">
                    <?php if (empty($this->session->userdata('foto'))) { ?>
                        <img src="<?php echo base_url('assets/imagesusers/user-default.png'); ?>" alt="<?php echo $this->session->userdata('nama') ?>"/>
                    <?php }else{ ?>
                        <img src="<?php echo base_url('assets/imagesusers/'.$this->session->userdata('foto')); ?>" alt="<?php echo $this->session->userdata('nama') ?>"/>
                    <?php } ?>
                </div>
                <div class="profile-data">
                    <?php if ($this->session->userdata('level') == 1 OR $this->session->userdata('level') == 2) { ?>
                        <div class="profile-data-name"><?php echo $this->session->userdata('username'); ?></div>
                        <div class="profile-data-title"><?php echo $this->session->userdata('email'); ?></div>
                    <?php }else{ ?>
                        <div class="profile-data-name"><?php echo $this->session->userdata('nama'); ?></div>
                        <div class="profile-data-title"><?php echo $this->session->userdata('nama_jabatan'); ?></div>
                    <?php } ?>
                </div>
            </div>                                                                        
        </li>

        <!-- START MENU -->
        <li class="xn-title">Menu Utama</li>
        <li class="<?php if($this->uri->segment(2) == 'dashboard'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('home/dashboard') ?>"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard </span></a> 
        </li>
        
        <!-- START MENU SURAT -->

        <?php if($this->uri->segment(1) == 'suratkeluar' AND $this->uri->segment(2) != 'draft'){ ?>
        
            <li class="xn-title">Naskah Dinas Surat</li>
            <li class="<?php if($this->uri->segment(2) == 'instruksi'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/instruksi'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Instruksi</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'edaran'){ echo 'active'; } ?>">
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/edaran'); 
                        } 
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Edaran</span></a>
            </li>
            <li class="<?php if($this->uri->segment(2) == 'biasa'){ echo 'active'; } ?>">
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/biasa'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Biasa</span></a>
            </li>
            <li class="<?php if($this->uri->segment(2) == 'keterangan'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/keterangan'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Keterangan</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'perintahtugas'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/perintahtugas'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Perintah Tugas</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'perintah'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/perintah'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Perintah</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'izin'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/izin'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Izin</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'perjalanan'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/perjalanan'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Perjalanan Dinas</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'kuasa'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/kuasa'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Kuasa/Surat Kuasa Khusus</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'undangan'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/undangan'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Undangan</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'melaksanakan_tugas'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/melaksanakan_tugas'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Keterangan Melaksanakan Tugas</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'panggilan'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/panggilan'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Panggilan</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'notadinas'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/notadinas'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Nota Dinas</span></a> 
            </li>
            <li> 
                <a href="javascript:void(0)"><span class="fa fa-envelope-o"></span> <span class="xn-text">Lembar Disposisi</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'pengumuman'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/pengumuman'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Pengumuman</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'laporan'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/laporan'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Laporan</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'rekomendasi'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/rekomendasi'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Rekomendasi</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'pengantar'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/pengantar'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Pengantar</span></a> 
            </li>
            <li> 
                <a href="javascript:void(0)"><span class="fa fa-envelope-o"></span> <span class="xn-text">Berita Acara</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'notulen'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/notulen'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Notulen</span></a> 
            </li>
            <li class="<?php if($this->uri->segment(2) == 'memo'){ echo 'active'; } ?>"> 
                <a href="
                    <?php 
                        if($this->uri->segment(1) == 'suratkeluar'){ 
                            echo site_url('suratkeluar/memo'); 
                        }
                    ?>
                "><span class="fa fa-envelope-o"></span> <span class="xn-text">Memo</span></a> 
            </li>
            <li> 
                <a href="javascript:void(0)"><span class="fa fa-envelope-o"></span> <span class="xn-text">Lembaran Daerah</span></a> 
            </li>
        
        <?php }elseif($this->uri->segment(2) == 'draft'){ ?>

            <li class="xn-title">Naskah Dinas Surat</li>
            <li class="<?php if($this->uri->segment(2) == 'draft'){ echo 'active'; } ?>"> 
                <a href="<?php echo site_url('suratkeluar/draft'); ?>"><span class="fa fa-envelope-o"></span> <span class="xn-text">Draft Surat</span></a> 
            </li>

        <?php }elseif($this->uri->segment(1) == 'suratmasuk'){ ?>
                
            <li class="xn-title">Naskah Dinas Surat</li>
            <li class="<?php if($this->uri->segment(2) == 'inbox' AND $this->uri->segment(3) == ''){ echo 'active'; } ?>"> 
                <a href="<?php echo site_url('suratmasuk/inbox'); ?>"><span class="fa fa-envelope-o"></span> <span class="xn-text">Disposisi Surat</span></a> 
            </li>
            <?php if ($this->session->userdata('level') == 4) { ?>
                <li class="<?php if($this->uri->segment(2) == 'surat'){ echo 'active'; } ?>"> 
                    <a href="<?php echo site_url('suratmasuk/surat'); ?>"><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Masuk</span></a> 
                </li>
            <?php } ?>
            <li class="<?php if($this->uri->segment(3) == 'selesai'){ echo 'active'; } ?>"> 
                <a href="<?php echo site_url('suratmasuk/inbox/selesai'); ?>"><span class="fa fa-envelope-o"></span> <span class="xn-text">Surat Selesai</span></a> 
            </li>

        <?php } ?>

        <!-- END MENU SURAT-->

        <!-- START MENU PENGARSIPAN-->
        <?php if ($this->uri->segment(1) == 'pengarsipan') { ?>
        <li class="xn-title">Pengarsipan Surat</li>
        <li class="<?php if($this->uri->segment(2) == 'suratkeluar'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('pengarsipan/suratkeluar') ?>"><span class="fa fa-archive"></span> <span class="xn-text">Surat Keluar</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'suratmasuk'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('pengarsipan/suratmasuk') ?>"><span class="fa fa-archive"></span> <span class="xn-text">Surat Masuk</span></a> 
        </li>
        <?php } ?>
        <!-- END MENU PENGARSIPAN-->

        <!-- START MENU ADMINISTRATOR-->
        <?php 
        if ($this->session->userdata('level') == 1) { 
            if ($this->uri->segment(1) == 'master' OR $this->uri->segment(1) == 'home') { 
        ?>
        
        <li class="xn-title">Data Master</li>
        
        <li class="<?php if($this->uri->segment(2) == 'perangkatdaerah'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/perangkatdaerah') ?>"><span class="fa fa-list-alt"></span> <span class="xn-text">Perangkat Daerah</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'jabatan'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/jabatan') ?>"><span class="fa fa-bookmark"></span> <span class="xn-text">Jabatan</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'aparatur'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/aparatur') ?>"><span class="fa fa-user"></span> <span class="xn-text">Aparatur</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'users'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/users') ?>"><span class="fa fa-users"></span> <span class="xn-text">Users</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'kodesurat'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/kodesurat') ?>"><span class="fa fa-code-fork"></span> <span class="xn-text">Kode Surat</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'level'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/level') ?>"><span class="fa fa-chain"></span> <span class="xn-text">Level</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'informasi'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/informasi') ?>"><span class="fa fa-info"></span> <span class="xn-text">Informasi</span></a> 
        </li>

        <?php 
            } 
        }elseif ($this->session->userdata('level') == 2) { 
            if ($this->uri->segment(1) == 'master' OR $this->uri->segment(1) == 'home') { 
        ?>
        
        <li class="xn-title">Data Master</li>

        <li class="<?php if($this->uri->segment(2) == 'jabatan'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/jabatan') ?>"><span class="fa fa-bookmark"></span> <span class="xn-text">Jabatan</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'aparatur'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/aparatur') ?>"><span class="fa fa-user"></span> <span class="xn-text">Aparatur</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'users'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/users') ?>"><span class="fa fa-users"></span> <span class="xn-text">Users</span></a> 
        </li>
        <li class="<?php if($this->uri->segment(2) == 'eksternal'){ echo 'active'; } ?>"> 
            <a href="<?php echo site_url('master/eksternal') ?>"><span class="fa fa-external-link-square"></span> <span class="xn-text">Perangkat Eksternal</span></a> 
        </li>

        <?php 
            }
        }
        ?>

        <!-- END MENU ADMINISTRATOR-->

        <?php if ($this->uri->segment(2) == 'informasi' AND $this->uri->segment(1) != 'master') { ?>
        
        <li class="xn-title">Informasi</li>
        <li class="active"> 
            <a href="<?php echo site_url('home/informasi') ?>"><span class="fa fa-info"></span> <span class="xn-text">Informasi</span></a> 
        </li>

        <?php }elseif ($this->uri->segment(2) == 'statistik') { ?>
        
        <li class="xn-title">Statistik</li>
        <li class="active"> 
            <a href="<?php echo site_url('home/statistik') ?>"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistik</span></a> 
        </li>
        
        <?php }elseif ($this->uri->segment(2) == 'profil') { ?>
        
        <li class="xn-title">Profil</li>
        <li class="active"> 
            <a href="<?php echo site_url('home/profil') ?>"><span class="fa fa-user"></span> <span class="xn-text">Profil</span></a> 
        </li>
        
        <?php }elseif ($this->uri->segment(2) == 'disposisi') { ?>
        
        <li class="xn-title">Disposisi</li>
        <li class="active"> 
            <a href="<?php echo site_url('home/disposisi') ?>"><span class="fa fa-envelope-o"></span> <span class="xn-text">Disposisi</span></a> 
        </li>
        
        <?php } ?>

    </ul>
    <!-- END X-NAVIGATION -->

</div>
<!-- END PAGE SIDEBAR -->