package com.example.ncs;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@MapperScan(value={"com.example.ncs.mapper"}) // Mapper 인터페이스를 인식할 수 있도록 설정
public class NcsApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcsApplication.class, args);
	}

	// SqlSessionFactory 설정
	@Bean // 스프링에 필요한 객체를 생성
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		// sqlSessionFactory() : MyBatis의 SqlSessionFactory를 반환해 줌
		// 스프링 부트가 실행할 때 DataSource 객체를 이 메서드 실행시 주입해서 결과를 만들고, 그 결과를 스프링 내 빈으로 사용

		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

		sessionFactory.setDataSource(dataSource);
		return sessionFactory.getObject();

	}

}