<?php foreach ($notadinas as $key => $h) { ?>

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

<table width="100%">
	<tr>
		
		<td align="center"><b><br><br>Nota Dinas<br></b></td>
	</tr>
	<tr>
		<td width="60">Kepada</td>
		<td colspan="2" width="344"> : 
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
		<td>Dari</td>
		<td colspan="2"> : <?php echo $h->nama_pd; ?></td>
	
	</tr>
	<tr>
		<td>Tanggal</td>
		<td colspan="2"> : <?php echo tanggal($h->tanggal); ?></td>
	</tr>
	<tr>
		<td>Nomor</td>
		<td colspan="2"> : <?php echo $h->nomor; ?></td>
	
	</tr>
		<tr>
		<td>Sifat</td>
		<td colspan="2"> : <?php echo $h->sifat; ?></td>
	
	</tr>
		<tr>
		<td>Lampiran</td>
		<td colspan="2"> : <?php echo $h->lampiran; ?></td>
	
	</tr>
		<tr>
		<td>Hal</td>
		<td colspan="2"> : <?php echo $h->hal; ?></td>
	
	</tr>
</table>

<br><hr>

<p>
	<?php echo $h->isi; ?>
</p>

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

<?php if (!empty($h->tembusan)) { ?>
	<p><u>Tembusan</u> :</p>
	<?php echo $h->tembusan.'<br><br>'; ?>
<?php } ?>

<?php
	if ($kepada->num_rows() > 1) {
		echo "<u>Daftar Lampiran</u> : <br><br>";
		if (empty($k->nama_pd)){
		   echo $k->nama.',<br>';
		}else {
		   echo $k->nama_pd.',<br>';
		}
	}
?>

<?php } ?>