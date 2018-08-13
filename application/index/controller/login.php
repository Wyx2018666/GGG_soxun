<?php

/**
 * Created by PhpStorm.
 * User: Master_W
 * Date: 2018/8/11
 * Time: 11:27
 */

namespace app\index\controller;

use think\controller;
use think\View;
use think\Db;
use think\cookie;
use think\session;

class login extends Controller
{
    public function login()
    {
        if (Request::instance()->isPost()) { //判断是否是是否为 POST 请求
            $data = input('post.');
            $username = $data['uname'];
            $password = md5($data['password']);
            $captcha = $data['captcha'];
            //调用验证器
            $validate = Loader::validate('Login');
            $data = ['username' => $username, 'password' => $password, 'captcha' => $captcha];
            //验证是否符合验证器里定义(验证码)的规范,不符合返回错误信息
            if (!$validate->check($data)) {
                return json($validate->getError());
            }
            //查询数据试库
            $where['uname'] = $username;
            $where['status'] = 1;
            $userInfo = Db::name('admin')->where($where)->find();
            if ($userInfo && $userInfo['password'] === $password) {
                //登录成功写入session
                Session::set('admin_id', $userInfo['id']);
                Session::set('admin_name', $userInfo['uname']);
                return json('jr');
            } else {
                return json('用户名或密码错误!');
            }
        } else {
            return $this->fetch('login');
        }
    }
}