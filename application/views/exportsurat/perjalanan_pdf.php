<?php  foreach ($perjalanan as $key => $h) { ?>

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

<table width="100%" align="center">
	<tr>
		<td><b><U><br>SURAT PERJALANAN DINAS</U></b></td>
	</tr>
	<tr>
		<td><b>Nomor : <?php echo $h->nomor; ?><br></b></td>
	</tr>
</table>
<table width="100%" border="1" style="font-size: 11">
	<tr>
		<td align="center" width="25">1.</td>
		<td width="260">  Pengguna Anggaran/Kuasa Pengguna Anggaran</td>
		<td width="260"> : <?php echo $h->nama ?></td>
	</tr>
	<?php  
		$get = $this->db->query("SELECT * FROM aparatur JOIN jabatan ON jabatan.jabatan_id = aparatur.jabatan_id WHERE nip = ".$h->nip_id)->row_array();
	?>
	<tr>
		<td align="center" width="25">2.</td>
		<td width="260">  Nama/NIP Pegawai yang melaksanakan Perjalanan Dinas</td>
		<td width="260">
			 : <?php echo $get['nama'] ?> <br>
			    <u>NIP. <?php echo $get['nip']; ?></u>
		</td>
	</tr>
	<tr>
		<td align="center" width="25">3.</td>
		<td width="260">
			  a. Pangkat dan Golongan <br>
			  b. Jabatan <br>
			  c. Tingkat Biaya Perjalanan Dinas
		</td>
		<td width="260">
			<b> a. <?php echo $get['pangkat'].' '.$get['golongan']; ?> </b> <br>
			<b> b. <?php echo $get['nama_jabatan']; ?> </b> <br>
			<b> c. <?php echo $h->tingkat_biaya; ?> </b>
		</td>
	</tr>
	<tr>
		<td align="center" width="25">4.</td>
		<td width="260">  Maksud Perjalanan Dinas</td>
		<td width="260"> : <?php echo $h->maksud_perjalanan ?></td>
	</tr>
	<tr>
		<td align="center" width="25">5.</td>
		<td width="260">  Alat angkutan yang dipergunakan</td>
		<td width="260"> : <?php echo $h->alat_angkutan ?></td>
	</tr>
	<tr>
		<td align="center" width="25">6.</td>
		<td width="260">
			  a. Tempat berangkat <br>
			  b. Tempat tujuan 
		</td>
		<td width="260">
			  a. <?php echo $h->tmpt_berangkat; ?> <br>
			  b. <?php echo $h->tmpt_tujuan; ?> <br>
		</td>
	</tr>
	<tr>
		<td align="center" width="25">7</td>
		<td width="260">
			  a. Lamanya Perjalanan Dinas <br>
			  b. Tanggal berangkat <br>
			  c. Tanggal harus kembali/Tiba di tempat baru *)
		</td>
		<td width="260">
			  a. <?php echo $h->lama_perjalanan; ?><br>
			  b. <?php echo tanggal($h->tgl_berangkat); ?><br>
			  c. <?php echo tanggal($h->tgl_pulang); ?>
		</td>
	</tr>
	<tr>
		<td align="center" width="25">8.*)</td>
		<td width="260">  Pengikut : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nama</td>
		<td align="center" width="130">Tangal Lahir</td>
		<td align="center" width="130">Keterangan</td>
	</tr>
	<tr>
		<td><br><br><br><br><br></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center" width="25">9.</td>
		<td width="260">
			  <u>Pembebanan anggaran</u> <br>
			  a. SKPD <br>
			  b. Kegiatan <br>
			  c. Akun
		</td>
		<td width="260">
			  a. <?php echo $h->nama_pd; ?><br>
			  b. <?php echo $h->kegiatan; ?> <br>
			  c. <?php echo $h->akun; ?>
		</td>
	</tr>
	<tr>
		<td align="center" width="25">10.</td>
		<td width="260">  Keterangan lain - lain</td>
		<td width="260"> ---</td>
	</tr>
</table>

<table>
	<tr>
		<td><b>*):Coret yang tidak perlu</b></td>
	</tr>
</table>

