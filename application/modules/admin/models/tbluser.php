<?php
Class TblUser extends CI_Model {

    private $_table = "users";
	//Tong so record//
    function num_rows(){
        return $this->db->count_all($this->_table);
    }
    //Lay toan bo du lieu//
    function getalldata(){

        $this->db->select('user_id, user_firstname, user_lastname, user_phone, user_email, user_type,active,role_id');
        $this->db->order_by("user_id","asc");
        $query = $this->db->get("users");
        $data = $query->result_array();
        return $data;
    }
    //Them user//
    function add( $inaUser ){
        if( $this->db->insert( $this->_table , $inaUser ) ){
            return TRUE;
        }

        return FALSE;
    }

    //Check avaiable User
    function checkUser($ckuser){
        $this -> db -> select('user_email');
        $this -> db -> from($this->_table);
        $this -> db -> where('user_email', $ckuser);
        $this -> db -> limit(1);
        $query = $this -> db -> get();

        if($query -> num_rows() == 1)
        {
            return true;
        }
    }

    //Xoa user//
    function deleteUser($id){
        $this->db->where("user_id",$id);
        $this->db->delete($this->_table);  
    }

    //--- Lay thong tin 1 record qua id
    function getInfo($id)
    {
        $this->db->where("user_id",$id);
        $query = $this->db->get($this->_table);

        if($query)
            return $query->row_array();
        else
            return FALSE;
    }

    //--- Cap nhat user
    function updateUser($data,$id){
        $this->db->where("user_id",$id);
        if($this->db->update($this->_table,$data))
            return TRUE;
        else
            return FALSE;
    }

    public function countAll(){
        return $this->db->count_all("$this->_table");
    }

    function addUser($email, $password, $firstname, $lastname, $phone, $img, $type, $role){
        $data = array(
            "user_email" => $email,
            "user_pass" => $password,
            "user_firstname" => $firstname,
            "user_lastname" => $lastname,
            "user_phone" => $phone,
            "user_image" => $img,
            "user_type" => $type,
            "role_id" => 2
        );
        $this->db->insert( $this->_table , $data );
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }

}