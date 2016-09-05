<?php

class User extends CFormModel
{
	public $id;
	public $username;

    public function __construct()
    {
        $this->id = GeneralHelper::CryptToken('num', 10);
        $this->username = "Username";
    }
}