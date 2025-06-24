#!/bin/bash

echo "Привязка ролей к пользователям..."

# Admin-роль для admin-user
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-binding
subjects:
- kind: User
  name: admin-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: admin-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Viewer-роль для viewer-user
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: viewer-binding
subjects:
- kind: User
  name: viewer-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: viewer-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Editor-роль для editor-user
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: editor-binding
subjects:
- kind: User
  name: editor-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: editor-role
  apiGroup: rbac.authorization.k8s.io
EOF

echo "Привязки созданы:"
echo "- admin-user → admin-role"
echo "- viewer-user → viewer-role"
echo "- editor-user → editor-role"