helm repo add cluster-autoscaler https://kubernetes.github.io/autoscaler
kubectl create ns autoscaler
helm upgrade --install cluster-autoscaler cluster-autoscaler/cluster-autoscaler -n autoscaler --values=autoscaler.yml \
  --set autoDiscovery.clusterName="autoscale" \
  --set awsRegion="us-east-2" \
  --set rbac.serviceAccount.annotations."eks\.amazonaws\.com/role-arn"="arn:aws:iam::410793487517:role/autoscale-cluster-autoscaler"
