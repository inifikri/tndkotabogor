<style>
table.logo {
	vertical-align:middle;
	color: #000000;
	text-align: center;
}
table.logo td.kop1{	
   	text-transform:capitalize;
	font-size:13px;
	font-weight: bold;
	border-collapse: collapse;
}
table.logo td.kop2{
   	text-transform: uppercase;
	font-size:15px;
	font-weight: bold;
	border-collapse: collapse;
}
table.logo td.kop3{
	text-transform:capitalize;
	font-size:10px;   	
	border-collapse: collapse;
	line-height: 1.2;
}
table.logo td.kop4{
	font-size:2px;   	
	border-collapse: collapse;
}
table.surat-keterangan{
	border-spacing: 0px 5px;
	font-size:10px;
	text-align: center;
	font-weight: bold;
}
table.isi{
	border-spacing: 0px 1px;
	font-size:10px;
}
p { 
	font-size:10px;
	text-align: justify;
	text-justify: inter-word;	
	line-height: 1.3;
}
table.ttd{
	border-spacing: 0px 0px;
	font-size:10px;
}
div.tembusan{ 
	font-size:9px;
	white-space: pre-line;
	text-align: left;
	page-break-after: always;	
}
div.terlampir{ 
	font-size:10px;
	white-space: pre-line;
	text-align:left;
	page-break-before: always;	
}
table.lampiran{
	border-spacing: 0px 0px;
	font-size:10px;
}

</style>

