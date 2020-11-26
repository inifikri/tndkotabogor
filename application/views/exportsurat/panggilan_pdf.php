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
	font-size:9px;
	white-space: pre-line;
	text-align:left;
	page-break-before: always;	
}

</style>

<?php foreach ($perjalanan as $key => $h) { ?>
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

<table class="nomor-surat" border="1">
	<tr>
		<td width="10%"></td>
		<td width="2%"></td>
		<td width="50%"></td>
		<td width="38%" colspan="3">Bogor, <u><?php echo tanggal($h->tanggal) ?> M</u></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td width="7%"></td>
		<td width="31%"><?php echo hijriah($h->tanggal); ?><br><br></td>
	</tr>	
	<tr>
		<td>Nomor</td>
		<td>:</td>
		<td><?php echo $h->nomor; ?></td>
		<td colspan="2">Kepada:</td>
	</tr>
	<tr>
		<td>Sifat</td>
		<td>:</td>
		<td><?php echo $h->sifat; ?></td>
		<td width="5%">Yth.</td>
		<td width="33%" rowspan="2">
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
		<td>Lampiran</td>
		<td>:</td>
		<td><?php echo $h->lampiran; ?></td>
		<td></td>
	</tr>	
	<tr>
		<td>Hal</td>
		<td>:</td>
		<td><?php echo $h->hal; ?></td>
		<td></td>
		<td>di</td>
	</tr>	
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td width="5%"></td>
		<td width="2%"></td>
		<td width="31%">Bogor</td>
	</tr>	
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td width="7%"></td>
		<td width="31%"></td>
	</tr>		
</table><br><br>

<table class="isi-surat" border="1">
	<tr>
		<td width="12%"></td>
		<td width="87%" colspan="4"><?php echo $h->p1; ?></td>
	</tr>
</table>
<table class="jadwal" border="1">	
	<tr>
		<td width="12%"></td>
		<td width="5%"></td>
		<td width="10%">Hari</td>
		<td width="2%">:</td>
		<td width="70%"><?php echo $h->hari; ?></td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="5%"></td>
		<td width="10%">Tanggal</td>
		<td width="2%">:</td>
		<td width="70%"><?php echo $h->tgl_acara; ?></td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="5%"></td>
		<td width="10%">Pukul</td>
		<td width="2%">:</td>
		<td width="70%"><?php echo $h->pukul; ?></td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="5%"></td>
		<td width="10%">Tempat</td>
		<td width="2%">:</td>
		<td width="70%"><?php echo $h->tempat; ?></td>
	</tr>
	<tr>
		<td width="12%"></td>
		<td width="5%"></td>
		<td width="10%">Acara</td>
		<td width="2%">:</td>
		<td width="70%"><?php echo $h->acara; ?></td>
	</tr>	
</table>
<table class="isi-surat" border="1">		
	<tr>
		<td width="12%"></td>
		<td width="87%" colspan="4"><?php echo $h->p2; ?></td>
	</tr>
</table>
<br><br>
<table class="lampiran" border="0">
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
	if ($kepada->num_rows() > 1) { ?>
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