kind delete cluster --name jx && \
kind create cluster --name jx && \
kubectl create namespace jx && \

# then run interactive
# jxl boot secrets edit --git-url https://github.com/DerekStrickland/environment-jx-dev.git

# then run interactive
# jxl boot run

# Output tells you to access this way but all failed
# export HTTP_NODE_PORT=$(kubectl --namespace nginx get services -o jsonpath="{.spec.ports[0].nodePort}" nginx-ingress-controller)
# export HTTPS_NODE_PORT=$(kubectl --namespace nginx get services -o jsonpath="{.spec.ports[1].nodePort}" nginx-ingress-controller)
# export NODE_IP=$(kubectl --namespace nginx get nodes -o jsonpath="{.items[0].status.addresses[1].address}")

# echo "Visit http://$NODE_IP:$HTTP_NODE_PORT to access your application via HTTP."
# echo "Visit https://$NODE_IP:$HTTPS_NODE_PORT to access your application via HTTPS."

# Probably because no ingress created like so

# apiVersion: extensions/v1beta1
# kind: Ingress
# metadata:
#   annotations:
#     kubernetes.io/ingress.class: nginx
#   name: example
#   namespace: foo
# spec:
#   rules:
#     - host: www.example.com
#       http:
#         paths:
#           - backend:
#               serviceName: exampleService
#               servicePort: 80
#             path: /
#   # This section is only required if TLS is to be enabled for the Ingress
#   tls:
#       - hosts:
#           - www.example.com
#         secretName: example-tls

# If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

# apiVersion: v1
# kind: Secret
# metadata:
#   name: example-tls
#   namespace: foo
# data:
#   tls.crt: <base64 encoded cert>
#   tls.key: <base64 encoded key>
# type: kubernetes.io/tls


# Output ultimately failed with this message
# FAILED RELEASES:
# NAME
# jxui
# in ./helmfile.yaml: failed processing release jxui: helm exited with status 1:
#   Error: unable to build kubernetes objects from release manifest: unable to recognize "": no matches for kind "Deployment" in version "extensions/v1beta1"
# error: failed to interpret pipeline file /environment-jx-dev/jenkins-x.yml: failed to run '/bin/sh -c helmfile sync' command in directory '/environment-jx-dev/apps', output: ''
