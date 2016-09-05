<?php

class UpdateController extends Controller
{
	public function filters()
    {
        return array(
            'accessControl',
        	'postOnly + delete', // we only allow deletion via POST request
        );
    }

    public function accessRules()
    {
		return array(
				array('allow',
	    			'actions'=>array('process'),
	    			'users'=>array('*'),
	    		),
	    		array('deny',
	    			'users' => array('*')
	    		)
    	);
    }

	/**
	 * Processes update calls from Unattended clients
	 */
	public function actionProcess()
	{
		$this->layout='//layouts/login';
		// If this is a user, redirect to manage
		if (Yii::app()->user->isGuest == false)
		{
			$this->redirect('manage');
		}
		$this->pageTitle = 'Update';
		$this->render('process');
	}
}
