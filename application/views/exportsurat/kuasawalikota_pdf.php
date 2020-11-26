<?php foreach ($kuasa as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

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
      <p>
        Bogor, <?php echo tanggal($h->tanggal); ?><br>
        Yang memberi Kuasa<br>
        <b>Walikota Bogor,</b>
        <br> <br> <br> <br> <br>
        <b>
          <?php 
            if ($h->nama == NULL) {
              echo "Nama Jelas dan Gelar";
            }else{
              echo $h->nama;
            }
          ?>
        </b><br>
      </p>
    </td>

  </tr>
</table>
      
<?php } ?>