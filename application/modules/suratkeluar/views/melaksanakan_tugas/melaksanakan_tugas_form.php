<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="<?php echo site_url('home/dashboard') ?>">Dashboard</a></li>                    
    <li><a href="javascript:void(0)">Naskah Dinas Surat</a></li>
    <li><a href="<?php echo site_url('suratkeluar/melaksanakan_tugas') ?>">Surat Melaksanakan Tugas</a></li>
    <li class="active">Form</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">                    
    <h2><span class="fa fa-envelope"></span> Form Surat Melaksanakan Tugas</h2>
</div>
<!-- END PAGE TITLE -->                

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">                

    <div class="row">
        <div class="col-md-12">

            <?php if ($this->uri->segment(3) == 'add') { ?>
                
                <!-- START DEFAULT FORM -->
                <form class="form-horizontal" action="<?php echo site_url('suratkeluar/melaksanakan_tugas/insert') ?>" method="post" enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="javascript:history.back()" class="btn btn-default">&laquo; Kembali</a> <br><br>
                    </div>
                    <div class="panel-body">                                                                        
                        
                        <div class="row">
                            
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label class="col-md-2 control-label">Kop Surat</label>
                                    <div class="col-md-10">
                                        <select name="kop_id" class="form-control select" data-live-search="true">
                                            <option value="">Pilih Kop Surat</option>
                                            <?php foreach ($kop as $key => $h) { ?> 
                                                <option value="<?php echo $h->kop_id ?>"><?php echo $h->nama; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Tanggal</label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            <input type="text" name="tanggal" class="form-control datepicker" value="<?php echo date('Y-m-d') ?>"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Kode Surat</label>
                                    <div class="col-md-10">
                                        <select name="kodesurat_id" class="form-control select" data-live-search="true" required>
                                            <option value="">Pilih Kode Surat</option>
                                            <?php foreach ($kodesurat as $key => $h) { ?> 
                                                <option value="<?php echo $h->kodesurat_id ?>"><?php echo $h->kode; ?> - <?php echo substr($h->tentang, 0,130); ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Pegawai</label>
                                    <div class="col-md-10">
                                        <select name="pegawai_id" class="form-control select" data-live-search="true">
                                            <option value="">Pilih Pegawai</option>
                                            <?php foreach ($pegawai as $key => $a) { ?> 
                                                <option value="<?php echo $a->aparatur_id ?>"><?php echo $a->nip; ?> - <?php echo $a->nama; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Dasar SK</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="dasarsk" value="<?php echo $h->dasarsk ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Nomor SK</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="nomorsk" value="<?php echo $h->nomorsk ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">TMT</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="tmt" value="<?php echo $h->tmt ?>" />
                                    </div>
                                </div>                             <div class="form-group">
                                    <label class="col-md-2 control-label">Tugas</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="tugas" value="<?php echo $h->tugas ?>" />
                                    </div>
                                </div>								
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
                foreach ($melaksanakan_tugas as $key => $e) {
            ?>

                <!-- START DEFAULT FORM -->
                <form class="form-horizontal" action="<?php echo site_url('suratkeluar/melaksanakan_tugas/update') ?>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<?php echo $e->id ?>">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="javascript:history.back()" class="btn btn-default">&laquo; Kembali</a> <br><br>
                    </div>
                    <div class="panel-body">                                                                        
                        
                        <div class="row">
                            
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label class="col-md-2 control-label">Kop Surat</label>
                                    <div class="col-md-10">
                                        <select name="kop_id" class="form-control select" data-live-search="true">
                                            <option value="">Pilih Kop Surat</option>
                                            <?php foreach ($kop as $key => $h) { ?> 
                                                <option value="<?php echo $h->kop_id ?>" <?php if ($h->kop_id == $e->kop_id) { echo "selected"; } ?>><?php echo $h->nama; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Tanggal</label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            <input type="text" name="tanggal" class="form-control datepicker" value="<?php echo $e->tanggal ?>"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Kode Surat</label>
                                    <div class="col-md-10">
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
                                    <label class="col-md-2 control-label">Pegawai</label>
                                    <div class="col-md-10">
                                        <select name="pegawai_id" class="form-control select" data-live-search="true">
                                            <option value="">Pilih Pegawai</option>
											<?php foreach ($pegawai as $key => $h) { ?> 
                                                <option value="<?php echo $h->aparatur_id ?>" <?php if ($h->aparatur_id == $e->pegawai_id) { echo "selected"; } ?>><?php echo $h->nip; ?> - <?php echo $h->nama; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>	
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Dasar SK</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="dasarsk" value="<?php echo $e->dasarsk ?>" />
                                    </div>
                                </div>	
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Nomor SK</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="nomorsk" value="<?php echo $e->nomorsk ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">TMT SK</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="tmt" value="<?php echo $e->tmt ?>" />
                                    </div>
                                </div>                             <div class="form-group">
                                    <label class="col-md-2 control-label">Tugas</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="tugas" value="<?php echo $e->tugas ?>" />
                                    </div>
                                </div>								
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

            <?php } } ?>

        </div>
    </div>
</div>