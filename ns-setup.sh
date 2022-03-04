echo "Create 'education' namespace"
vault namespace create education 

echo ""
echo "Create 'education/training' namespace"
vault namespace create -namespace=education training

echo ""
echo "Create 'education/certification' namespace"
vault namespace create -namespace=education certification

echo ""
echo "Create 'education/training/security-edu' namespace"
vault namespace create -namespace=education/training security-edu

echo ""
echo "Create 'education/training/security-edu/vault-edu' namespace"
vault namespace create -namespace=education/training/security-edu vault-edu

echo ""
echo "Create 'education/training/consul-edu' namespace"
vault namespace create -namespace=education/training consul-edu

echo ""
echo "Enable kv-v2 secrets engine at 'team-consul' under education/training namespace"
vault secrets enable -namespace=education/training -path="team-consul" -description="key/value data for Consul Edu" kv-v2 

echo ""
echo "Enable kv-v2 secrets engine at 'team-vault' under education/training namespace"
vault secrets enable -namespace=education/training -path="team-vault" -description="key/value data for Vault Edu" kv-v2

echo ""
echo "Create some test data at team-consul/cert"
VAULT_NAMESPACE=education/training vault kv put team-consul/cert expiration="April 1, 2023" domain="hashicorp.com"

echo ""
echo "Create some test data at team-vault/blogs"
VAULT_NAMESPACE=education/training vault kv put team-vault/blogs title="What's New in Vault 1.10" publish_date="March 23, 2022"

echo ""
echo "Enable userpass auth method at 'userpass-cert' in the 'education' namespace"
vault auth enable -namespace=education -path="userpass-cert" userpass

echo ""
echo "Create a user, 'bob' in the userpass-cert auth"
vault write -namespace=education auth/userpass-cert/users/bob password="change@me" token_ttl=1h token_max_ttl=24h


