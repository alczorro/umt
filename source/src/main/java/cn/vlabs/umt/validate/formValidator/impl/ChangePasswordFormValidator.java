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
package cn.vlabs.umt.validate.formValidator.impl;

import javax.servlet.http.HttpServletRequest;

import cn.vlabs.umt.validate.domain.ErrorMsg;
import cn.vlabs.umt.validate.domain.ErrorMsgs;
import cn.vlabs.umt.validate.formValidator.FormValidator;
import cn.vlabs.umt.validate.validator.ValidatorFactory;

/**
 * 更改密码验证器
 * @author lvly
 * @since 2013-1-21
 */
public class ChangePasswordFormValidator extends FormValidator{
	/**
	 * 构造方法
	 * @param request http请求，主要用来获取表单信息，和bean
	 * */
	public ChangePasswordFormValidator(HttpServletRequest request){
		setRequest(request);
	}
	@Override
	public ErrorMsgs validateForm() {
		ErrorMsgs errors=new ErrorMsgs();
		this.validatePassword(errors,"password");
		validateRepassword(errors,"retype","password");
		setMsgs(errors);
		if(!errors.isPass()){
			errorToRequest();
		}
		return errors;
	}
	/**
	 * 重写，因为，这里的key有些不同
	 * */
	@Override
	protected void validatePassword(ErrorMsgs errors,String name){
		String password=getRequest().getParameter(name);
		if(!ValidatorFactory.getRequiredValidator().validate(password)){
			errors.addMsg(new ErrorMsg(name,"common.validate.newpassword.required"));
			return;
		}
		if(!ValidatorFactory.getMinLengthValidator(8).validate(password)){
			errors.addMsg(new ErrorMsg(name,"common.validate.password.minlength"));
			return;
		}
	}

}