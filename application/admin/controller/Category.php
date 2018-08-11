<?php
namespace app\admin\controller;
use app\admin\model\Category as CategoryModel;
use app\admin\model\Article as ArticleModel;
use app\admin\controller\Common;
class category extends Common
{

    protected $beforeActionList = [
        // 'first',
        // 'second' =>  ['except'=>'hello'],
        'delsoncategory'  =>  ['only'=>'del'],
    ];


    public function lst()
    {

        $category=new CategoryModel();
        if(request()->isPost()){
            $sorts=input('post.');
            foreach ($sorts as $k => $v) {
                $category->update(['id'=>$k,'sort'=>$v]);
            }
            $this->success('更新排序成功！',url('lst'));
            return;
        }
        $categoryres=$category->catetree();
        $this->assign('categoryres',$categoryres);
        return view();
	}

    public function add(){
        $category=new categoryModel();
        if(request()->isPost()){
            $data=input('post.');
           /* $validate = \think\Loader::validate('category');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }*/
           $add=$category->save($data);
           if($add){
                $this->success('添加栏目成功！',url('lst'));
           }else{
                $this->error('添加栏目失败！');
           }
        }
        $categoryres=$category->catetree();
        $this->assign('categoryres',$categoryres);
        return view();
    }

    public function edit(){
        $category=new categoryModel();
        if(request()->isPost()){
            $data=input('post.');
            /*$validate = \think\Loader::validate('category');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }*/
            $save=$category->save($data,['id'=>$data['id']]);
            if($save !== false){
                $this->success('修改栏目成功！',url('lst'));
            }else{
                $this->error('修改栏目失败！');
            }
            return;
        }
        $categorys=$category->find(input('id'));
        $categoryres=$category->catetree();
        $this->assign(array(
            'categoryres'=>$categoryres,
            'categorys'=>$categorys,
            ));
        return view();
    }

    public function del(){
        $del=db('category')->delete(input('id'));
        if($del){
            $this->success('删除栏目成功！',url('lst'));
        }else{
            $this->error('删除栏目失败！');
        }
    }

    public function delsoncategory(){
        $cateid=input('id'); //要删除的当前栏目的id
        $category=new categoryModel();
        $sonids=$category->getchilrenid($cateid);
        $allcateid=$sonids;
        $allcateid[]=$cateid;
        foreach ($allcateid as $k=>$v) {
            $article=new ArticleModel;
            $article->where(array('cateid'=>$v))->delete();
        }
        if($sonids){
        db('category')->delete($sonids);
        }
    }



   

	












}
