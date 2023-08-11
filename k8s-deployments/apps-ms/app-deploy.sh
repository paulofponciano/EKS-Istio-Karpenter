#!/bin/bash

kubectl apply -f ./00-fluentBit/kubernetes
kubectl apply -f ./01-data-prepper/kubernetes
kubectl apply -f ./02-otel-collector/kubernetes
kubectl apply -f ./03-mysql/kubernetes
kubectl apply -f ./04-analytics-service/kubernetes
kubectl apply -f ./05-databaseService/kubernetes
kubectl apply -f ./06-orderService/kubernetes
kubectl apply -f ./07-inventoryService/kubernetes
kubectl apply -f ./08-paymentService/kubernetes
kubectl apply -f ./09-recommendationService/kubernetes
kubectl apply -f ./10-authenticationService/kubernetes
kubectl apply -f ./11-client/kubernetes
kubectl label namespace client-react istio-injection=enabled --overwrite
kubectl label namespace analytics-service istio-injection=enabled --overwrite
kubectl label namespace authentication-service istio-injection=enabled --overwrite
kubectl label namespace data-prepper istio-injection=enabled --overwrite
kubectl label namespace database-service istio-injection=enabled --overwrite
kubectl label namespace inventory-service istio-injection=enabled --overwrite
kubectl label namespace mysql istio-injection=enabled --overwrite
kubectl label namespace order-service istio-injection=enabled --overwrite
kubectl label namespace otel-collector istio-injection=enabled --overwrite
kubectl label namespace payment-service istio-injection=enabled --overwrite
kubectl label namespace recommendation-service istio-injection=enabled --overwrite