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
	   				'actions'=>array('index', 'delete'),
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
		$model = new Updates('search');
		$model->unsetAttributes();  // clear any default values
		if (isset($_GET['Updates'])) {
			$model->attributes = $_GET['Updates'];
		}

		$this->pageTitle = 'Welcome';
		$this->render('index', array(
			'model' => $model
		));
	}

	public function actionDelete($id)
	{
		$model = Updates::model()->findByPk($id, 'is_active = 1');
		if ($model != '')
		{
			$model->is_active = 0;
			if ($model->save() != true)
			{
				throw new CHttpException(500, 'Unable to remove update: ' . json_encode($model->getErrors()));
			}
		}
		else
		{
			throw new CHttpException(404, 'Record not found');
		}
	}

}
