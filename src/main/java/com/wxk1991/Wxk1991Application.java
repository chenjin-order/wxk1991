package com.wxk1991;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wxk1991.mapper")
public class Wxk1991Application {

    public static void main(String[] args) {
        SpringApplication.run(Wxk1991Application.class, args);
    }

}
