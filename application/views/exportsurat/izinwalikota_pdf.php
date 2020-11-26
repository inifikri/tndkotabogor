<?php foreach ($izin as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

<table style="font-weight: bold; text-align: center;">
	<tr>
		<td>SURAT IZIN <br></td>
	</tr>
	<tr>
		<td>Nomor <?php echo $h->nomor ?> <br></td>
	</tr>
	<tr>
		<td>Tentang</td>
	</tr>
	<tr>
		<td><?php echo $h->tentang ?></td>
	</tr>
</table>

<p>
	<?php echo $h->isi; ?>
</p>

<table>
	<tr>
		<td colspan="3" align="center">Memberi Izin : <br></td>
	</tr>
	<tr>
		<td width="10%">Kepada</td>
		<td width="5%">:</td>
		<td width="85%">&nbsp;&nbsp;</td>
	</tr>
	<?php  
		$get = $this->db->query("SELECT * FROM aparatur JOIN jabatan ON jabatan.jabatan_id = aparatur.jabatan_id WHERE nip = ".$h->nip_id)->row_array();
	?>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td>&nbsp;&nbsp;<?php echo $get['nama']; ?></td>
	</tr>
	<tr>
		<td>Jabatan</td>
		<td>:</td>
		<td>&nbsp;&nbsp;<?php echo $get['nama_jabatan']; ?></td>
	</tr>
	<tr>
		<td>Alamat</td>
		<td>:</td>
		<td>&nbsp;&nbsp;<?php echo $h->almt; ?></td>
	</tr>
	<tr>
		<td>Untuk</td>
		<td>:</td>
		<td>&nbsp;&nbsp;<?php echo $h->untuk; ?><br><br><br><br></td>
	</tr>
</table>

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

 <?php } ?>