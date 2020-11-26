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
	font-size:11px;
	text-align: center;
	font-weight: bold;
}
table.isi{
	border-spacing: 0px 1px;
	font-size:11px;
}
p { 
	font-size:11px;
	text-align: justify;
	text-justify: inter-word;	
	text-indent: 28px;
	line-height: 1.3;
}
table.ttd{
	border-spacing: 0px 0px;
	font-size:11px;
}
div.tembusan{ 
	font-size:9px;
	white-space: pre-line;
	text-align: left;
	page-break-after: always;	
}

</style>
<?php foreach ($melaksanakantugas as $key => $h) { ?>
<table class="logo" border="0">
	<tr>
		<td align="center"><img src="assets/img/logogarudaemas.png" width="70px"></td>
	</tr>
	<tr>
		<td class="kop2" align="center">WALIKOTA BOGOR</td>
	</tr>	
	</tr>	
</table>
<br><br><br>
<table class="surat-keterangan" border="0">
	<tr>
		<td>SURAT PERNYATAAN MELAKSANAKAN TUGAS</td>
	</tr>	
	<tr>
		<td>NOMOR: <?php echo $h->nomor; ?></td>
	</tr>	
</table><br><br><br>

<table class="isi" border="0">	
	<tr>
		<td width="100%" colspan="4">Yang bertandatangan di bawah ini:<br></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="21%">Nama</td>
		<td width="2%">:</td>
		<td width="72%">
		<?php
		if ($h->namapejabat == NULL) {
			echo "Nama Penandatangan";
		}else{
			echo $h->namapejabat;
		}
		?>		
		</td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="21%">NIP</td>
		<td width="2%">:</td>
		<td width="72%">
		<?php
		if ($h->nippejabat == NULL) {
			echo "NIP Penandatangan";
		}else{
			echo $h->nippejabat;
		}
		?>		
		</td>
	</tr>	
	<tr>
		<td width="5%"></td>
		<td width="21%">Pangkat/Golongan</td>
		<td width="2%">:</td>
		<td width="72%">
		<?php
		if ($h->pangkatpejabat == NULL) {
			echo "Pangkat/Golongan Penandatangan";
		}else{
			echo $h->pangkatpejabat; echo $h->golonganpejabat;
		}
		?>		
		</td>
	</tr>		
	<tr>
		<td width="5%"></td>
		<td width="21%">Jabatan</td>
		<td width="2%">:</td>
		<td width="72%">
		<?php
		if ($h->namajabatanpejabat == NULL) {
			echo "Jabatan Penandatangan";
		}else{
			echo $h->namajabatanpejabat;
		}
		?>
		<br></td>
	</tr>
	<tr>
		<td width="100%" colspan="4">dengan ini menerangkan dengan sesungguhnya bahwa:<br></td>
	</tr>	
	<tr>
		<td width="5%"></td>
		<td width="21%">Nama</td>
		<td width="2%">:</td>
		<td width="72%"><?php echo $h->namapegawai; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="21%">NIP</td>
		<td width="2%">:</td>
		<td width="72%"><?php echo $h->nippegawai; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="21%">Pangkat/ Golongan</td>
		<td width="2%">:</td>
		<td width="72%"><?php echo $h->pangkatpegawai; ?> - <?php echo $h->golonganpegawai; ?></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="21%">Jabatan</td>
		<td width="2%">:</td>
		<td width="72%"><?php echo $h->jabatanpegawai; ?><br></td>
	</tr>
	<tr>
		<td width="100%" colspan="4">
<p>Yang diangkat berdasarkan <?php echo $h->dasarsk; ?>, Nomor <?php echo $h->nomorsk; ?>, terhitung tanggal: <?php echo $h->tmt; ?>, telah nyata menjalankan tugas sebagai <?php echo $h->tugas; ?>di <?php echo $h->nama_pd; ?>.</p>
<p>Demikian surat keterangan melaksanakan tugas  ini saya buat dengan sesungguhnya  dengan mengingat sumpah jabatan dan apabila di kemudian hari  isi surat pernyataan ini  ternyata tidak benar yang berakibat kerugian bagi negara, maka  saya bersedia menanggung kerugian tersebut.</p>
</td>
	</tr>	
</table><br><br><br>

<table class="ttd" border="0">
	<tr>
		<td width="61%" colspan="2"></td>	
		<td width="39%">Bogor, <u><?php echo tanggal($h->tanggal) ?> M</u></td>
	</tr>
	<tr>
		<td width="67%" colspan="2"></td>	
		<td width="33%"><?php echo hijriah($h->tanggal); ?><br></td>
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
<?php  } ?>