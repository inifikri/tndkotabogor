<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Dashboard</a></li>
    <li><a href="#">Data Master</a></li>
    <li class="active">Perangkat Daerah</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">                    
    <h2><span class="fa fa-list-alt"></span> Data Perangkat Daerah</h2>
</div>
<!-- END PAGE TITLE -->                

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">                

    <div class="row">
        <div class="col-md-12">

            <!-- START DEFAULT DATATABLE -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="<?php echo site_url('master/perangkatdaerah/add') ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Tambah Data</a> <br><br>
                    <table class="table datatable table-responsive table-bordered">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>NAMA</th>
                                <th>KODE</th>
                                <th>TELP</th>
                                <th>EMAIL</th>
                                <th>AKSI</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $no = 1; 
                                foreach ($perangkatdaerah as $key => $h) {
                            ?>
                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo $h->nama_pd; ?></td>
                                <td><?php echo $h->kode_pd ?></td>
                                <td><?php echo $h->telp; ?></td>
                                <td><?php echo $h->email; ?></td>
                                <td align="center">
                                    <div class="btn-group">
                                        <a href="#" data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><i class="fa fa-cogs"></i> <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="<?php echo site_url('master/perangkatdaerah/edit/'.$h->opd_id) ?>"><i class="fa fa-pencil"> Edit</i></a>
                                            </li>
                                            <li>
                                                <a href="<?php echo site_url('master/perangkatdaerah/delete/'.$h->opd_id) ?>" onclick="return confirm('Apakah anda yakin akan menghapus?')"><i class="fa fa-trash-o"></i> Hapus</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <?php
                                $no++; 
                                } 
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END DEFAULT DATATABLE -->

        </div>
    </div>
</div>