<?php foreach ($perintah as $key => $h) { ?>
<table class="logo" border="0">
	<tr>
		<td width="13%" rowspan="3" align="center"><img src="assets/img/logokbr.png" width="55px"></td>
		<td class="kop1" width="87%">PEMERINTAH KOTA BOGOR</td>
	</tr>
	<tr>
		<td class="kop2"><?php echo strtoupper($h->nama_pd); ?></td>
	</tr>
	<tr>
		<td class="kop3" ><?php echo $h->alamat; ?>, Telp. <?php echo $h->telp; ?><br>
		Website: <?php echo $h->alamat_website; ?>, E-mail: <?php echo $h->email; ?><br>
		B O G O R - 1 6 1 2 1
		</td>
	</tr>	
</table>
<img src="assets/img/line.png" width="650px"><br>
<table class="surat-keterangan" border="0">
	<tr>
		<td>SURAT PERINTAH</td>
	</tr>	
	<tr>
		<td>NOMOR: <?php echo $h->nomor; ?></td>
	</tr>	
</table><br><br><br>



<table class="isi" border="0">	
	<tr>
		<td width="20%">Dasar</td>
		<td width="2%">:</td>
		<td width="78%"><?php echo $h->dasar; ?><br></td>
	</tr>	
	<tr>
		<td width="100%" colspan="3" align="center"><b>MEMERINTAHKAN :</b></td>
	</tr>	
</table><br><br>
	<?php
		$datapegawai =	$this->db->query("
		SELECT * FROM aparatur
		LEFT JOIN jabatan ON aparatur.jabatan_id = jabatan.jabatan_id
		WHERE aparatur.aparatur_id IN ($h->pegawai_id)");//->result_array();
		
		if ($datapegawai->num_rows() > 3) {
		?>
	
<table class="isi" border="0">	
	<tr>
		<td width="20%" colspan="4">Kepada</td>
		<td width="2%">:</td>
		<td width="78%">Terlampir</td>		
	</tr>	
</table><br><br>
<?php
	}else {
?>	
<table class="isi" border="0">	
	<tr>
		<td width="100%" colspan="4">Kepada:</td>
	</tr>
	
	<?php	
	$no = 1;
	foreach ($datapegawai->result() as $key => $p) {
	?>	
	<tr>
		<td width="3%"><?php echo $no; ?></td>
		<td width="20%">Nama</td>
		<td width="2%">:</td>
		<td width="75%"><?php echo $p->nama; ?></td>
	</tr>
	<tr>
		<td width="3%"></td>
		<td width="20%">NIP</td>
		<td width="2%">:</td>
		<td width="75%"><?php echo $p->nip; ?></td>
	</tr>
	<tr>
		<td width="3%"></td>
		<td width="20%">Pangkat/Golongan</td>
		<td width="2%">:</td>
		<td width="75%"><?php echo $p->pangkat; ?> - <?php echo $p->golongan; ?></td>
	</tr>
	<tr>
		<td width="3%"></td>
		<td width="20%">Jabatan</td>
		<td width="2%">:</td>
		<td width="75%"><?php echo $p->nama_jabatan; ?></td>
	</tr>

<?php $no++;  } ?>

</table><br><br>

<?php } ?> 

<table class="isi" border="0">	
	<tr>
		<td width="20%">Untuk</td>
		<td width="2%">:</td>
		<td width="78%"><?php echo $h->untuk; ?></td>
	</tr>		
</table><br><br>


<table class="ttd" border="0">
	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%">Ditetapkan di Bogor</td>
	</tr>	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%">Pada Tanggal <u><?php echo tanggal($h->tanggal) ?> M</u></td>
	</tr>
	<tr>
		<td width="75%" colspan="2"></td>	
		<td width="25%"><?php echo hijriah($h->tanggal); ?><br></td>
	</tr>	
	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%"><b><?php
					if ($h->jabatanpejabat == NULL) {
						echo "NAMA JABATAN";
					}else{
						echo strtoupper($h->jabatanpejabat);
					}
				?>,</b></td>
	</tr>
	<tr>
		<td width="46%"></td>		
		<td width="15%">
		<?php
			if ($h->status == NULL) {
				echo "<br><br>DRAFT<br>"; 
			}			
			else if ($h->status == 'Belum Ditandatangani') {
				echo "<br><br>DRAFT"; 
			}else{
				?><img src="assets/qrcodes/<?php echo $h->id; ?>.png" width="53px">
			<?php }
		?>
		</td>
		<td width="39%">
		<?php
			if ($h->status == NULL) {
				echo "<br><br>DRAFT<br>"; 
			}			 
			else if ($h->status == 'Belum Ditandatangani') {
				echo "<br><br>BELUM DITANDATANGANI<br>";
			}else{
				?><img src="assets/img/ttd_digital.png" width="53px">
			<?php }
		?>			
		</td>
	</tr>
	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%"><u><b><?php 
					if ($h->namapejabat == NULL) {
						echo "NAMA JELAS DAN GELAR";
					}else{
						echo strtoupper($h->namapejabat);
					}
				?></b></u>
		</td>
	</tr>	
	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%"><?php 
				if (empty($h->pangkatpejabat)) {
				 	echo "Pangkat";
				 }else{
				 	echo $h->pangkatpejabat;
				 }
			?></td>
	</tr>	
	<tr>
		<td width="61%" colspan="2"></td>		
		<td width="39%">NIP. <?php echo $h->nippejabat; ?></td>
	</tr>	
</table>

<?php
	if ($datapegawai->num_rows() > 3) { ?>
	<div class="terlampir">	
<b>LAMPIRAN SURAT PERINTAH:</b><br><br>
<table border="0">	
	<tr>
		<td width="10%">NOMOR</td>
		<td width="2%">:</td>
		<td width="85%"><?php echo $h->nomor; ?></td>
	</tr>
	<tr>
		<td width="10%">TANGGAL</td>
		<td width="2%">:</td>
		<td width="85%"><?php echo tanggal($h->tanggal); ?></td>
	</tr>
</table><br><br>

<table class="lampiran" border="1">	
<?php
	$no = 1;
	foreach ($datapegawai->result() as $key => $p) {
	?>	
	<tr>
		<td width="5%" align="center"><?php echo $no; ?></td>
		<td width="20%">Nama</td>
		<td width="2%">:</td>
		<td width="73%"><?php echo $p->nama; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="20%">NIP</td>
		<td width="2%">:</td>
		<td width="73%"><?php echo $p->nip; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="20%">Pangkat/Golongan</td>
		<td width="2%">:</td>
		<td width="73%"><?php echo $p->pangkat; ?> - <?php echo $p->golongan; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="20%">Jabatan</td>
		<td width="2%">:</td>
		<td width="73%"><?php echo $p->nama_jabatan; ?></td>
	</tr>

<?php $no++;  } ?>

</table><br><br>

<?php } ?> 
</div>



<?php  } ?>