<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="<?php echo site_url('home/dashboard') ?>">Dashboard</a></li>                    
    <li><a href="javascript:void(0)">Naskah Dinas Surat</a></li>
    <li><a href="<?php echo site_url('suratkeluar/pengumuman') ?>">Pengumuman</a></li>
    <li class="active">Form</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">                    
    <h2><span class="fa fa-envelope"></span> Form Pengumuman</h2>
</div>
<!-- END PAGE TITLE -->                

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">                

    <div class="row">
        <div class="col-md-12">

            <?php if ($this->uri->segment(3) == 'add') { ?>
            
                <!-- START DEFAULT FORM -->
                <form class="form-horizontal" action="<?php echo site_url('suratkeluar/pengumuman/insert') ?>" method="post" enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="javascript:history.back()" class="btn btn-default">&laquo; Kembali</a> <br><br>
                    </div>
                    <div class="panel-body">                                                                        

                        <div class="row">
                            
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label class="col-md-1 control-label">Kop Surat</label>
                                    <div class="col-md-11">
                                        <select name="kop_id" class="form-control select" data-live-search="true">
                                            <option value="">Pilih Kop Surat</option>
                                            <?php foreach ($kop as $key => $h) { ?> 
                                                <option value="<?php echo $h->kop_id ?>"><?php echo $h->nama; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">Tanggal</label>
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            <input type="text" name="tanggal" class="form-control datepicker" value="<?php echo date('Y-m-d') ?>"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">Kode Surat</label>
                                    <div class="col-md-11">
                                        <select name="kodesurat_id" class="form-control select" data-live-search="true" required>
                                            <option value="">Pilih Kode Surat</option>
                                            <?php foreach ($kodesurat as $key => $h) { ?> 
                                                <option value="<?php echo $h->kodesurat_id ?>"><?php echo $h->kode; ?> - <?php echo substr($h->tentang, 0,130); ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-1 control-label">Tentang</label>
                                    <div class="col-md-11">
                                        <input type="text" name="tentang" class="form-control" required />
                                    </div>
                                </div>
                                
                            </div>

                            <div class="col-md-12"><br>
                                <label>Isi</label>
                                <textarea name="isi" class="summernote" required>
                                    <blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;">
                                        <p style="text-align: justify; line-height: 1.5;">
                                            <span style="font-size: 12pt;">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bahwa dalam rangka terwujudnya koordinasi dan singkronisasi dalam pelaksanaan Pemerintah daerah bersama ini kami sampaikan kewenangan penandatanganan dan pemanfaatan Naskah Dinas di Lingkungan Pemerintah Kota Bogor, sesuai dengan Peraturan WaliKota Bogor Nomor 33 Tahun 2016 tentang Tata Naskah Dinas di LingkunganPemerintah Kota Bogor sebagai berikut :<br>
                                            </span>
                                        </p>
                                        <ol>
                                            <li>
                                                <p>
                                                    <span style="font-size: 12pt;">
                                                    Dalam hal pemarafan berdasarkan ketentuan Peraturan Wali Kota Bogor Nomor 33 Tahun2016 Pasal 21 bahwa setiap Naskah Dinas (Naskah Dinas dalam bentuk Produk Hukum dan Naskah Dinas dalam bentuk Surat) dari Perangkat&nbsp; Daerah yang ditandatangani oleh Walikota, Wakil Walikota dan Sekretaris Daerah di paraf paling banyak oleh 3 orang pejabat secara berjenjang sebagai bentuk pertanggungjawabaan atas muatan materi, substansi, redaksi dan pengetikan Naskah Dinas.
                                                    </span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span style="font-size: 12pt;">
                                                        Dalam hal penandatanganan Naskah Dinas sesuai ketentuan Pasal 27 ayat (1) dan ayat (2) Peraturan Wali Kota Bogor Nomor 33 Tahun 2016 Asisten atas nama Sekretaris Daerah mempunyai kewenangan menandatangani Naskah Dinas yang terdiridari Surat Biasa, Surat Keterangan, Surat Undangan, Surat Panggilan, NotaDinas, Laporan, Surat Pengantar dan Daftar Hadir.
                                                    </span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span style="font-size: 12pt;">
                                                    Kewenangan penandatanganan dan pemarafan oleh Asisten dilaksanakan sesuai dengan jejaring koordinasi masing-masing Asisten sebagaimana terlampir.&nbsp;
                                                    </span>
                                                </p>
                                            </li>
                                        </ol>
                                        <p class="MsoNormal" style="text-align: justify; line-height: 1.5;">&nbsp;</p>
                                    </blockquote>
                                    <p style="margin: 0cm 0cm 7.5pt 0cm;">&nbsp;</p>
                                    <p>&nbsp;</p> 
                                </textarea>
                            </div>
                            
                        </div>

                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-danger" type="reset">Bersihkan Form</button>   
                        <button class="btn btn-primary pull-right" type="submit">Simpan</button>
                    </div>
                </div>
                </form>
                <!-- END DEFAULT FORM -->

            <?php 
                }elseif ($this->uri->segment(3) == 'edit') { 
                foreach ($pengumuman as $key => $e) {
            ?>

                <!-- START DEFAULT FORM -->
                <form class="form-horizontal" action="<?php echo site_url('suratkeluar/pengumuman/update') ?>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<?php echo $e->id ?>" />
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="javascript:history.back()" class="btn btn-default">&laquo; Kembali</a> <br><br>
                    </div>
                    <div class="panel-body">                                                                       
                        
                        <br><div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-1 control-label">Kop Surat</label>
                                <div class="col-md-11">
                                    <select name="kop_id" class="form-control select" data-live-search="true">
                                        <option value="">Pilih Kop Surat</option>
                                        <?php foreach ($kop as $key => $h) { ?> 
                                            <option value="<?php echo $h->kop_id ?>" <?php if ($h->kop_id == $e->kop_id) { echo "selected"; } ?>><?php echo $h->nama; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">Tanggal</label>
                                <div class="col-md-11">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                        <input type="text" name="tanggal" class="form-control datepicker" value="<?php echo $e->tanggal ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">Kode Surat</label>
                                <div class="col-md-11">
                                    <select name="kodesurat_id" class="form-control select" data-live-search="true" required>
                                        <option value="">Pilih Kode Surat</option>
                                        <?php foreach ($kodesurat as $key => $h) { ?> 
                                            <option value="<?php echo $h->kodesurat_id ?>" <?php if ($h->kodesurat_id == $e->kodesurat_id) { echo "selected"; } ?>>
                                                <?php echo $h->kode; ?> - <?php echo substr($h->tentang, 0,130); ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">                                        
                                <label class="col-md-1 control-label">Tentang</label>
                                <div class="col-md-11">
                                    <input type="text" name="tentang" class="form-control" required value="<?php echo $e->tentang ?>" />
                                </div>
                            </div>

                        </div>

                        <div class="col-md-12"><br>
                            <label>Isi</label>
                            <textarea name="isi" class="summernote" required> <?php echo $e->isi ?> </textarea>
                        </div>

                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-danger" type="reset">Bersihkan Form</button>   
                        <button class="btn btn-primary pull-right" type="submit">Simpan</button>
                    </div>
                </div>
                </form>
                <!-- END DEFAULT FORM -->

            <?php
                } 
                }elseif ($this->uri->segment(3) == 'disposisi') {
            ?>

                <!-- START DEFAULT FORM -->
                <form class="form-horizontal" action="<?php echo site_url('suratkeluar/draft/disposisi') ?>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="surat_id" value="<?php echo $this->uri->segment(4) ?>" required>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="javascript:history.back()" class="btn btn-default">&laquo; Kembali</a> <br><br>
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-md-12">

                    <?php if ($cekListOPD < 1) { ?>

                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">Nomor Surat</label>
                                    <div class="col-md-10">                                                                                
                                        <input type="text" class="form-control" name="nomor" required>   
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">Perangkat Daerah</label>
                                    <div class="col-md-10">                                                                                
                                        <select multiple name="jabatan_id[]" class="form-control select" data-live-search="true">
                                            <?php foreach (sendOpd() as $key => $h) { ?> 
                                                <option value="<?php echo $h->jabatan_id ?>"><?php echo $h->nama_pd; ?></option>
                                            <?php } ?>
                                        </select>   
                                    </div>
                                </div>

                        <br><br> <center> <button class="btn btn-info" name="kirim" type="submit">Kirim</button> </center>

                    <?php }else{ ?>
                                <div class="form-group">
                                    <div class="panel-body faq">
                                        <div class="faq-item">
                                            <div class="faq-title"><span class="fa fa-angle-down"></span>Lihat List Perangkat Daerah yang dikirim</div>
                                            <div class="faq-text">
                                                <h5>List Perangkat Daerah yang dikirim : </h5>
                                                    <?php foreach ($listOPD as $key => $o) { ?>
                                                        <p>
                                                            - <?php echo $o->nama_pd ?> 
                                                            <a href="<?php echo site_url('suratkeluar/draft/delete_disposisi/'.$this->uri->segment(4).'/'.$o->dsuratkeluar_id) ?>" class='btn btn-danger btn-rounded' data-toggle='tooltip' data-placement='right' title='Hapus OPD' onclick="return confirm('Apakah anda yakin akan menghapus?')"><i class='fa fa-times'></i></a>
                                                        </p>
                                                    <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">Nomor Surat</label>
                                    <div class="col-md-10">                                                                                
                                        <input type="text" class="form-control" name="nomor" value="<?php echo $nomor; ?>" readonly>   
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">Perangkat Daerah</label>
                                    <div class="col-md-10">                                                                                
                                        <select multiple name="jabatan_id[]" class="form-control select" data-live-search="true">
                                            <?php foreach (sendOpd() as $key => $o) { ?>
                                                <option value="<?php echo $o->jabatan_id ?>">
                                                    <?php echo $o->nama_pd; ?>
                                                </option>
                                            <?php } ?>
                                        </select>   
                                    </div>
                                </div>

                        <br><br> <center> <button class="btn btn-info" name="kirim" type="submit">Kirim</button> </center> <hr>

                                <div class="form-group">                                        
                                    <label class="col-md-12 control-label" style="font-size: 20px;"><center>Pengarsipan</center></label>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">No Rak</label>
                                    <div class="col-md-10">                                                                                
                                        <input type="text" name="no_rak" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">No Sampul</label>
                                    <div class="col-md-10">                                                                                
                                        <input type="text" name="no_sampul" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-2 control-label">No Book</label>
                                    <div class="col-md-10">                                                                                
                                        <input type="text" name="no_book" class="form-control">
                                    </div>
                                </div>

                        <br><br> <center> <button class="btn btn-primary" name="selesai" type="submit">Arsipkan</button> </center>
                    <?php } ?>

                            </div>
                        </div>
                    
                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-danger" type="reset">Bersihkan Form</button>
                    </div>
                </div>
                </form>
                <!-- END DEFAULT FORM -->

            <?php
                }
            ?>

        </div>
    </div>
</div>