<table>
	<tr>
		<td width="400px" align="right">
			<?php 
				$cekTTD = $this->db->get_where('penandatangan', array('surat_id' => $h->id))->row_array();
				if ($cekTTD['status'] == 'Sudah Ditandatangani' OR $h->verifikasi_id == '-1') { 
			?>
				<br><br><br><img src="<?php echo base_url('assets/img/ttde.png') ?>" width="50">
			<?php } ?>
		</td>
		<td>
			Di Bogor, <?php echo tanggal($h->tanggal); ?><br>
			<b>Pengguna Anggaran,</b>
			<br><br><br><br><br><br>
			<u><?php
				if (empty($h->nama)) {
					echo "Nama Jelas dan Gelar";
				}else{
					echo $h->nama;
				}
			?></u><br>
			<?php 
				if (empty($h->pangkat)) {
					echo "Pangkat";
				}else{
					echo $h->pangkat;
				}
			?><br>
			NIP. <?php echo $h->nip; ?><br> 
		</td>
	</tr>
</table>

<br><br><br><br>

<table width="100%" border="1" style="font-size: 11">
	<tr>
		<td></td>
		<td>
			  I. Berangkat dari : Bogor <br>
			  &nbsp;&nbsp;&nbsp;(Tempat Kedudukan) <br>
			  &nbsp;&nbsp;&nbsp;Ke : <?php echo $h->tmpt_berangkat; ?> <br>
			  &nbsp;&nbsp;&nbsp;<i>Pada tanggal : <?php echo tanggal($h->tanggal); ?></i>
			<hr>
			<p align="center" style="font-weight: bold;">
				Pengguna Anggaran
				<br><br><br><br>
				<i><u>(<?php 
					if (empty($h->nama)) {
						echo "Nama Jelas dan Gelar";
					}else{
						echo $h->nama;
					}
				 ?>)</u></i><br>
				<?php 
					if (empty($h->pangkat)) {
						echo "Pangkat";
					}else{
						echo $h->pangkat;
					}
				?><br>
				NIP. <?php echo $h->nip; ?>
			</p>
		</td>
	</tr>
	<tr>
		<td>
			   II. Tiba di : <?php echo $h->tmpt_tujuan; ?> <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal : <?php echo tanggal($h->tanggal); ?> <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Kepala : <br><br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
		<td>
			   &nbsp;&nbsp;&nbsp;&nbsp;Berangkat dari :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;(Tempat Kedudukan) <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Ke : <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal : <?php echo tanggal($h->tanggal); ?> <br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
	</tr>
	<tr>
		<td>
			   III. Tiba di : <?php echo $h->tmpt_tujuan; ?> <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Kepala : <br><br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
		<td>
			   &nbsp;&nbsp;&nbsp;&nbsp;Berangkat dari :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;(Tempat Kedudukan) <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Ke : <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
	</tr>
	<tr>
		<td>
			   IV. Tiba di :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Kepala : <br><br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
		<td>
			   &nbsp;&nbsp;&nbsp;&nbsp;Berangkat dari :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;(Tempat Kedudukan) <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Ke : <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
	</tr>
	<tr>
		<td>
			   V. Tiba di :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Kepala : <br><br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
		<td>
			   &nbsp;&nbsp;&nbsp;&nbsp;Berangkat dari :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;(Tempat Kedudukan) <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Ke : <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;<b>(..................................................................)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;NIP.
		</td>
	</tr>
	<tr>
		<td>
			   VI. Tiba di :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pada tanggal :  <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kepala : <br>
			   <b>Pengguna Anggaran/Kuasa Pengguna Anggaran</b> <br><br><br><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>(<?php
				   		if (empty($h->nama)) {
				   			echo "Nama Jelas dan Gelar";
				   		}else{
				   			echo $h->nama;
				   		}
				   	?>)</b><br>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <?php
			   	if (empty($h->pangkat)) {
			   	 	echo "    Pangkat";
			   	 }else{
			   	 	echo $h->pangkat;
			   	 }
			   ?> <br>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NIP. <?php echo $h->nip; ?>
		</td>
		<td>
			   &nbsp;Telah diperiksa dengan keteragan bahwa <br>
			   &nbsp;perjalanan tersebut atas perintahnya dan <br>
			   &nbsp;semata-mata untuk kepentingan jabatan dalam <br>
			   &nbsp;waktu sesingkat-singkatnya <br>
			   <b style="text-align: center;">
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengguna Anggaran
				   <br><br><br>
				   <i><u>(<?php
				   		if (empty($h->nama)) {
				   			echo "Nama Jelas dan Gelar";
				   		}else{
				   			echo $h->nama;
				   		}
				   	?>)</u></i><br>
				   <?php
				   	if (empty($h->pangkat)) {
				   	 	echo "    Pangkat";
				   	 }else{
				   	 	echo $h->pangkat;
				   	 }
				   ?><br>
				   NIP. <?php echo $h->nip; ?>
			   </b>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;VII. Catatan Lain-lain
		</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;VIII. Perhatian : <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengguna Anggaran/Kuasa Pengguna Anggaran yang menerbitkan SPD, Pegawai yang <br> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;melakukan perjalanan dinas, para pejabat yang mengesahkan tanggal berangkat/tiba, serta <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bendahara Pengeluaran bertanggung jawab berdasarkan peraturan perundang-undangan <br>  
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tentang keuangan Daerah, apabila Pemerintah Daerah Kota Bogor menderita rugi akibat <br>  
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kesalahan, kelalaian dan kealpaannya.
		</td>
	</tr>
