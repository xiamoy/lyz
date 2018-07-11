package com.lyz.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.service.ProductService;
import com.lyz.util.CommonUtils;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations={"classpath:spring-mvc.xml","classpath:spring-mybatis.xml",
		"classpath:mybatis-config.xml"}) 
@Transactional 
public class ProductServiceTest {

	@Resource
	private ProductService productService;
	
	@Test
	public void testFindProduct(){
		int pid=6;
		System.out.println("test find product of "+pid);
		for(int i=0;i<3;i++){
			System.out.println("query count "+i+":"+productService.findProductById(pid));
		}
	}
}
