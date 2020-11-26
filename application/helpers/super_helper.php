<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');

function tanggal($tanggal)
{
	$bulan = array(
		'1' => 'Januari', 
		'Februari', 
		'Maret', 
		'April', 
		'Mei', 
		'Juni', 
		'Juli', 
		'Agustus', 
		'September', 
		'Oktober', 
		'November', 
		'Desember', 
	);

	$pecahkan = explode('-', $tanggal);
	return $pecahkan[2].' '.$bulan[(int)$pecahkan[1]].' '.$pecahkan[0];
}

function hijriah($tanggal)
{
	$array_bulan = array("Muharram", "Safar", "Rabiul Awwal", "Rabiul Akhir",
						 "Jumadil Awwal","Jumadil Akhir", "Rajab", "Sya'ban", 
						 "Ramadhan","Syawwal", "Zulqaidah", "Zulhijjah");
					 
	$date = (int)(substr($tanggal,8,2));
	$month = (int)(substr($tanggal,5,2));
	$year = (int)(substr($tanggal,0,4));

	if (($year > 1582)||(($year == "1582") && ($month > 10))||(($year == "1582") && ($month=="10")&&($date >14))){
		$jd = (int)((1461 * ($year + 4800 + (int)(($month - 14) / 12))) / 4) +
		(int)((367 * ($month - 2 - 12 * ((int)(($month - 14) / 12)))) / 12) -
		(int)((3 * ((int)(($year + 4900 + (int)(($month - 14) / 12)) / 100))) / 4)+
		$date - 32075; 
	}else{
		$jd = 367 * $year - (int)((7 * ($year + 5001 + (int)(($month - 9) / 7))) / 4) +
		(int)((275 * $month) / 9) + $date + 1729777;
	}

	$wd = $jd % 7;
	$l = $jd - 1948440 + 10633;
	$n = (int) (($l - 1) / 10631);
	$l = $l - 10631 * $n + 354;
	$z = ((int)((10985 - $l) / 5316)) * ((int)((50 * $l) / 17719)) + ((int)($l / 5670)) * ((int)((43 * $l) / 15238));
	$l = $l - ((int)((30 - $z) / 15)) * ((int)((17719 * $z) / 50)) - ((int)($z / 16)) * ((int)((15238 * $z) / 43)) + 29;
	$m = (int)((24 * $l) / 709);
	$d = $l - (int)((709 * $m) / 24);
	$y = 30 * $n + $z - 30;

	$g = $m - 1;
	$final = "$d $array_bulan[$g] $y H";

	return $final;
}

function export_data($filename){
	header("Content-type: application/octet-stream");
	header("Content-Disposition: attachment; filename=$filename");
	header("Pragma: no-cache");
	header("Expires: 0");
}

