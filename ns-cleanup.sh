echo "Delete 'education/training/security-edu/vault-edu' namespace"
vault namespace delete -namespace=education/training/security-edu vault-edu

echo ""
echo "Delete 'education/training/security-edu' namespace"
vault namespace delete -namespace=education/training security-edu 

echo ""
echo "Delete 'education/training/consul-edu' namespace"
vault namespace delete -namespace=education/training consul-edu

echo "Delete 'education/certification' namespace"
vault namespace delete -namespace=education certification

echo ""
echo "Delete 'education/training' namespace"
vault namespace delete -namespace=education training

echo ""
echo "Delete 'education' namespace"
vault namespace delete education 

