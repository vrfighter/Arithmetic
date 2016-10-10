<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('index');
    }

    public function produceAnExpression($num, $sign){

        $number=$num;//将$num保存下来，因为其在下面递归的时候要用到，同时下面执行过程中其值发生了变化.	
        //生成全部的运算数据
        for($i=0;$i<$num;$i++){
            $instegers[$i]=rand( 0, 100 );
        }
        //生成全部的运算符号
        $operaters=array();
        for($i = 0; $i<$num-1; $i++){//添加一个循环，生成符号，num-1是因为计算的符号比数少一个
            //判断选择哪种运算
            switch($sign){
            case 1:
                $operator = rand(1,2);
                break;
            case 2:
                $operator = rand(3,4);
                break;
            case 3:
                $operator = rand(1,4);
                break;
            }
            switch($operator){
            case 1:
                $operaters[$i] = "+";					
                break;
            case 2:
                $operaters[$i] = "-";					
                break;
            case 3:
                $operaters[$i] = "*";
                break;
            case 4:
                $operaters[$i] = "/";
                $instegers[$i+1] = rand(1,10);//排除0的情况,同时使其不要太大。
                break;
            }
        }

        //形成表达式
        $expresion = "";
        $firstElement = array_shift($instegers);//将数组的第一个元素移出。
        for($i=0; $i<$num-1; $i++){//连接符号和值
            $expresion .= $operaters[$i].$instegers[$i];
        }
        $expresion = $firstElement.$expresion;//连接上第一个元素。
        array_unshift($instegers,$firstElement);//将第一个元素放回$instegers数组，以免对下面造成影响。

        //运算符号优先级处理（先处理乘除）

        for($i = 0; $i<$num-1; $i++ ){
            if($operaters[$i] == "*"){
                $instegers[$i] = $instegers[$i]*$instegers[$i+1];//将*前后两个数相乘，并赋给前面的值
            }

            if($operaters[$i] == "/"){
                $instegers[$i] = $instegers[$i]/$instegers[$i+1];//将/前后两个数相除，并赋给前面的值
            }

            if( ($operaters[$i] == "/") || $operaters[$i] == "*"){
                array_push($instegers,"\0");//在末尾添加一个元素，使下面移位的时候不会报错。
                for($j=$i+1; $j<$num; $j++){//将后面的数值向前排一位。
                    $instegers[$j] = $instegers[$j+1];
                }

                for($a=0; $a<2; $a++){//循环删除最后两个没用的元素。
                    array_pop($instegers);
                }

                array_push($operaters,"\0");
                for($j=$i; $j<$num-1; $j++){
                    $operaters[$j] = $operaters[$j+1];//将后面的符号向前排一位。
                }

                for($a=0; $a<2; $a++){//循环删除最后两个没用的元素。
                    array_pop($operaters);
                }
                $num = $num-1;
                $i = $i-1;
            }

        }

        //计算结果

        //找出那些是负号
        $keys=array();//用于存储“-”的key.
        for($i=0;$i<$num-1;$i++){
            if($operaters[$i]=="-"){
                $keys[] = $i;
            }
        }
        //将对应的数值变成负数
        foreach($keys as $key){
            $instegers[$key+1]=-$instegers[$key+1];
        }

        //将$instegers数组求和。
        $result=array_sum($instegers);

        //将结果返回出去
        $results=array();
        $results['text']=$expresion;//表达式
        $results['answer']=$result;//结果

        //判断结果是否符合要求
        if($result<0 || $result>100 || ! is_int($result)){
            $results=$this->produceAnExpression($number,$sign);//递归调用直到获得正确的结果
            return $results;                    //经验：递归调用要保持参数一样，否则可能出现难以查出的错误。

        }else{
            return $results;

        }
    }

    public function saveQuestion(){
        $jjnum = I('param.jjnum');
        $ccnum = I('param.ccnum');
        $hhnum = I('param.hhnum');
        $teacher_id = I('param.teacher_id');
        $question_name = I('param.question_name');
        $result = array();
        for($i=0; $i<$jjnum; $i++){
            $calculate_type = 1;
            $calculate_length = rand(3,5);
            $r = $this->produceAnExpression($calculate_length,$calculate_type);
            array_push($result,$r);
        }
        for($i=0; $i<$ccnum; $i++){
            $calculate_type = 2;
            $calculate_length = rand(3,5);
            $r = $this->produceAnExpression($calculate_length,$calculate_type);
            array_push($result,$r);
        }
        for($i=0; $i<$hhnum; $i++){
            $calculate_type = 3;
            $calculate_length = rand(3,5);
            $r = $this->produceAnExpression($calculate_length,$calculate_type);
            array_push($result,$r);
        }
        $question['question_content'] = json_encode($result);
        $question['teacher_id'] = $teacher_id;
        $question['name'] = $question_name;
        $question['public'] = 'true';
        $Dao = M('question');
        $Dao->add($question);

        $response['status'] = 'success';
        $response['message'] = 'question added';
        echo json_encode($response);
    }
    
    //入参、函数功能
    public function xiehanglun(){
        $data = I('param.');
        $data['exam_id'] = I('param.exam_id', '');
        $Model = M("question");
        $r = $Model->add($data);
        echo json_encode($data);
        echo $Model->getLastSql();
        echo json_encode($r);
    }

}
