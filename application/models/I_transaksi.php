<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class I_transaksi extends CI_Model {

	public function semua_data(){
		$this->db->join('anggota','transaksi.NomorAnggota=anggota.NomorAnggota','LEFT');
		$this->db->join('pustaka','transaksi.KodePustaka=pustaka.KodePustaka','LEFT');
		$this->db->join('pustakawan','transaksi.KodePustakawanPinjam=pustakawan.KodePustakawan','LEFT');
		return $this->db->order_by('IdTransaksi','DESC')->get('transaksi');
	}

	public function kode(){
		$query = $this->db->order_by('IdTransaksi','DESC')->limit(1)->get('transaksi');

		$kode = 'TRANS1';
		if ($query->num_rows() > 0) {
			$row = $query->row();
			$data = $row->IdTransaksi;
			$lebur = explode("TRANS",$data);
			$lebur1 = $lebur[1];
			$gabung = $lebur1 + 1;
			$kode = "TRANS".$gabung;
		}else{
			$kode = 'TRANS1';
		}
		return $kode;
	}

	public function pinjam($data){
        $this->db->insert('transaksi',$data);
        return ($this->db->affected_rows() > 0) ? true : false;
    }

    public function kembalikan($IdTransaksi,$data){
    	$this->db->set($data);
    	$this->db->where('IdTransaksi',$IdTransaksi);
    	$this->db->update('transaksi');
    	return ($this->db->affected_rows() > 0) ? true : false;
    }

}

/* End of file M_transaksi.php */
/* Location: ./application/models/M_transaksi.php */