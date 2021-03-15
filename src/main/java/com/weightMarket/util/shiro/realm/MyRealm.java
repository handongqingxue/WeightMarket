package com.weightMarket.util.shiro.realm;

import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.weightMarket.dao.AdminMapper;
import com.weightMarket.entity.Admin;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	private AdminMapper adminMapper;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		Admin msg=(Admin)SecurityUtils.getSubject().getPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(); 
		if(msg.getId()==null) {
			return info;
		}
		try {
			Set<String> roleNames =null;//roleService.getRoleListByUserId(msg.getId());  
			Set<String> permissions =null;//roleService.getPermissionByUserId(msg.getPermissionId());
			info.setRoles(roleNames);
			info.setStringPermissions(permissions);
			return info; 
		}catch (Exception e) {
			e.printStackTrace();
			return info;
		}
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		Admin msg=new Admin(token.getUsername(),String.valueOf(token.getPassword()));
		Admin resultMsg=adminMapper.getAdmin(msg);
		if(token.getUsername().equals(resultMsg.getUserName())
				&&
				String.valueOf(token.getPassword()).equals(resultMsg.getPassword())){
			return new SimpleAuthenticationInfo(resultMsg,resultMsg.getPassword(),resultMsg.getUserName());
		}else{
			throw new AuthenticationException();
		}
	}

}
