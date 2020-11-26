<?php foreach ($instruksi as $key => $h) { ?>

<br><br><br><br><br><br><br><br><br><br><br><br>

<p align="center">
	<b>INSTRUKSI WALIKOTA BOGOR<br>
	NOMOR........................................ TAHUN........................................<br>
	TENTANG<br>
	<?php echo $h->tentang;?></b>
</p> 

<p align="center"><b>WALIKOTA BOGOR,</b></p>

<p><?php echo $h->isi;?></p>

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
			pada tanggal
			<?php echo tanggal($h->tanggal); ?> <br>
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