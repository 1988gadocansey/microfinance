/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gadeksystems.banking.config;

import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 *
 * @author Nyame Tease
 */

@EnableJpaAuditing(auditorAwareRef="auditorProvider")
public class PersistenceConfig {
     
  
     
//    @Bean
//    AuditorAware<String> auditorProvider() {
//        return new AuditorAwareImpl();
//    }
//     
    
     
}