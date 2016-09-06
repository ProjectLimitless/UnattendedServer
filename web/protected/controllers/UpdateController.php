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
		if (Yii::app()->request->isPostRequest)
		{
			$post_data = Yii::app()->request->rawBody;
			if ($post_data == '')
			{
				throw new CHttpException(400, 'Missing Omaha Request Data');
			}

			$xml = simplexml_load_string($post_data);
			// Route based on Event type
			$eventtype = $xml->app->event->attributes()['eventtype'];
			switch ($eventtype)
			{
				case OmahaEventTypes::UNKNOWN:
					echo 'Unknown';
					break;
				default:
					echo 'Nothing';
			}
		}
		else
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
}
