<?php
/**
 * Created by PhpStorm.
 * User: bwju
 * Date: 2016/10/11
 * Time: 21:27
 */
namespace Home\Model;
use Think\Model\RelationModel;

class LetterModel extends RelationModel
{
    protected $tableName = "letter";

    protected $_link = array(
        'teacher' => array(
            'mapping_type' => self::BELONGS_TO,
            'mapping_name' => 'teacher',
            'foreign_key'  => 'teacher_id'
        ),

    );
}