#!/usr/bin/env bash

mkdir microservices
cd microservices

spring init \
--boot-version=2.6.6 \
--build=gradle \
--java-version=1.11 \
--packaging=jar \
--name=product-service \
--package-name=com.sameesh.microservices.core.product \
--groupId=com.sameesh.microservices.core.product \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
product-service

spring init \
--boot-version=2.6.6 \
--build=gradle \
--java-version=1.11 \
--packaging=jar \
--name=review-service \
--package-name=com.sameesh.microservices.core.review \
--groupId=com.sameesh.microservices.core.review \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
review-service

spring init \
--boot-version=2.6.6 \
--build=gradle \
--java-version=1.11 \
--packaging=jar \
--name=recommendation-service \
--package-name=com.sameesh.microservices.core.recommendation \
--groupId=com.sameesh.microservices.core.recommendation \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
recommendation-service

spring init \
--boot-version=2.5.2 \
--build=gradle \
--java-version=1.11 \
--packaging=jar \
--name=product-composite-service \
--package-name=com.sameesh.microservices.composite.product \
--groupId=com.sameesh.microservices.composite.product \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
product-composite-service

cd ..
