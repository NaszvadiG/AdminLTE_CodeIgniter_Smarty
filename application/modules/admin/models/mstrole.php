<?php
Class MstRole extends CI_Model {
	private $_table = "roles";
    //Tong so record//
    function num_rows(){
        return $this->db->count_all($this->_table);
    }
    //Lay toan bo du lieu//
    function getalldata(){
        $this->db->select('*');
        $this->db->from($this->_table);
        $query = $this->db->get();

        $data = $query->result_array();
        return $data;
    }

    //Xoa user//
    function deleteRole($id)
    {
        if($id!=1)
        {
            $this->db->where("role_id",$id);
            $this->db->delete($this->_table);
        }
    }

    function addRole($add){
        $data = array(
          'role_name' => $add['role_name'],
            'role_permissions' => $add['role_permissions']
        );

        $this->db->insert("roles", $data);
    }

	
}