</table>
<br><br><br><br><br><br><br><br>
<table>
	<tr>
		<td colspan="3" style="font-weight: bold; text-align: center; font-size: 15px;">RINCIAN BIAYA PERJALANAN DINAS <br></td>
	</tr>
	<tr>
		<td width="25%">Lampiran SPD Nomor</td>
		<td width="5%">:</td>
		<td width="70%"><?php echo $h->nomor; ?></td>
	</tr>
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><?php echo tanggal($h->tanggal); ?><br></td>
	</tr>
</table>

<table border="1">
	<tr>
		<td width="5%"> No </td>
		<td width="45%"> Perincian Biaya </td>
		<td> Jumlah </td>
		<td> Keterangan </td>
	</tr>
	<tr>
		<td> 1. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
	    <td> 2. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>	
	<tr>
		<td> 3. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> 4. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> 5. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> 6. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> 7. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> 8. </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td> </td>
		<td> Jumlah </td>
		<td> Rp. </td>
		<td></td>
	</tr>
	<tr>
		<td> </td>
		<td colspan="3"> Terbilang :  ........................................................................ </td>
	</tr>				
</table>

<table width="100%">
	<tr><td colspan="3"></td></tr>
	<tr>
		<td width="45%">
			  Telah dibayar sejumlah<br> 
			Rp.................. <br> 
			Bendahara Pengeluaran, <br><br><br><br><br><br> 
			(.....................) <br> 
			Pangkat <br> 
			NIP
		</td>
        <td width="55%">
        	...................., tanggal,bulan,tahun<br> 
        	Tetap menerima jumlah uang sebesar<br> 
        	Rp...................<br> 
        	Yang Menerima,<br><br><br><br><br><br>
        	(......................)<br> 
        	Pangkat <br>
        	NIP
        </td>
  	</tr>
  	<tr><td colspan="3"><hr></td></tr>
</table>

<table>
  <tr><td colspan="3" style="text-align: center;">Perhitungan SPD Rampung</td></tr>
  <tr>
  	<td width="30%">Ditetapkan sejumlah </td>
  	<td width="2%">:</td>
  	<td width="68%">RP..................</td>
  </tr>
  <tr>
  	 <td>Yang telah diabayar semula</td>
  	 <td>:</td>
  	 <td>Rp...................</td>
  </tr>
  <tr>
  	<td>Sisa kurang/lebih</td>
  	<td>:</td>
  	<td>Rp...................<br></td>
  </tr>
  <tr> 	
  	<td></td>
  	<td></td>
     <td> 
     	<b>Pengguna Anggaran/Kuasa Pengguna Anggaran</b>
     	<br><br><br><br> (
     		<?php
     			if (empty($h->nama)) {
     			 	echo "    Nama Jelas dan Gelar";
     			 }else{
     			 	echo $h->nama;
     			 }
     		?>
     	)
     	<br>
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