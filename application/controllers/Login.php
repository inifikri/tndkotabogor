<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		header("X-XSS-Protection: 1; mode=block");
	}

	public function index()
	{
		$this->load->view('login');
	}

	public function cek()
	{
		$username = htmlentities($this->input->post('username'));
		$pass = htmlentities($this->input->post('password'));
		$password = sha1($pass);
		$tahun = htmlentities($this->input->post('tahun'));

		$data = array(
			'username' => $username, 
			'password' => $password,
		);
		$cek = $this->db->get_where('users', $data)->num_rows();
		if ($cek > 0) {
			$this->db->select('*');
			$this->db->from('users');
			$this->db->join('aparatur', 'aparatur.aparatur_id = users.aparatur_id', 'left');
			$this->db->join('jabatan', 'jabatan.jabatan_id = aparatur.jabatan_id', 'left');
			$this->db->where($data);
			$query =  $this->db->get()->result();
			foreach ($query as $key => $h) {
				$nama = $h->nama;
				$username = $h->username;
				$email = $h->email;
				$jabatan_id = $h->jabatan_id;
				$nama_jabatan = $h->nama_jabatan;
				$foto = $h->foto;
				$level = $h->level_id;
				$opd_id = $h->opd_id;
				$users_id = $h->users_id;
			}
			$session = array(
				'login' => 1,
				'tahun' => $tahun,
				'nama' => $nama,
				'username' => $username,
				'email' => $email,
				'jabatan_id' => $jabatan_id,
				'nama_jabatan' => $nama_jabatan,
				'foto' => $foto, 
				'level' => $level,
				'opd_id' => $opd_id,
				'users_id' => $users_id,
			);
			$this->session->set_userdata($session);
			redirect('home/dashboard');
		}else{
			$this->session->set_flashdata('access', 'Username dan Password Salah!');
			redirect(site_url());
		}
		
	}

	public function logout()
	{
		$this->session->sess_destroy();
		redirect(site_url());
	}

}