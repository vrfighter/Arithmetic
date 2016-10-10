<?php
namespace Home\Controller;
use Think\Controller;
class UploadController extends Controller {

  public function uploadexcel(){
    if (($_FILES["file"]["type"] == "application/vnd.ms-excel")) {
        if ($_FILES["file"]["error"] > 0) {
            echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
            $this->error($_FILES["file"]["error"]);
        } else {
          $path = DOC_ROOT .'/Public/upload/'.$_FILES["file"]["name"];
          move_uploaded_file(realpath($_FILES["file"]["tmp_name"]), $path);
          // 操作excel
          Vendor("PHPExcel.IOFactory"); 
          $objPHPExcel = \PHPExcel_IOFactory::load($path);
          $objPHPExcel->setActiveSheetIndex(0);
          $data = array();
          $question_content = array();
          foreach ($objPHPExcel->getActiveSheet()->getRowIterator() as $row) {
              $line = $row->getRowIndex();
              if($line < 1){
                  continue;
              }

              //unset($question);
              //unset($data);

              $cellIterator = $row->getCellIterator();
              $cellIterator->setIterateOnlyExistingCells(true); 
              // var_dump($cellIterator);
              foreach ($cellIterator as $cell) { 
                  if (!is_null($cell)) {
                      $liename = $cell->getCoordinate();

                      if($liename[0] === 'A'){
                          $question['text'] = $cell->getCalculatedValue();
                      } else if($liename[0] === 'B'){
                          $question['answer'] = $cell->getCalculatedValue();
                      } 
                  }
              }
              array_push($question_content, $question);
          }
          $data['question_content'] = json_encode($question_content);
          $data['teacher_id'] = session('teacher')['teacher_id'];
          $data['name'] = I('param.question_name');
          $data['public'] = 'true';
          $Dao = M('question');
          $r = $Dao->add($data);

          if(!$r){
            echo json_encode($data);
            //$this->error('导入失败！');
          }
  				
          $this->success('成功导入'.$line.'条题目！');
          unlink($path);
        }
    }else {
        var_dump($_FILES["file"]);
        $this->error('文件信息错误');
    }
  }
}
