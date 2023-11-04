package com.lfa.db.liquibase.demo.liquibase.controller;

import liquibase.Liquibase;
import liquibase.database.DatabaseConnection;
import liquibase.database.jvm.JdbcConnection;
import liquibase.exception.LiquibaseException;
import liquibase.integration.spring.SpringLiquibase;
import liquibase.integration.spring.SpringResourceAccessor;
import liquibase.resource.ResourceAccessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

@RestController
public class LiquibaseController {
    @Autowired
    private SpringLiquibase springLiquibase;

    @GetMapping("/rollbackLiquibase")
    public String rollbackLiquibase(String tag){
        try {
            ResourceAccessor resourceAccessor = new SpringResourceAccessor(springLiquibase.getResourceLoader());
            DatabaseConnection connection = new JdbcConnection(springLiquibase.getDataSource().getConnection());
            Liquibase liquibase = new Liquibase(springLiquibase.getChangeLog(), resourceAccessor, connection);
            liquibase.rollback(tag, springLiquibase.getContexts());
            liquibase.close();
        } catch (SQLException | LiquibaseException e) {
            throw new RuntimeException(e);
        }
        return "Ok";
    }
}
