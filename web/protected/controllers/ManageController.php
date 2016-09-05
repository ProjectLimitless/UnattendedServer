<?php

class ManageController extends Controller
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
	   				'actions'=>array('index'),
	 				'users'=>array('@'),
	   			),
	    		array('deny',
	    			'users' => array('*')
	    		)
    	);
    }

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		$this->pageTitle = 'Welcome';
		$this->render('index');
	}

}
