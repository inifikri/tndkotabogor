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

table.nomor-surat{
	border-spacing: 0px 0px;
	font-size:10px;
}

table.isi-surat{
	border-spacing: 0px 4px;
	font-size:10px;
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
table.lampiran{
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
	text-align: left;
	page-break-before: always;
}

</style>

<?php foreach ($instruksi as $key => $h) { ?>
<table class="logo" border="0">
	<tr>
		<td align="center"><img src="assets/img/logogarudaemas.png" width="70px"></td>
	</tr>
	<tr>
		<td class="kop2" align="center">WALIKOTA BOGOR</td>
	</tr><br>	
	<tr>
		<td align="center">INTRUKSI WALIKOTA</td>
	</tr>	
	<tr>
		<td align="center">NOMOR <?= $h->nomor; ?></td>
	</tr>	
	<tr>
		<td align="center">TENTANG</td>
	</tr>	
	<tr>
		<td align="center"><?= $h->tentang; ?></td>
	</tr>	
	<tr>
		<td align="center">WALI KOTA BOGOR,</td>
	</tr>	
	</tr>	
</table>
<br><br><br>
<table class="nomor-surat" border="0">	
	<tr>
		<td>Dalam rangka</td>
	</tr>
	<tr>
	<td>dengan ini menginstruksikan :</td>
	</tr>
	<tr>
		<td width="10%">Kepada</td>
		<td width="2%">:</td>
		<td width="88%">
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
		<td width="100%">Untuk :</td>
	</tr>	
</table><br>

<br><br>
<table class="lampiran" border="0">
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%">Ditetapkan di Bogor</td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="19%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="38%">pada tanggal <?= $h->tanggal; ?></td>
	</tr>
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
				?>,</b></td>
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
				?></b></u></td>
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
<table border="0" align="center">
	<tr>
		<td class="kop3" >Jl. Ir. H. Juanda No.10 Kota Bogor - 16121</td>
	</tr>
	<tr>
	<td>Telp. (0251) 8321075 Fax.(0251) 8326530</td>
	</tr>
	<tr>
	<td>Situs Web <?php echo $h->alamat_website; ?></td>
	</tr>
</table>

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
		<td width="85%"><?php echo $h->hal; ?></td>
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