function getTU($opd_id)
{
	$ci =& get_instance();

	$query = $ci->db->query("
		SELECT * FROM aparatur 
		JOIN users ON aparatur.aparatur_id = users.aparatur_id 
		JOIN jabatan ON jabatan.jabatan_id = aparatur.jabatan_id 
		WHERE aparatur.opd_id = '$opd_id' AND users.level_id = 4
		");
	return $query->row_array();
}

function sendOpd()
{
	$ci =& get_instance();
	$sendOpd = "
		SELECT * FROM opd
		JOIN aparatur ON opd.opd_id = aparatur.opd_id
		JOIN users ON aparatur.aparatur_id = users.aparatur_id
		WHERE users.level_id = 4
		ORDER BY nama_pd ASC
	";
	return $ci->db->query($sendOpd)->result();
}

function sendEksternal()
{
	$ci =& get_instance();
	return $ci->db->get('eksternal_keluar')->result();
}

function tampilDataPegawai()
{
	$ci =& get_instance();
	$query = $ci->db->query("
		SELECT * FROM suratkeluar_pegawai 
		LEFT JOIN users ON aparatur.aparatur_id = users.aparatur_id 
		JOIN jabatan ON jabatan.jabatan_id = aparatur.jabatan_id 
		WHERE aparatur.opd_id = '$opd_id' AND users.level_id = 4
		");
	return $query->row_array();
}

function messages()
{
	$ci =& get_instance();
	
	$jabatan_id = $ci->session->userdata('jabatan_id');
	$tahun = $ci->session->userdata('tahun');
	
	$draft = $ci->db->query("
		SELECT *
		FROM draft
		LEFT JOIN aparatur ON aparatur.jabatan_id = draft.dibuat_id
		WHERE LEFT(draft.tanggal, 4) = '$tahun'
		AND draft.verifikasi_id = '$jabatan_id'
		ORDER BY draft.id DESC
	")->num_rows();
	$ttd = $ci->db->get_where('penandatangan', array('jabatan_id' => $jabatan_id, 'status' => 'Belum Ditandatangani'))->num_rows();
	$suratmasuk = $ci->db->get_where('disposisi_suratmasuk', array('status' => 'Belum Selesai', 'aparatur_id' => $jabatan_id))->num_rows();;

	$messages = $draft+$ttd+$suratmasuk;

	return $messages;
}

function messages_draft()
{
	$ci =& get_instance();
	
	$jabatan_id = $ci->session->userdata('jabatan_id');
	$tahun = $ci->session->userdata('tahun');
	
	$draft = $ci->db->query("
		SELECT *
		FROM draft
		LEFT JOIN aparatur ON aparatur.jabatan_id = draft.dibuat_id
		WHERE LEFT(draft.tanggal, 4) = '$tahun'
		AND draft.verifikasi_id = '$jabatan_id'
		ORDER BY draft.id DESC
	")->num_rows();

	return $draft;
}

function messages_ttd()
{
	$ci =& get_instance();
	
	$jabatan_id = $ci->session->userdata('jabatan_id');
	$ttd = $ci->db->get_where('penandatangan', array('jabatan_id' => $jabatan_id, 'status' => 'Belum Ditandatangani'))->num_rows();

	return $ttd;
}

function messages_suratmasuk()
{
	$ci =& get_instance();
	
	$jabatan_id = $ci->session->userdata('jabatan_id');
	$suratmasuk = $ci->db->get_where('disposisi_suratmasuk', array('status' => 'Belum Selesai', 'aparatur_id' => $jabatan_id))->num_rows();

	return $suratmasuk;
}

function internal_eksternal($jenis_surat,$surat_id,$jabatan_id,$eksternal_id)
{
	$ci =& get_instance();

	if (!empty($jabatan_id) AND !empty($eksternal_id)) {
		//internal
		$jabatan_id = implode(',', $jabatan_id);
		$explodeOpd = explode(',', $jabatan_id);
		$dataOpd = array();
		$index = 0;
		foreach ($explodeOpd as $key => $h) {
			$cekOpd = $ci->db->query("SELECT * FROM disposisi_suratkeluar WHERE users_id = '$h' AND surat_id = '$surat_id'")->num_rows();
			if ($cekOpd > 0) {
				$ci->session->set_flashdata('error', 'Terdapat OPD yang sudah dipilih');
				redirect(site_url('suratkeluar/'.$jenis_surat.'/edit/'.$surat_id));
			}else{
				array_push($dataOpd, array(
					'surat_id' => $surat_id, 
					'users_id' => $h,
					));
				$index++;
			}
		}
		$disposisiOpd = $ci->db->insert_batch('disposisi_suratkeluar', $dataOpd);
		//eksternal
		$eksternal_id = implode(',', $eksternal_id);
		$explodeEksternal = explode(',', $eksternal_id);
		$dataEksternal = array();
		$index = 0;
		foreach ($explodeEksternal as $key => $h) {
			$cekOpd = $ci->db->query("SELECT * FROM disposisi_suratkeluar WHERE users_id = '$h' AND surat_id = '$surat_id'")->num_rows();
			if ($cekOpd > 0) {
				$ci->session->set_flashdata('error', 'Terdapat Eksternal yang sudah dipilih');
				redirect(site_url('suratkeluar/'.$jenis_surat.'/edit/'.$surat_id));
			}else{
				array_push($dataEksternal, array(
					'surat_id' => $surat_id, 
					'users_id' => $h,
					));
				$index++;
			}
		}
		$disposisiEksternal = $ci->db->insert_batch('disposisi_suratkeluar', $dataEksternal);
	}elseif (!empty($jabatan_id)) {
		//internal
		$jabatan_id = implode(',', $jabatan_id);
		$explodeOpd = explode(',', $jabatan_id);
		$dataOpd = array();
		$index = 0;
		foreach ($explodeOpd as $key => $h) {
			$cekOpd = $ci->db->query("SELECT * FROM disposisi_suratkeluar WHERE users_id = '$h' AND surat_id = '$surat_id'")->num_rows();
			if ($cekOpd > 0) {
				$ci->session->set_flashdata('error', 'Terdapat OPD yang sudah dipilih');
				redirect(site_url('suratkeluar/'.$jenis_surat.'/edit/'.$surat_id));
			}else{
				array_push($dataOpd, array(
					'surat_id' => $surat_id, 
					'users_id' => $h,
					));
				$index++;
			}
		}
		$disposisiOpd = $ci->db->insert_batch('disposisi_suratkeluar', $dataOpd);
	}elseif(!empty($eksternal_id)) {
		//eksternal
		$eksternal_id = implode(',', $eksternal_id);
		$explodeEksternal = explode(',', $eksternal_id);
		$dataEksternal = array();
		$index = 0;
		foreach ($explodeEksternal as $key => $h) {
			$cekOpd = $ci->db->query("SELECT * FROM disposisi_suratkeluar WHERE users_id = '$h' AND surat_id = '$surat_id'")->num_rows();
			if ($cekOpd > 0) {
				$ci->session->set_flashdata('error', 'Terdapat Eksternal yang sudah dipilih');
				redirect(site_url('suratkeluar/'.$jenis_surat.'/edit/'.$surat_id));
			}else{
				array_push($dataEksternal, array(
					'surat_id' => $surat_id, 
					'users_id' => $h,
					));
				$index++;
			}
		}
		$disposisiEksternal = $ci->db->insert_batch('disposisi_suratkeluar', $dataEksternal);
	}else{
		$ci->session->set_flashdata('error', 'Tujuan surat tidak boleh kosong');
		if ($ci->uri->segment(3) == 'insert') {
			redirect(site_url('suratkeluar/'.$jenis_surat.'/add'));
		}else{
			redirect(site_url('suratkeluar/'.$jenis_surat.'/edit/'.$surat_id));
		}
	}
}

function listOpd($id)
{
	$ci =& get_instance();
	$query = $ci->db->query("
		SELECT * FROM disposisi_suratkeluar
		JOIN aparatur ON aparatur.jabatan_id = disposisi_suratkeluar.users_id
		JOIN users ON users.aparatur_id = aparatur.aparatur_id
		JOIN opd ON opd.opd_id = aparatur.opd_id
		WHERE disposisi_suratkeluar.surat_id = '$id'
	");
	return $query->result();
}

function listEksternal($id)
{
	$ci =& get_instance();
	$query = $ci->db->query("
		SELECT * FROM disposisi_suratkeluar
		JOIN eksternal_keluar ON eksternal_keluar.id = disposisi_suratkeluar.users_id
		WHERE disposisi_suratkeluar.surat_id = '$id'
	");
	return $query->result();
}

function lihatsurat($surat_id)
{

	if (substr($surat_id, 0,2) == 'SE') { 
	    echo "<a href=".site_url('export/edaran/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,2) == 'SB') { 
	    echo "<a href=".site_url('export/biasa/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,2) == 'SU') {
	    echo "<a href=".site_url('export/undangan/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,5) == 'PNGMN') {
	    echo "<a href=".site_url('export/pengumuman/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'LAP') {
	    echo "<a href=".site_url('export/laporan/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>";
	}elseif (substr($surat_id, 0,3) == 'REK') {
	    echo "<a href=".site_url('export/rekomendasi/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'INT') {
	    echo "<a href=".site_url('export/instruksi/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'PNG') {
	    echo "<a href=".site_url('export/pengantar/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,5) == 'NODIN') {
	    echo "<a href=".site_url('export/notadinas/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,2) == 'SK') {
	    echo "<a href=".site_url('export/keterangan/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'SPT') {
	    echo "<a href=".site_url('export/perintahtugas/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,2) == 'SP') {
	    echo "<a href=".site_url('export/perintah/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'IZN') {
	    echo "<a href=".site_url('export/izin/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'PJL') {
	    echo "<a href=".site_url('export/perjalanan/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'KSA') {
	    echo "<a href=".site_url('export/kuasa/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'MKT') {
	    echo "<a href=".site_url('export/melaksanakan_tugas/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'PGL') {
	    echo "<a href=".site_url('export/panggilan/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'NTL') {
	    echo "<a href=".site_url('export/notulen/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}elseif (substr($surat_id, 0,3) == 'MMO') {
	    echo "<a href=".site_url('export/memo/'.$surat_id)." title='Lihat Surat' target='_blank'><i class='fa fa-eye'></i></a>"; 
	}

}

// function kirim_email_eksternal($surat_id,$filesurat)
// {
// 	$ci =& get_instance();

// 	// Konfigurasi email
// 	$config = [
// 	    'useragent' => 'Pemerintah Kota Bogor',
// 	    'protocol'  => 'smtp',
// 	    'mailpath'  => '/usr/sbin/sendmail',
// 	    'smtp_host' => 'mail.kotabogor.go.id',
// 	    'smtp_user' => 'tnd@kotabogor.go.id', // Ganti dengan email Anda
// 	    'smtp_pass' => 'k0m1nf0#', // Password email Anda
// 	    // 'smtp_user' => 'bag.humas@kotabogor.go.id', // Ganti dengan email Anda
// 	    // 'smtp_pass' => 'biar4man', // Password email Anda
// 	    'smtp_port' => 25,
// 	    'smtp_keepalive' => TRUE,
// 	    'smtp_crypto' => 'SSL',
// 	    'wordwrap'  => TRUE,
// 	    'wrapchars' => 80,
// 	    'mailtype'  => 'html',
// 	    'charset'   => 'utf-8',
// 	    'validate'  => TRUE,
// 	    'crlf'      => "\r\n",
// 	    'newline'   => "\r\n",
// 	];

// 	// Load library email dan konfigurasinya
// 	$ci->load->library('email', $config);

// 	// Email dan nama pengirim
// 	$ci->email->from('no-reply@tnd.kotabogor.go.id', 'Admin Tata Naskah Dinas Pemerintah Kota Bogor');
// 	// $ci->email->from('no-reply@humas.kotabogor.go.id', 'Admin Tata Naskah Dinas Pemerintah Kota Bogor');

// 	// Email penerima
// 	$qemail = $ci->db->query("
// 		SELECT * FROM disposisi_suratkeluar 
// 		JOIN eksternal_keluar ON users_id = id 
// 		WHERE surat_id = '$surat_id'
// 	")->result();
// 	$email = '';
// 	foreach ($qemail as $key => $e) {
// 		$email .= $e->email.', ';
// 	}
// 	$ci->email->to($email);

// 	// Subject email
// 	$ci->email->subject('Naskah Dinas Pemerintah Kota Bogor');
					  
// 	// Isi email
// 	$message = "Isi Surat";
// 	$ci->email->message($message);

// 	//file lampiran
// 	$ci->email->attach('./assets/surat/'.$filesurat);

// 	// Tampilkan pesan sukses atau error
// 	if ($ci->email->send()) {
		
// 		$kirim = array('status' => 'Selesai');
// 		$where = array('surat_id' => $surat_id);
// 		$ci->db->update('disposisi_suratkeluar', $kirim, $where);

// 		$ci->session->set_flashdata('success', 'Surat Berhasil Ditandatangan');
// 		redirect(site_url('suratkeluar/draft/signature'));

// 	}else{
// 		echo "Email Tidak Terkirim <br>";
// 		echo $ci->email->print_debugger();
// 	}
	
// }

// kirim email dengan email dev
function kirim_email_eksternal($surat_id,$filesurat)
{
	$ci =& get_instance();

	// Konfigurasi email
	$config = [
		'mailtype'  => 'html',
		'charset'   => 'utf-8',
		'protocol'  => 'smtp',
		'smtp_host' => 'smtp.gmail.com',
		'smtp_user' => 'devpemkotbogor@gmail.com',  // Email gmail
		'smtp_pass'   => 'Dev,andalan.pemkot-bogor;#',  // Password gmail
		'smtp_crypto' => 'ssl',
		'smtp_port'   => 465,
		'crlf'    => "\r\n",
		'newline' => "\r\n"
	];

	// Load library email dan konfigurasinya
	$ci->load->library('email', $config);

	// Email dan nama pengirim
	$ci->email->from('no-reply@tnd.kotabogor.go.id', 'Admin Tata Naskah Dinas Pemerintah Kota Bogor');
	// $ci->email->from('no-reply@humas.kotabogor.go.id', 'Admin Tata Naskah Dinas Pemerintah Kota Bogor');

	// Email penerima
	$qemail = $ci->db->query("
		SELECT * FROM disposisi_suratkeluar 
		JOIN eksternal_keluar ON users_id = id 
		WHERE surat_id = '$surat_id'
	")->result();
	$email = '';
	foreach ($qemail as $key => $e) {
		$email .= $e->email.', ';
	}
	$ci->email->to($email);

	// Subject email
	$ci->email->subject('Naskah Dinas Pemerintah Kota Bogor');
					  
	// Isi email
	$message = "Isi Surat";
	$ci->email->message($message);

	//file lampiran
	$ci->email->attach('./assets/surat/'.$filesurat);

	// Tampilkan pesan sukses atau error
	if ($ci->email->send()) {
		
		$kirim = array('status' => 'Selesai');
		$where = array('surat_id' => $surat_id);
		$ci->db->update('disposisi_suratkeluar', $kirim, $where);

		$ci->session->set_flashdata('success', 'Surat Berhasil Ditandatangan');
		redirect(site_url('suratkeluar/draft/signature'));

	}else{
		echo "Email Tidak Terkirim <br>";
		echo $ci->email->print_debugger();
	}
	
}