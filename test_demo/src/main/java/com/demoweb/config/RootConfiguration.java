package com.demoweb.config;

import com.demoweb.mapper.BoardMapper;
import com.demoweb.repository.BoardAttachRepository;
import com.demoweb.repository.BoardRepository;
import com.demoweb.repository.LoginAttemptRepository;
import com.demoweb.repository.MemberRepository;
import com.demoweb.service.*;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.support.TransactionTemplate;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = { "com.demoweb.mapper" }) // root-context.xml의 <mybatis:scan의 역할과 동일
@EnableTransactionManagement // <tx:annotation-driven과 같은 역할
public class RootConfiguration {

	// application.properties의 정보를 읽어서 저장하는 객체
	@Autowired
	Environment env;

	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.hikari") // Environment 객체에 저장된 속성 중에서, spring.datasource.hikari로 시작하는 속성을 적용
	HikariConfig hikariConfig(){
		HikariConfig config = new HikariConfig();
		return config;
	}


	@Bean
	public DataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource(hikariConfig());
		return dataSource;
	}

	
	
	@Bean SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		factoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
		return factoryBean.getObject();
	}
	
	
	@Bean AccountService accountService(MemberRepository memberRepository) throws Exception {
		AccountServiceImpl accountService = new AccountServiceImpl();
		accountService.setMemberRepository(memberRepository);
		return accountService;
	}
	
	@Bean BoardService boardService(BoardMapper boardMapper, BoardRepository boardRepository, BoardAttachRepository boardAttachRepository) throws Exception {
		BoardServiceImpl boardService = new BoardServiceImpl();
		boardService.setBoardMapper(boardMapper);
		boardService.setBoardRepository(boardRepository);
		boardService.setBoardAttachRepository(boardAttachRepository);
		boardService.setTransactionTemplate(transactionTemplate()); // 이렇게 메서드로 불러도 되고, 매퍼처럼 전달인자로 받아도됨!!
		return boardService;
	}
	
	@Bean LoginAttemptService loginAttemptService(LoginAttemptRepository loginAttemptRepository) throws Exception {
		LoginAttemptServiceImpl loginAttemptService = new LoginAttemptServiceImpl();
		loginAttemptService.setLoginAttemptRepository(loginAttemptRepository);
		return loginAttemptService;
	}


	// Transaction Bean 등록
	@Bean
	PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
		transactionManager.setDataSource(dataSource());
		
		return transactionManager;
	}
	
	@Bean
	TransactionTemplate transactionTemplate() {
		TransactionTemplate transactionTemplate = new TransactionTemplate();
		transactionTemplate.setTransactionManager(transactionManager());
		
		return transactionTemplate;
	}
	
}







