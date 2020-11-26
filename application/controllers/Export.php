<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Export extends CI_Controller
{	
	
	public function biasa()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_biasa', array('id' => $id))->row_array();
		$filename = 'Surat Biasa - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];

		$this->load->library('pdf');

	//	$query = $this->db->query("SELECT * FROM draft LEFT JOIN surat_biasa ON surat_biasa.id = draft.surat_id 		LEFT JOIN opd ON opd.opd_id = surat_biasa.opd_id LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id WHERE surat_biasa.id = '$id' ");
		
		$query = $this->db->query("SELECT a.id, a.opd_id, a.kop_id, a.kodesurat_id, a.tanggal, a.nomor, a.sifat, a.lampiran, a.hal, a.tembusan, a.lampiran_lain, a.isi, b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.status, f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, g.nip, g.pangkat FROM surat_biasa a 		LEFT JOIN opd b ON a.opd_id = b.opd_id 		LEFT JOIN penandatangan e ON a.id = e.surat_id 		LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id 		LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id 		WHERE a.id = '$id' ");	

		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/biasawalikota_pdf', array (
				'biasa' 	=> $query->result()
			), TRUE);
		}else{ 
			$content = $this->load->view('exportsurat/biasa_pdf', array (
				'biasa' 	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function edaran()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_edaran', array('id' => $id))->row_array();
		$filename = 'Surat Edaran - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

	//	$query = $this->db->query("	SELECT * FROM draft	LEFT JOIN surat_edaran ON surat_edaran.id = draft.surat_id 			LEFT JOIN opd ON opd.opd_id = surat_edaran.opd_id LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id WHERE surat_edaran.id = '$id' ");

	$query = $this->db->query("SELECT 
		a.id, a.opd_id, a.kop_id, a.kodesurat_id, a.tanggal, a.nomor, a.tentang, a.isi, a.lampiran_lain, b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.status, f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, g.nip, g.pangkat FROM surat_edaran a 
		LEFT JOIN opd b ON a.opd_id = b.opd_id 
		LEFT JOIN penandatangan e ON a.id = e.surat_id 
		LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id 
		LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id 
		WHERE a.id = '$id' ");	

		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/edaranwalikota_pdf', array (
				'edaran' 	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/edaran_pdf', array (
				'edaran' 	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function undangan()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_undangan', array('id' => $id))->row_array();
		$filename = 'Surat Undangan - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

//		$query = $this->db->query("SELECT * FROM draft 	LEFT JOIN surat_undangan ON surat_undangan.id = draft.surat_id 	LEFT JOIN opd ON opd.opd_id = surat_undangan.opd_id LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id WHERE surat_undangan.id = '$id' ");

	$query = $this->db->query("SELECT 
		a.id, a.opd_id, a.kop_id, a.kodesurat_id, a.tanggal, a.nomor, a.sifat, a.lampiran, a.hal, a.tembusan, a.lampiran_lain, a.p1, a.hari, a.tgl_acara, a.pukul, a.tempat, a.acara, a.p2,		
		b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.status, f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, g.nip, g.pangkat FROM surat_undangan a 
		LEFT JOIN opd b ON a.opd_id = b.opd_id 
		LEFT JOIN penandatangan e ON a.id = e.surat_id 
		LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id 
		LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id 
		WHERE a.id = '$id' ");	

		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/undanganwalikota_pdf', array (
				'undangan' 	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/undangan_pdf', array (
				'undangan' 	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function pengumuman()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_pengumuman', array('id' => $id))->row_array();
		$filename = 'Pengumuman - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_pengumuman ON surat_pengumuman.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_pengumuman.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_pengumuman.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/pengumumanwalikota_pdf', array (
				'pengumuman' 	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/pengumuman_pdf', array (
				'pengumuman' 	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function laporan()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_laporan', array('id' => $id))->row_array();
		$filename = 'Laporan - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_laporan ON surat_laporan.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_laporan.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_laporan.id = '$id'
		");
		
		$content = $this->load->view('exportsurat/laporan_pdf', array (
			'laporan' 	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function rekomendasi()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_rekomendasi', array('id' => $id))->row_array();
		$filename = 'Surat Rekomendasi - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_rekomendasi ON surat_rekomendasi.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_rekomendasi.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_rekomendasi.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/rekomendasiwalikota_pdf', array (
				'rekomendasi' 	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/rekomendasi_pdf', array (
				'rekomendasi' 	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function instruksi()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_instruksi', array('id' => $id))->row_array();
		$filename = 'Surat Instruksi - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_instruksi ON surat_instruksi.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_instruksi.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_instruksi.id = '$id'
		"); 
		
		$content = $this->load->view('exportsurat/instruksiwalikota_pdf', array (
			'instruksi' 	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function pengantar()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_pengantar', array('id' => $id))->row_array();
		$filename = 'Surat Pengantar - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_pengantar ON surat_pengantar.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_pengantar.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_pengantar.id = '$id'
		");
		
		$content = $this->load->view('exportsurat/pengantar_pdf', array (
			'pengantar' 	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function notadinas()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_notadinas', array('id' => $id))->row_array();
		$filename = 'Nota Dinas - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_notadinas ON surat_notadinas.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_notadinas.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_notadinas.id = '$id'
		");
		
		$content = $this->load->view('exportsurat/notadinas_pdf', array (
			'notadinas'	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function keterangan()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_keterangan', array('id' => $id))->row_array();
		$filename = 'Surat Keterangan - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

//		$query = $this->db->query("SELECT a.id, a.surat_id, a.tanggal, a.dibuat_id, a.penandatangan_id, a.verifikasi_id, a. nama_surat, b.id, b.opd_id, b.kop_id, b.kodesurat_id, b.nomor, b.pegawai_id, b.maksud, b.tanggal, c.opd_id, c.nama_pd, c.kode_pd, c.alamat, c.telp, c.email, c.alamat_website, d.penandatangan_id, d.surat_id, d.jabatan_id, d.nama AS namapejabat, d.jabatan AS jabatanpejabat, d.status, e.aparatur_id, e.jabatan_id, e.opd_id, e.nip AS nippejabat, e.nama AS namapejabat, e.eselon, e.pangkat AS pangkatpejabat, e.golongan, f.aparatur_id, f.jabatan_id, f.opd_id, f.nip AS nippegawai, f.nama AS namapegawai, f.eselon, f.pangkat AS pangkatpegawai, f.golongan AS golonganpegawai, g.jabatan_id, g.opd_id, g.nama_jabatan AS jabatanpegawai, g.jabatan FROM draft a LEFT JOIN surat_keterangan b ON b.id = a.surat_id LEFT JOIN opd c ON c.opd_id = b.opd_id LEFT JOIN penandatangan d ON d.penandatangan_id = a.penandatangan_id	LEFT JOIN aparatur e ON e.jabatan_id = d.jabatan_id LEFT JOIN aparatur f ON b.pegawai_id  = f.aparatur_id LEFT JOIN jabatan g ON f.jabatan_id  = g.jabatan_id	WHERE b.id = '$id' ");

		$query = $this->db->query("SELECT a.id, a.opd_id, a.kop_id, a.kodesurat_id, a.nomor, a.pegawai_id, a.maksud, a.tanggal,	b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, c.aparatur_id, c.jabatan_id, c.nip AS nippegawai, c.nama AS namapegawai, c.pangkat AS pangkatpegawai, c.golongan AS golonganpegawai, d.jabatan_id, d.nama_jabatan AS jabatanpegawai, d.jabatan, e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.jabatan AS jabatanpejabat, e.status, f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, g.nip AS nippejabat, g.pangkat AS pangkatpejabat FROM surat_keterangan a LEFT JOIN opd b ON a.opd_id = b.opd_id LEFT JOIN aparatur c ON a.pegawai_id = c.aparatur_id LEFT JOIN jabatan d ON c.jabatan_id = d.jabatan_id LEFT JOIN penandatangan e ON a.id = e.surat_id LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id WHERE a.id = '$id' ");	
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/keteranganwalikota_pdf', array (
				'keterangan'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/keterangan_pdf', array (
				'keterangan'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function perintahtugas()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_perintahtugas', array('id' => $id))->row_array();
		$filename = 'Surat Perintah Tugas - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_perintahtugas ON surat_perintahtugas.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_perintahtugas.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_perintahtugas.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/perintahtugaswalikota_pdf', array (
				'perintahtugas'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/perintahtugas_pdf', array (
				'perintahtugas'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function perintah()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_perintah', array('id' => $id))->row_array();
		$filename = 'Surat Perintah - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

//		$query = $this->db->query("	SELECT surat_perintah.kop_id,draft.surat_id,surat_perintah.id,opd.opd_id,surat_perintah.opd_id,penandatangan.penandatangan_id,draft.penandatangan_id,aparatur.jabatan_id,penandatangan.jabatan_id,jabatan.jabatan_id,penandatangan.jabatan_id,opd.nama_pd,opd.alamat,opd.telp,opd.alamat_website,opd.email,			surat_perintah.nomor,surat_perintah.nama_pejabat,surat_perintah.jabatan AS jabatan_perintah,		surat_perintah.isi,draft.verifikasi_id,surat_perintah.tanggal,			penandatangan.jabatan,penandatangan.nama,aparatur.pangkat,aparatur.nip,surat_perintah.tembusan			FROM draft			LEFT JOIN surat_perintah ON surat_perintah.id = draft.surat_id			LEFT JOIN opd ON opd.opd_id = surat_perintah.opd_id			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id			LEFT JOIN jabatan ON jabatan.jabatan_id = penandatangan.jabatan_id			WHERE surat_perintah.id = '$id'		");
		
		$query = $this->db->query("SELECT 
		a.id, a.opd_id, a.kop_id, a.kodesurat_id, a.nomor, a.dasar, a.untuk, a.tanggal, a.pegawai_id, a.tembusan, 	
		b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, 
		c.aparatur_id, c.jabatan_id, c.nip AS nippegawai, c.nama AS namapegawai, c.pangkat AS pangkatpegawai, c.golongan AS golonganpegawai, 
		d.jabatan_id, d.nama_jabatan AS jabatanpegawai, d.jabatan, 
		e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.jabatan AS jabatanpejabat, e.status, 
		f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, 
		g.nip AS nippejabat, g.pangkat AS pangkatpejabat 
		FROM surat_perintah a LEFT JOIN opd b ON a.opd_id = b.opd_id LEFT JOIN aparatur c ON a.pegawai_id = c.aparatur_id LEFT JOIN jabatan d ON c.jabatan_id = d.jabatan_id LEFT JOIN penandatangan e ON a.id = e.surat_id LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id WHERE a.id = '$id' ");		
		
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/perintahwalikota_pdf', array (
				'perintah'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/perintah_pdf', array (
				'perintah'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function izin()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_izin', array('id' => $id))->row_array();
		$filename = 'Surat Izin - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_izin ON surat_izin.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_izin.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_izin.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/izinwalikota_pdf', array (
				'izin'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/izin_pdf', array (
				'izin'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function perjalanan()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_perjalanan', array('id' => $id))->row_array();
		$filename = 'Surat Perjalanan Dinas - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_perjalanan ON surat_perjalanan.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_perjalanan.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_perjalanan.id = '$id'
		");
		
		$content = $this->load->view('exportsurat/perjalanan_pdf', array (
			'perjalanan'	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function kuasa()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_kuasa', array('id' => $id))->row_array();
		$filename = 'Surat Kuasa - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_kuasa ON surat_kuasa.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_kuasa.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_kuasa.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/kuasawalikota_pdf', array (
				'kuasa'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/kuasa_pdf', array (
				'kuasa'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function melaksanakan_tugas()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_melaksanakantugas', array('id' => $id))->row_array();
		$filename = 'Surat Melaksanakan Tugas - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
		SELECT a.id, a.opd_id, a.kop_id, a.kodesurat_id,  a.tanggal, a.nomor, a.pegawai_id, a.dasarsk, a.nomorsk, a.tmt, a.tugas,	
		
		b.opd_id, b.nama_pd, b.kode_pd, b.alamat, b.telp, b.email, b.alamat_website, c.aparatur_id, c.jabatan_id, c.nip AS nippegawai, c.nama AS namapegawai, c.pangkat AS pangkatpegawai, c.golongan AS golonganpegawai, d.jabatan_id, d.nama_jabatan AS jabatanpegawai, d.jabatan, e.surat_id, e.jabatan_id, e.nama AS namapejabat, e.jabatan AS jabatanpejabat, e.status, f.jabatan_id, f.nama_jabatan AS namajabatanpejabat, f.jabatan AS jabatanpejabat, g.nip AS nippejabat, g.pangkat AS pangkatpejabat 
		
		FROM surat_melaksanakantugas a LEFT JOIN opd b ON a.opd_id = b.opd_id LEFT JOIN aparatur c ON a.pegawai_id = c.aparatur_id LEFT JOIN jabatan d ON c.jabatan_id = d.jabatan_id LEFT JOIN penandatangan e ON a.id = e.surat_id LEFT JOIN jabatan f ON e.jabatan_id = f.jabatan_id LEFT JOIN aparatur g ON e.jabatan_id = g.jabatan_id WHERE a.id = '$id' ");	
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/melaksanakantugaswalikota_pdf', array (
				'melaksanakantugas'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/melaksanakantugas_pdf', array (
				'melaksanakantugas'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function panggilan()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_panggilan', array('id' => $id))->row_array();
		$filename = 'Surat Panggilan - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_panggilan ON surat_panggilan.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_panggilan.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_panggilan.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/panggilanwalikota_pdf', array (
				'panggilan'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/panggilan_pdf', array (
				'panggilan'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function notulen()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_notulen', array('id' => $id))->row_array();
		$filename = 'Notulen - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_notulen ON surat_notulen.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_notulen.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_notulen.id = '$id'
		");
		
		$content = $this->load->view('exportsurat/notulen_pdf', array (
			'notulen'	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename, $qr);
	}

	public function memo()
	{
		$id = $this->uri->segment(3);
		
		$qfilename = $this->db->get_where('surat_memo', array('id' => $id))->row_array();
		$filename = 'Memo - '.tanggal($qfilename['tanggal']).' ('.$qfilename['id'].')';
		$qr = $qfilename['id'];
		
		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM draft
			LEFT JOIN surat_memo ON surat_memo.id = draft.surat_id
			LEFT JOIN opd ON opd.opd_id = surat_memo.opd_id
			LEFT JOIN penandatangan ON penandatangan.penandatangan_id = draft.penandatangan_id
			LEFT JOIN aparatur ON aparatur.jabatan_id = penandatangan.jabatan_id
			WHERE surat_memo.id = '$id'
		");
		
		$kopsurat = $query->row_array();
		if ($kopsurat['kop_id'] == 1) {
			$content = $this->load->view('exportsurat/memowalikota_pdf', array (
				'memo'	=> $query->result()
			), TRUE);
		}else{
			$content = $this->load->view('exportsurat/memo_pdf', array (
				'memo'	=> $query->result()
			), TRUE);
		}
		
		$this->pdf->create($content, $filename, $qr);
	}

// ============================================================================================================================
// ============================================================================================================================

								// EXPORT UNTUK LEMBAR DISPOSISI

// ============================================================================================================================
// ============================================================================================================================


	public function lembar_disposisi()
	{
		$id = $this->uri->segment(3);

		$this->load->library('pdf');

		$query = $this->db->query("
			SELECT * FROM surat_masuk
			LEFT JOIN kode_surat ON kode_surat.kodesurat_id = surat_masuk.kodesurat_id
			LEFT JOIN opd ON opd.opd_id = surat_masuk.opd_id
			WHERE surat_masuk.suratmasuk_id = '$id'
		");

		$filename = "Lembar Disposisi Surat - ".tanggal($query->row_array()['diterima']).' ('.$query->row_array()['suratmasuk_id'].')';
		
		$content = $this->load->view('exportsurat/lembardisposisi_pdf', array (
			'disposisi' 	=> $query->result()
		), TRUE);
		
		$this->pdf->create($content, $filename);
	}

}