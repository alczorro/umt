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
package cn.vlabs.umt.services.user.service.impl;

import net.duckling.falcon.api.cache.ICacheService;
import cn.vlabs.umt.services.user.bean.AuthorizationCodeBean;
import cn.vlabs.umt.services.user.service.IAuthorizationCodeServer;

public class AuthorizationCodeServer implements IAuthorizationCodeServer {
	private ICacheService cacheService;
	
	public void setCacheService(ICacheService cacheService) {
		this.cacheService = cacheService;
	}

	@Override
	public void save(AuthorizationCodeBean bean) {
		cacheService.set(getCodeKey(bean), bean);
	}

	@Override
	public AuthorizationCodeBean getByCode(String code) {
		
		return (AuthorizationCodeBean)cacheService.get(getCodeKey(code));
	}

	@Override
	public void deleteByCode(String code) {
		cacheService.remove(getCodeKey(code));
	}

	@Override
	public void delete(AuthorizationCodeBean bean) {
		cacheService.remove(getCodeKey(bean));
	}
	private String getCodeKey(String code){
		return code+"-authorizationCode-x";
	}
	private String getCodeKey(AuthorizationCodeBean bean){
		return getCodeKey(bean.getCode());
	}

	@Override
	public boolean isExpired(AuthorizationCodeBean bean) {
		return System.currentTimeMillis()>bean.getExpiredTime().getTime();
	}

	@Override
	public void update(AuthorizationCodeBean bean) {
		delete(bean);
		save(bean);
	}
}