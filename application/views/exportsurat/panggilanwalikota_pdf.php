<?php foreach ($panggilan as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

<table width="100%">
	<tr>
		<td colspan="2"></td>
		<td>
			Bogor, <?php echo tanggal($h->tanggal) ?> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo hijriah($h->tanggal); ?>
		</td>
	</tr>
	<tr>
		<td width="60">Nomor</td>
		<td colspan="2" width="299"> : <?php echo $h->nomor; ?></td>
		<td>Kepada</td>
	</tr>
	<tr>
		<td>Sifat</td>
		<td colspan="2"> : <?php echo $h->sifat; ?></td>
		<td rowspan="2">
			Yth. 
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
		<td>Lampiran</td>
		<td colspan="2"> : <?php echo $h->lampiran; ?></td>
	</tr>
	<tr>
		<td>Perihal</td>
		<td colspan="2"> : <?php echo $h->hal; ?></td>
		<td>di Bogor</td>
	</tr>
</table>
<br><br>

<?php echo $h->isi; ?>

<br><br><br><br>
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