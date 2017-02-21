<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	class UserSettings extends CI_Controller{
		
		public function __construct(){
			parent::__construct();

			$this->load->model('mstrole');

			$this -> load -> model('tbluser');
			$this->load->library('form_validation');

		}
		
		public function index(){
			$user_list = $this->tbluser->getalldata();
			$this -> data["user_lst"] = $user_list;
			// echo "<pre>";
	  //       print_r($this -> data);
	  //       echo "</pre>";
	  //       die;
			$this->parser->parse("accounts/index.tpl",$this -> data);
		}
		
		public function add_user() {
		$this->data['success_notice'] = "";

        if($this->input->post('btn_add_user')) {
            $email = $this->input->post('user_email');
            $password = $this->hashpassword($this->input->post('user_pass'));
            $firstname = $this->input->post('user_firstname');
            $lastname = $this->input->post('user_lastname');
            $phone = $this->input->post('user_phone');
            $type = $this->input->post('user_type');
            $role = $this->input->post('user_role');

            $image_info = $this->upload_img();
            if($image_info) {
//                $add['user_img'] = $image_info['file_name'];
                $img = $image_info['file_name'];
            }
            $this->form_validation->set_rules('user_email', 'Email', 'required');
            $this->form_validation->set_rules('user_pass', 'Password', 'required|min_length[3]');

            if ($this->form_validation->run() == TRUE)
            {
//                $new_user_id = $this->muser->addUser($add);
                $new_user_id = $this->tbluser->addUser($email, $password, $firstname, $lastname, $phone, $img, $type, $role);
                redirect(base_url(). "admin/accounts");
                $this->data['success_notice'] = "Added Success.";

            }
        }
        $roles = $this->mstrole->getalldata();

        $this->data['roles'] = $roles;
        $this->data['row'] =array("user_id" => 0);
        //print_r($this->data); die;
        //$this->load->view('users/edit_user',$this->data);
		$this->parser->parse("accounts/new_user.tpl",$this->data);
		}

		public function delete_user() {
			$id = $this->uri->segment('4');
	        $this->data['id']  = $id;

	        $this->tbluser->deleteUser($id);

	        redirect(base_url().'admin/accounts');

    	}

		function hashpassword($password) {
	        return md5($password);
	    }

	    function upload_img(){

            $config['upload_path'] = './upload/users/images';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size'] = 900;
            $config['max_width'] = 2000;
            $config['max_height'] = 2000;
            $this->load->library("upload", $config); //  Load library upload kèm theo config cấu hình ở trên

            if ($this->upload->do_upload("user_image")) { // Thực hiện quá trình upload file

                $check = $this->upload->data(); // Lấy thông tin file upload lên
                return $check;

            }
        	return false;
    	}
		
	}