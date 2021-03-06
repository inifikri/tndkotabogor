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

table.kepada{
	border-spacing: 0px 0px;
	font-size:10px;
	text-align: left;
}

table.surat-edaran{
	border-spacing: 0px 5px;
	font-size:11px;
	text-align: center;
	font-weight: bold;
}

table.isi-surat{
	border-spacing: 0px 4px;
	font-size:11px;
}

table.jadwal{
	border-spacing: 0px 1px;
	font-size:10px;
}

p { 
	font-size:10px;
	text-align: justify;
	text-justify: inter-word;	
	text-indent: 28px;
	line-height: 1.3;
}
table.ttd{
	border-spacing: 0px 0px;
	font-size:10px;
}
div.tembusan{ 
	font-size:9px;
	white-space: pre-line;
	text-align: justify;:left;
}

div.lampiran{ 
	font-size:10px;
	white-space: pre-line;
	text-align:left;
	page-break-before: always;
}

</style>

<?php foreach ($edaran as $key => $h) { ?>
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

<table class="kepada" border="0">
	<tr>
		<td width="62%"></td>
		<td width="38%" colspan="3">Bogor, <u><?php echo tanggal($h->tanggal) ?> M</u></td>
	</tr>
	<tr>
		<td width="69%"></td>
		<td width="31%"><?php echo hijriah($h->tanggal); ?><br><br></td>
	</tr>	
	<tr>
		<td width="62%"></td>
		<td width="38%" colspan="3">Kepada:</td>
	</tr>
	<tr>
		<td width="62%"></td>
		<td width="5%">Yth.</td>
		<td width="33%">
		<?php
				$this->db->from('disposisi_suratkeluar');
				$this->db->join('jabatan', 'jabatan.jabatan_id = disposisi_suratkeluar.users_id', 'left'); 
				$this->db->join('opd', 'opd.opd_id = jabatan.opd_id', 'left'); 
				$this->db->join('eksternal_keluar', 'eksternal_keluar.id = disposisi_suratkeluar.users_id', 'left'); 
				$this->db->where('disposisi_suratkeluar.surat_id', $h->id);
				$kepada = $this->db->get();
				if ($kepada->num_rows() < 4) {
				$no = 1;
				foreach ($kepada->result() as $key => $k) {
					if (empty($k->nama_pd)){
					   echo $no, '.  ', $k->nama.'<br>';
					   ++$no;
					}else{
					   echo $no, '.  ', $k->nama_pd.'<br>';
					   ++$no;
					}
				}
				}else{
					echo "Terlampir";
				}
			?>
		</td>
	</tr>
	<tr>
		<td width="67%"></td>
		<td width="5%">di</td>
		<td width="28%"></td>
	</tr>	
	<tr>
		<td width="67%"></td>
		<td width="5%"></td>
		<td width="28%">Bogor</td>
	</tr>		
</table><br><br>

<table class="surat-edaran" border="0">
	<tr>
		<td>SURAT EDARAN</td>
	</tr>	
	<tr>
		<td>NOMOR: <?php echo $h->nomor; ?></td>
	</tr>
	<tr>
		<td>TENTANG</td>
	</tr>	
	
	<tr>
		<td><?php echo strtoupper($h->tentang); ?></td>
	</tr>		
</table><br><br>
<table class="isi-surat" border="0">
	<tr>
		<td><?php echo $h->isi; ?></td>
	</tr>
</table>
<br><br>
<table class="ttd" border="0">
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%"><b><?php
					if ($h->jabatanpejabat == NULL) {
						echo "NAMA JABATAN";
					}else{
						echo strtoupper($h->jabatanpejabat);
					}
				?>,</b>
		</td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
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
		<td width="38%">
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
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%"><u><b><?php 
					if ($h->namapejabat == NULL) {
						echo "NAMA JELAS DAN GELAR";
					}else{
						echo strtoupper($h->namapejabat);
					}
				?></b></u>
		</td>
	</tr>	
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%"><?php 
				if (empty($h->pangkat)) {
				 	echo "Pangkat";
				 }else{
				 	echo $h->pangkat;
				 }
			?></td>
	</tr>	
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%">NIP. <?php echo $h->nip; ?></td>
	</tr>	
</table><br><br>
<?php if (!empty($h->tembusan)) { ?>
<div class="tembusan">
<b><u>Tembusan :</u></b><br>
<?php  
	echo str_replace(",",",<br>",$h->tembusan);
 } ?>
</div>

<?php
	if ($kepada->num_rows() > 4) { ?>
<div class="lampiran">	
<b>LAMPIRAN :</b><br><br>
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
	<tr>
		<td width="10%">TENTANG</td>
		<td width="2%">:</td>
		<td width="85%"><?php echo strtoupper($h->tentang); ?></td>
	</tr>
</table><br><br>
<?php	
		$no = 1;
		foreach ($kepada->result() as $key => $k) {
			if (empty($k->nama_pd)){
			   echo $no, '.  ', $k->nama.',<br>';
			   ++$no;
			}else{
			   echo $no, '.  ', $k->nama_pd.',<br>';
			   ++$no;
			}
		}
	}
?>
</div>

<?php  } ?>