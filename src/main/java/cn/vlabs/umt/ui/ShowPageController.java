/*
 * Copyright (c) 2008-2016 Computer Network Information Center (CNIC), Chinese Academy of Sciences.
 * 
 * This file is part of Duckling project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 */
package cn.vlabs.umt.ui;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.vlabs.umt.common.util.RequestUtil;
import cn.vlabs.umt.services.session.SessionUtils;

/**
 * 显示一些提示信息的时候用，跳到某个页面，如果没有这一层，国际化切换就会出问题，
 * 也会重复提交
 * @author lvly
 * @since 2013-3-15
 */
@Controller
@RequestMapping("/show.do")
public class ShowPageController{
	/**
	 * 拦截到的未激活用户
	 * @parameter type 用户的来源，umt，coreMail，weibo，qq等
	 * @parameter oper 操作触发类型，login，regist等
	 * @parameter sendMail 发送邮件
	 * */
	@RequestMapping(params="act=showFilterActive")
	public String showFilterActive(HttpServletRequest request,
			HttpServletResponse response) {
		if(SessionUtils.getUser(request)==null){
			return "redirect:/login";
		}
		setParam2Attribute(request,"type");
		setParam2Attribute(request,"oper");
		setParam2Attribute(request,"sendEmail");
		return "/create_success_message";
	}
	/**
	 * 显示消息
	 * @parameter message 
	 * */
	@RequestMapping(params="act=showMessage")
	public String showMessage(HttpServletRequest request,
			HttpServletResponse response){
		setParam2Attribute(request,"message");
		return "/message";
	}
	/**
	 * 修改成功发送辅助邮箱
	 * @param email 发送成功的email
	 * @param title 显示的动态标题
	 * @param type 类型  辅助邮箱，登陆邮箱之类的
	 * */
	@RequestMapping(params="act=showSendSuccess")
	public String showSendSuccess(HttpServletRequest request,
			HttpServletResponse response) {
		setParam2Attribute(request,"email");
		setParam2Attribute(request, "type");
		setParam2Attribute(request,"title");
		return "/sendActiveEmail";
	}
	public static String getSendSuccessUrl(HttpServletRequest request,String email,String type,String title){
		String url=RequestUtil.getContextPath(request)+"/show.do?act=showSendSuccess";
		url=RequestUtil.addParam(url, "email", email);
		url=RequestUtil.addParam(url, "type", type);
		url=RequestUtil.addParam(url, "title", title);
		return url;
	}

	public static String getMessageUrl(HttpServletRequest request,String message){
		String url=RequestUtil.getContextPath(request)+"/show.do?act=showMessage";
		url=RequestUtil.addParam(url, "message", message);
		return url;
	}
	private void setParam2Attribute(HttpServletRequest request,String key){
		request.setAttribute(key, request.getParameter(key));
	}
}