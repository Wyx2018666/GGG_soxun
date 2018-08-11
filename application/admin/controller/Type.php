<?php
namespace app\admin\controller;
use app\admin\model\Type as TypeModel;
use app\admin\controller\Common;
class Type extends Common
{



    public function lst()
    {
        $link=new TypeModel();
        if(request()->isPost()){
            $sorts=input('post.');
            foreach ($sorts as $k => $v) {
                $link->update(['id'=>$k,'sort'=>$v]);
            }
            $this->success('更新排序成功！',url('lst'));
            return;
        }
        $linkres=$link->order('sort desc')->paginate(3);
        $this->assign('linkres',$linkres);
        return view();
	}

    public function add(){
        if(request()->isPost()){
            $data=input('post.');
/*            $validate = \think\Loader::validate('Link');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }*/
            $add=db('type')->insert($data);
            if($add){
                $this->success('添加商品类型成功！',url('lst'));
            }else{
                $this->error('添加商品类型失败！');
            }
        }
        return view();
    }

    public function edit(){
        if(request()->isPost()){
            $data=input('post.');
         /*   $validate = \think\Loader::validate('Link');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }*/
            $link=new TypeModel();
            $save=$link->save($data,['id'=>$data['id']]);
            if($save !== false){
                $this->success('修改商品类型成功！',url('lst'));
            }else{
                $this->error('修改商品类型失败！');
            }
            return;
        }
        $links=TypeModel::find(input('id'));
        $this->assign('links',$links);
        return view();
    }

    public function del(){
        $del=TypeModel::destroy(input('id'));
        if($del){
           $this->success('删除商品类型成功！',url('lst'));
        }else{
            $this->error('删除商品类型失败！');
        }
    }

    




   

	












}
