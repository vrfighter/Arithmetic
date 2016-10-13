<?php
<<<<<<< 7b1fdc9cd26586105c139b1ee1d3ade5f9b78487
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

        'teacher' => array(
            'mapping_type' => self::BELONGS_TO,
            'mapping_name' => 'teacher',
            'foreign_key'  => 'teacher_id'
        ),

    );
}