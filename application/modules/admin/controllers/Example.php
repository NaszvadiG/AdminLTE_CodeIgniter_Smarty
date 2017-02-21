<?php
class Example extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	 /**
     * Default Method
     * 
     * @return void
     */
    public function index()
    {
        $data = array(
                    'title' => 'Smarty_Example',
                    'body' => 'This is body text to show that the Smarty Parser works!'
                );
        $this->parser->parse("example.tpl",$data);
    }
}
