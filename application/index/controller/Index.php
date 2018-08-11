<?php
namespace app\index\controller;
use think\Controller;
use app\Index\model\User;
class Index extends Controller
{
    public function index()
    {
        if(request()->isPost()){
            $this->check(input('code'));
            $admin=new User();
            $num=$admin->login(input('post.'));
            if($num==1){
                $this->error('用户不存在！');
            }
            if($num==2){
                $this->success('登录成功！',url('index/index2'));
            }
            if($num==3){
                $this->error('密码错误！');
            }
            return;
        }
        return view("login");
    }
    public function index2()
    {
        return view("index");
    }
    public function logout(){
        session(null);
        $this->success('退出系统成功！',url('index/index'));
    }
    // 验证码检测
    public function check($code='')
    {
        if (!captcha_check($code)) {
            $this->error('验证码错误');
        } else {
            return true;
        }
    }
}
