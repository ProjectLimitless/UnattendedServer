<div class="container-fluid">
    <h2>Current Updates</h2>
    <?php
    $this->widget('zii.widgets.grid.CGridView', array(
            'dataProvider' => $model->search(),
            'filter' => $model,
            'columns' => array(
                array(
                    'name' => 'app_id',
                    'type' => 'raw',
                    'value' => '$data->app_id',
                ),
                array(
                    'name' => 'track',
                    'type' => 'raw',
                    'value' => '$data->track',
                ),
                array(
                    'name' => 'version',
                    'type' => 'raw',
                    'value' => '$data->version',
                ),
                array(
                    'name' => 'upgraded',
                    'type' => 'raw',
                    'value' => '$data->upgraded',
                ),
                array(
                    'name' => 'date_created',
                    'type' => 'raw',
                    'value' => 'date("j M Y H:i", strtotime($data->date_created))',
                ),
                array(
                        'class'=>'CButtonColumn',
                        'template'=>'{delete}',
                ),
            ),
    ));
    ?>

</div>
