<?php
namespace Home\Controller;
use Think\Controller;
class TeacherController extends Controller {
    public function index(){
       $this->display('teacher/index');
    }

    public function checkRegister(){
        $name = I('param.name');
        $username = I('param.username');
        $password= I('param.password');

        $Dao = M('teacher');
        $result['name'] = $name;
        $result['username'] = $username;
        $result['pwd']= $password;
        $id = $Dao->add($result);

        $response['message'] = 'register success';
        $response['status'] = 'success';
        $response['id'] = $id;
        echo json_encode($response);
    }

    public function getStudentList(){
        $teacher_id = I('param.teacher_id');
        $Dao = M('student');
        $result = $Dao->where("teacher_id=$teacher_id")->select();
        $data = array();
        foreach($result as $r){
            $d = array();
            $d['student_id'] = $r['student_id'];
            $d['name'] = $r['name'];
            $d['info'] = $r['student_id']; 
            array_push($data,$d);
        }
        echo json_encode($data);
    }
    
    public function getStudentInfo(){
        $student_id = I('param.student_id');
        $Dao = M('stu_exam');
        $result = $Dao->where("student_id=$student_id")->select();

        echo json_encode($result);
    }

    public function getQuestionList(){
        $teacher_id = I('param.teacher_id');
        $Dao = M('question');
        $result = $Dao->where("teacher_id=$teacher_id")->select();
        $data = array();
        foreach($result as $r){
            $d = array();
            $d['question_id'] = $r['question_id'];
            $d['name'] = $r['name'];
            $d['question_content'] = $r['question_id'];
            array_push($data,$d);
        }

        echo json_encode($data);
    }

    public function getQuestionContent(){
        $question_id = I('param.question_id');
        $Dao = M('question');
        $result = $Dao->where("question_id=$question_id")->getField("question_content");

        echo $result;
    }

    public function checkLogin(){
        $data['username'] = I('param.username');
        $data['pwd'] = I('param.password');

        if(!$data['username'] || !$data['pwd']){
            $result['status'] = 'miss info';
            $result['message'] = '缺少有效信息';

            echo json_encode($result);
            exit;
        }

        $Dao = M('teacher');
        $r = $Dao->where($data)->find();

        // var_dump($Dao);

        if($r){
            session('teacher', $r);

            $result['status'] = 'success';
            $result['message'] = '登录成功';
        } else {
            $result['status'] = 'fail';
            $result['message'] = '登录失败';
        }

        echo json_encode($result);
    }

     public function getExamList(){
        $teacher_id = I('param.teacher_id');
        $Dao = M('exam');
        $result = $Dao->where("teacher_id=$teacher_id AND status='finished'")->select();
        $data = array();
        foreach($result as $r){
            $d = array();
            $d['exam_id'] = $r['exam_id'];
            $d['name'] = $r['name'];
            $d['question_id'] = $r['question_id'];
            $d['spend_time'] = $r['spend_time'];
            $d['info'] = $r['exam_id'];
            array_push($data,$d);
        }

        echo json_encode($data);
    }

    public function getProcessingExamList(){
        $teacher_id = I('param.teacher_id');
        $Dao = M('exam');
        $result = $Dao->where("teacher_id=$teacher_id AND status='processing'")->select();
        $data = array();
        foreach($result as $r){
            $d = array();
            $d['exam_id'] = $r['exam_id'];
            $d['name'] = $r['name'];
            $d['question_id'] = $r['question_id'];
            $d['spend_time'] = $r['spend_time'];
            $d['info'] = $r['exam_id'];
            array_push($data,$d);
        }
        echo json_encode($data);
    }
    
    public function getExamInfo(){
        $exam_id = I('param.exam_id');
        $Dao = M('stu_exam');
        $result = $Dao->where("exam_id=$exam_id")->select();

        echo json_encode($result);
    }

    public function endProcessingExam(){
        $exam_id = I('param.exam_id');
        $Dao = M('exam');
        $Dao->status = 'finished';
        $Dao->where("exam_id=$exam_id")->save();
        $result['status'] = 'success';
        $result['message'] = 'finish the exam';

        echo json_encode($result);
    }

    public function arrangeExam(){
        $teacher_id = I('param.teacher_id');
        $exam['question_id'] = I('param.question_id');
        $exam['teacher_id'] = $teacher_id;
        $exam['spend_time'] = I('param.spend_time');
        $exam['name'] = I('param.exam_name');
        $exam['status'] = 'processing';

        $examDao = M('exam');
        $exam_id = $examDao->add($exam);
        
        $studentDao = M('student');
        $stu_examDao = M('stu_exam');
        $students = $studentDao->where("teacher_id=$teacher_id")->select();
        foreach($students as $student){
            $stu_exam['student_id'] = $student['student_id'];
            $stu_exam['student_name'] = $student['name'];
            $stu_exam['exam_id'] = $exam_id;
            $stu_examDao->add($stu_exam);
        }

        $result['status'] = 'ok';
        $result['message'] = 'exam arranged';
        
        echo json_encode($result);
    }

    public function addLetter(){
        $data['student_id'] = I('param.student_id');
        $data['teacher_id'] = session('teacher')['teacher_id'];
        $data['content'] = I('param.content');
        $Model = M('letter');
        $r = $Model->add($data);
        echo json_encode($r);
    }

    public function doLogout(){
        session('teacher',null);
        $this->display('teacher/login');
    }

}

