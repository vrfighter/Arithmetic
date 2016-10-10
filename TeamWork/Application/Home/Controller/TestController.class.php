<?php
/**
 * Created by PhpStorm.
 * User: bwju
 * Date: 2016/10/10
 * Time: 21:08
 */

namespace Home\Controller;
use Think\Controller;

class TestController extends Controller{
    public function test(){
        $this->display('index/test');
    }
}