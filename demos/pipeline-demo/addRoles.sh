oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:ci-cd -n dev
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:ci-cd -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:qa -n dev
oc create deploymentconfig welcome --image=docker-registry.default.svc:5000/dev/welcome:promoteToQA -n qa
oc expose dc welcome --port=8080 -n qa
oc expose svc welcome  -n qa
