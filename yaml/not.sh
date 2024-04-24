caBundle=$(kubectl get validatingWebhookConfiguration notification-manager-validating-webhook -o jsonpath='{.webhooks[0].clientConfig.caBundle}')
cat > /tmp/patch.yaml <<EOF
spec:
  conversion:
    webhook:
      clientConfig:
        caBundle: ${caBundle}
        service:
          namespace: kubesphere-monitoring-system
EOF
kubectl patch crd configs.notification.kubesphere.io --type=merge --patch-file /tmp/patch.yaml
kubectl patch crd receivers.notification.kubesphere.io --type=merge --patch-file /tmp/patch.yaml