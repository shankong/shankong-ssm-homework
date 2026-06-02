package com.shankong.config;

import org.apache.ibatis.datasource.pooled.PooledDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.shankong.service")
@MapperScan("com.shankong.mapper")
public class DataServiceConfiguration {

    @Bean
    public DataSource dataSource() {
        return new PooledDataSource(
                "com.mysql.cj.jdbc.Driver",
                "jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai",
                "root",
                "123456");
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources("classpath*:com/shankong/mapper/*.xml"));
        // MyBatis 全局设置（下划线转驼峰 + SQL日志）
        sqlSessionFactoryBean.setConfigLocation(
                new ClassPathResource("mybatis-config.xml"));
        return sqlSessionFactoryBean;
    }
}
