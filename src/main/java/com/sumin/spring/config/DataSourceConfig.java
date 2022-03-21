package com.sumin.spring.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.sumin.spring.util.DateFormatter;

//@EnableAspectJAutoProxy
//@ComponentScan(basePackages = "com.test.a")
@Configuration
@EnableTransactionManagement
public class DataSourceConfig {
	
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/spring_web");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		return dataSource;
	}
    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
	@Bean
	public JdbcTemplate db(BasicDataSource source) {
		return new JdbcTemplate(source);
	}

	@Bean
	public DateFormatter dataFormatter() {
		return new DateFormatter();
	}
	
}
