package com.example.demo;

import org.apache.geode.cache.DataPolicy;
import org.apache.geode.cache.GemFireCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.gemfire.PartitionedRegionFactoryBean;
import org.springframework.data.gemfire.config.annotation.CacheServerApplication;

@SpringBootApplication
@CacheServerApplication
public class DemoApplication {

    @Bean("SampleRegion")
    public PartitionedRegionFactoryBean<?, ?> sampleRegion(GemFireCache gemfireCache) {
        PartitionedRegionFactoryBean<?, ?> sampleRegion = new PartitionedRegionFactoryBean<>();
        sampleRegion.setCache(gemfireCache);
        sampleRegion.setClose(false);
        sampleRegion.setPersistent(false);
        sampleRegion.setName("SampleRegion");
        return sampleRegion;
    }
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
