<?php foreach ($memo as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

<table>
  <tr>
 	  <td colspan="2" align="center"><strong>M E M O</strong><br><br><br></td>
  </tr>
  <tr>
   	<td align="left" width="10%">Dari</td>
    <td align="left" width="90%">: <?php echo $h->nama_pd; ?> </td>
  </tr>
  <tr>
    <td align="left">Kepada</td>
    <td align="left">: 
      <?php
        $this->db->from('disposisi_suratkeluar');
        $this->db->join('jabatan', 'jabatan.jabatan_id = disposisi_suratkeluar.users_id', 'left'); 
        $this->db->join('opd', 'opd.opd_id = jabatan.opd_id', 'left'); 
        $this->db->join('eksternal_keluar', 'eksternal_keluar.id = disposisi_suratkeluar.users_id', 'left'); 
        $this->db->where('disposisi_suratkeluar.surat_id', $h->id);
        $kepada = $this->db->get();
        if ($kepada->num_rows() <= 1) {
		    if($kepada->row_array()['nama'] == NULL){
                echo $kepada->row_array()['nama_pd'];
            }else{
                echo $kepada->row_array()['nama'];
            }
        }else{
          echo "Terlampir";
        }
      ?>
    </td>
  </tr>
  <tr>
    <td colspan="3"><br><hr><br></td>
  </tr>
  <tr>
    <td>Isi</td>
    <td>: <br><?php echo $h->isi; ?></td>
  </tr>
</table>
  
<br><br><br><br><br><br> 

<table width="100%">
  <tr>
    <td width="300px" align="right">
      <?php 
        $cekTTD = $this->db->get_where('penandatangan', array('surat_id' => $h->id))->row_array();
        if ($cekTTD['status'] == 'Sudah Ditandatangani' OR $h->verifikasi_id == '-1') { 
      ?>
        <br><br><br><img src="<?php echo base_url('assets/img/ttde.png') ?>" width="50">
      <?php } ?>
    </td>
    <td>
      Bogor, <?php echo tanggal($h->tanggal); ?><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo hijriah($h->tanggal); ?><br>
      <b>Walikota Bogor,</b>
      <br><br><br><br><br><br>
      <b>
        <?php 
          if ($h->nama == NULL) {
            echo "Nama Jelas dan Gelar";
          }else{
            echo $h->nama;
          }
        ?>
      </b>
    </td>
  </tr>
</table>

<br><br>

<?php
  if ($kepada->num_rows() > 1) {
    echo "<u>Daftar Lampiran</u> : <br><br>";
    foreach ($kepada->result() as $key => $k) {
      if (empty($k->nama_pd)){
         echo $k->nama.',<br>';
      }else {
         echo $k->nama_pd.',<br>';
      }
    }
  }
?>

<?php } ?>