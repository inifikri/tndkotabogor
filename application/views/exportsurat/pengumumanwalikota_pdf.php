<?php foreach ($pengumuman as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

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
				<br><br><br><img src="<?php echo base_url('assets/img/ttde.png') ?>" width="50">
			<?php } ?>
		</td>
		<td>
			Ditetapkan di Bogor<br>
			Pada tanggal <?php echo tanggal($h->tanggal); ?><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo hijriah($h->tanggal); ?><br>
			<b>Walikota Bogor,</b>
			<br><br><br><br><br><br>
			<b>
				<?php 
					if ($h->jabatan == NULL) {
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