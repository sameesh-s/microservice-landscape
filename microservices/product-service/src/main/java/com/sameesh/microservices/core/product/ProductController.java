package com.sameesh.microservices.core.product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductController {

    private static final Logger LOG = LoggerFactory.getLogger(ProductController.class);

    @GetMapping("/product")
    String getProduct(){
        String productId = "productId-123212";
        LOG.debug("No recommendations found for productId: {}", productId);
        return productId;
    }

}
