<?php foreach ($pengumuman as $key => $h) { ?>

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

<br><br><br><br>

<table style="font-weight: bold; text-align: center;">
	<tr>
		<td>PENGUMUMAN <br></td>
	</tr>
	<tr>
		<td>NOMOR : <?php echo $h->nomor ?> <br></td>
	</tr>
	<tr>
		<td>TENTANG</td>
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
		<td width="300px" align="right">
			<?php 
				$cekTTD = $this->db->get_where('penandatangan', array('surat_id' => $h->id))->row_array();
				if ($cekTTD['status'] == 'Sudah Ditandatangani' OR $h->verifikasi_id == '-1') { 
			?>
				<br><br><br><br><br><img src="<?php echo base_url('assets/img/ttde.png') ?>" width="50">
			<?php } ?>
		</td>
		<td>
			Ditetapkan di Bogor<br>
			Pada tanggal <?php echo tanggal($h->tanggal); ?><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo hijriah($h->tanggal); ?><br>
			<b>
				<?php
					if ($h->jabatan == NULL) {
						echo "Nama Jabatan";
					}else{
						echo $h->jabatan;
					}
				?>,
			</b>
			<br><br><br><br><br><br>
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
				 	echo "    Pangkat";
				 }else{
				 	echo $h->pangkat;
				 }
			?><br>
			    NIP. <?php echo $h->nip; ?><br>
		</td>
	</tr>
</table>

<?php } ?>