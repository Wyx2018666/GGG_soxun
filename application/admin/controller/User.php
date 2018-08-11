<?php
namespace app\admin\controller;
use app\admin\model\User as UserModel;
use app\admin\controller\Common;
class User extends Common
{

    public function lst()
    {
        $auth=new Auth();
        $admin=new UserModel();
        $adminres=$admin->getadmin();
        foreach ($adminres as $k => $v) {
            $_groupTitle=$auth->getUserGroups($v['id']);
            $groupTitle=$_groupTitle[0]['title'];
            $v['groupTitle']=$groupTitle;
        }
        $this->assign('adminres',$adminres);
        return view();
	}
	//代理申请
    public function dlsq()
    {
        $user=db("user")->select();
        $this->assign('user',$user);
        return view();
    }
    //代理申请通过
    public function dlsqOk($id)
    {
        $dlsq=new UserModel();
        $status=$dlsq->update(['id' => $id, 'status' => '1']);
        if($status){
            $this->success('申请代理通过！',url("user/dlsq"));
        }
    }
    public function dlsqNo($id)
    {
        $dlsq=new UserModel();
        $status=$dlsq->update(['id' => $id, 'status' => '2']);
        if($status){
            $this->success('代理申请已拒绝！',url("user/dlsq"));
        }
    }

	public function add()
    {
        if(request()->isPost()){
            $data=input('post.');
            $validate = \think\Loader::validate('User');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $admin=new UserModel();
            if($admin->addadmin($data)){
                $this->success('添加管理员成功！',url('lst'));
            }else{
                $this->error('添加管理员失败！');
            }
            return;
        }
        $authGroupRes=db('user_group')->select();
        $this->assign('authGroupRes',$authGroupRes);
        return view();
	}

	public function edit($id)
    {
        $admins=db('user')->find($id);

        if(request()->isPost()){
            $data=input('post.');
            $validate = \think\Loader::validate('User');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            $admin=new UserModel();
            $savenum=$admin->saveadmin($data,$admins);
            if($savenum == '2'){
                $this->error('管理员用户名不得为空！');
            }
            if($savenum !== false){
                $this->success('修改成功！',url('lst'));
            }else{
                $this->error('修改失败！');
            }
            return;
        }
        
        if(!$admins){
            $this->error('该管理员不存在');
        }
        $authGroupAccess=db('user_group_access')->where(array('uid'=>$id))->find();
        $authGroupRes=db('user_group')->select();
        $this->assign('authGroupRes',$authGroupRes);
        $this->assign('admin',$admins);
        $this->assign('groupId',$authGroupAccess['group_id']);
        return view();
	}

    public function del($id){
        $admin=new UserModel();
        $delnum=$admin->deladmin($id);
        if($delnum == '1'){
            $this->success('删除管理员成功！',url('lst'));
        }else{
            $this->error('删除管理员失败！');
        }
    }

    public function logout(){
        session(null); 
        $this->success('退出系统成功！',url('login/index'));
    }













}
