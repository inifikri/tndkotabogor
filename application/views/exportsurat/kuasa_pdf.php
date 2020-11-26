<?php foreach ($kuasa as $key => $h) { ?>

<table width="100%" style="margin-top: -15px;">
  <tr>
    <td rowspan="3" width="65px"><img src="assets/img/logokbr.png" width="60px" style="margin-top: -50px;" /></td>
    <td align="center" style="font-family: TIMES NEW ROWMAN;" width="auto">
      <p style="font-size: 12; font-weight: bold;"> PEMERINTAH KOTA BOGOR </p>
    </td>
  </tr>
  <tr align="center">
    <td>
      <p style="text-transform: uppercase; font-size: 13,5; font-weight: bold; margin-top: 7px;"><?php echo $h->nama_pd; ?></p>
    </td>
  </tr>
  <tr align="center">
    <td>
      <p style="font-size: 10; margin-top: -6px;"> 
        <?php echo $h->alamat; ?> Telp. <?php echo $h->telp; ?> <br>
        Website : <u style="color: blue;"> <?php echo $h->alamat_website; ?> </u> Email : <u style="color: blue;"> <?php echo $h->email; ?> </u> <br>
        <b style="font-size: 12;"> KOTA BOGOR </b>
      </p>
    </td>
  </tr>
</table>

<hr style="margin-top: -15px;">
<hr style="margin-top: -15px;">
<hr style="margin-top: -15px;">
<hr style="margin-top: -15px;">
<hr style="margin-top: -15px;">
<hr style="margin-top: -10px;">

<table style="text-align: center;">
  <tr>
    <td>
      <br>
      <br>
      <h3 align="center">SURAT KUASA</h3>
      <h3 align="center">Nomor <?php echo $h->nomor; ?></h3>
      <br>
    </td>
  </tr>
</table>

<table>
  <?php  
    $get = $this->db->query("SELECT * FROM aparatur JOIN jabatan ON jabatan.jabatan_id = aparatur.jabatan_id WHERE nip = ".$h->nip_id)->row_array();
  ?>
  <tr>
    <td colspan="3">Yang Bertanda tangan dibawah ini : </td>
  </tr>
  <tr>
     <td width="20%">a. Nama</td>
     <td width="5%">:</td>
     <td width="75%">
      <?php 
        if ($h->nama == NULL) {
          echo "Nama Jelas dan Gelar";
        }else{
          echo $h->nama;
        }
      ?>
     </td>
  </tr>
  <tr>
     <td>b. Jabatan</td>
     <td>:</td>
     <td>
      <?php
        if ($h->jabatan == NULL) {
          echo "Nama Jabatan";
        }else{
          echo $h->jabatan;
        }
      ?>
     </td>
  </tr>
  <tr>
    <td colspan="3"><h4 align="center"><br>Memberi Kuasa<br></h4></td>
  </tr>
  <tr><td colspan="3">Kepada :</td></tr>
  <tr>
   <td>a. Nama</td>
   <td>:</td>
   <td><?php echo $get['nama']; ?></td>
  </tr>
  <tr>
    <td>b. Jabatan</td>
    <td>:</td>
    <td><?php echo $get['nama_jabatan']; ?></td>
  </tr>
  <tr>
    <td>c. NIP</td>
    <td>:</td>
    <td><?php echo $h->nip_id;?></td>
  </tr>
  <tr>
    <td>Untuk</td>
    <td>:</td>
    <td></td>
  </tr>
  <tr>
    <td colspan="3"><?php echo $h->isi; ?></td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <p>
        Yang diberi kuasa<br>
        <b><?php echo $get['nama_jabatan']; ?>,</b>
        <br> <br> <br> <br> <br>
        <?php echo $get['nama']; ?><br>
        <?php
          if (empty($get['pangkat'])) {
            echo "Pangkat";
           }else{
            echo $get['pangkat'];
           }  
        ?><br>
        NIP. <?php echo $get['nip']; ?>
      </p>
    </td>

    <td>
      
      <br><br><br>
      <b>
        <?php
          if ($h->jabatan == NULL) {
            echo "Nama Jabatan";
          }else{
            echo $h->jabatan;
          }
        ?>,
      </b>
        <?php 
          $cekTTD = $this->db->get_where('penandatangan', array('surat_id' => $h->id))->row_array();
          if ($cekTTD['status'] == 'Sudah Ditandatangani' OR $h->verifikasi_id == '-1') { 
        ?>
          <br><br><img src="<?php echo base_url('assets/img/ttde.png') ?>" width="50"><br>
        <?php }else{ ?>
          <br><br><br><br><br><br>
        <?php } ?>
      <b>
        <?php 
          if ($h->nama == NULL) {
            echo "Nama Jelas dan Gelar";
          }else{
            echo $h->nama;
          }
        ?>
      </b><br>
      <?php 
        if (empty($h->pangkat)) {
          echo "&nbsp;&nbsp;Pangkat";
         }else{
          echo $h->pangkat;
         }
      ?><br>
          &nbsp;&nbsp;NIP. <?php echo $h->nip; ?><br> 
    </td>

  </tr>
</table>
      
<?php } ?>