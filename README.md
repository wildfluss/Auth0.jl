# Auth0 

Create Machine to Machine application (eg "Backend") and grant it access to Management API and fill in its Client ID , Client Secret in .env , then

```bash
$ julia --project=. demo.jl 'auth0|64f1efcd827779ba96ee54ac'
y@wildfluss.com
```

## References 

Getting mgmt token for prod https://auth0.com/docs/secure/tokens/access-tokens/get-management-api-access-tokens-for-production

```bash
export $(cat .env | xargs) && \
curl --request POST \
  --url "https://$AUTH0_DOMAIN/oauth/token" \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data grant_type=client_credentials \
  --data "client_id=$AUTH0_CLIENT_ID" \
  --data "client_secret=$AUTH0_CLIENT_SECRET" \
  --data "audience=https://$AUTH0_DOMAIN/api/v2/"
```