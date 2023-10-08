using DotEnv, Auth0
DotEnv.config()
# access_token = new_mgmt_api_access_token(ENV["AUTH0_DOMAIN"], ENV["AUTH0_CLIENT_ID"], ENV["AUTH0_CLIENT_SECRET"])
user = get_user(ENV["AUTH0_DOMAIN"], ENV["AUTH0_CLIENT_ID"], ENV["AUTH0_CLIENT_SECRET"], ARGS[1])
println(user["email"])
