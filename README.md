# EKS-Baseline-with-Istio-Karpenter

    # ISTIO-INGRESS
    # ISTIOD
    # ISTIO-BASE
    # ALB INGRESS CONTROLLER
    # METRICS SERVER
    # EKS ADDONS
    # KARPENTER

    # Prometheus Deploy (Helm)

         helm install prometheus prometheus-community/kube-prometheus-stack --create-namespace --namespace prometheus

    # KIALI Deploy (Helm)

         helm install \
         --namespace istio-system \
         --set server.web_fqdn=kiali.pauloponciano.pro \
         --set external_services.prometheus.url=http://prometheus-kube-prometheus-prometheus.prometheus.svc.cluster.local:9090 \
         --set external_services.grafana.url=http://prometheus-grafana.prometheus.svc.cluster.local:80 \
         --set external_services.tracing.use_grpc=false \
         --set external_services.grafana.enabled=true \
         --set external_services.tracing.enabled=true \
         --set external_services.tracing.in_cluster_url=http://jaeger-query.jaeger.svc.cluster.local:80 \
         --set auth.strategy=anonymous \
         kiali-server \
         kiali/kiali-server

    # ARGOCD Deploy

        kubectl apply -f argocd_ns.yaml
        kubectl apply -n argocd -f argocd_install.yaml
        kubectl apply -n argocd -f argocd_ingress.yaml

        # Adicionar ao ConfigMap (argocd-cmd-params-cm)
        
        kubectl edit cm argocd-cmd-params-cm -n argocd
        
        data:
          server.insecure: 'true'

        # Recuperar password

        kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo