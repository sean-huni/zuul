package io.sciro.zuul;

import brave.sampler.Sampler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;

/**
 * PROJECT   : zuul
 * PACKAGE   : io.sciro.zuul
 * USER      : sean
 * DATE      : 18-Tue-Sep-2018
 * TIME      : 22:58
 * E-MAIL    : kudzai@bcs.org
 * CELL      : +27-64-906-8809
 */
@EnableHystrix
@EnableZuulProxy
@EnableDiscoveryClient
@SpringBootApplication
public class ZuulApp {
    public static void main(String[] args) {
        SpringApplication.run(ZuulApp.class, args);
    }

    @Bean
    public Sampler defaultSampler() {
        return Sampler.ALWAYS_SAMPLE;
    }
}
