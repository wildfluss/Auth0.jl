module Auth0

using DotEnv, HTTP, JSON, URIs

export new_mgmt_api_access_token, get_user

function new_mgmt_api_access_token(AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET, )
    body = Dict("grant_type" => "client_credentials",
    "client_id" => AUTH0_CLIENT_ID,
    "client_secret" => AUTH0_CLIENT_SECRET,
    "audience" => "https://" * AUTH0_DOMAIN * "/api/v2/")
    # println(body)
        u = URI("https://" * AUTH0_DOMAIN * "/oauth/token")
    resp = HTTP.request("POST", string(u),
        Dict("content-type" => "application/x-www-form-urlencoded");
        body=body)
    jobj = JSON.Parser.parse(String(resp.body))
    access_token = jobj["access_token"]
        
    return access_token
end

function get_user(AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET, userId)
    access_token = new_mgmt_api_access_token(AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET)

    headers = Dict("Authorization"=>"Bearer "*access_token, "content-type"=>"application/json")

    # url encode maybe
    u = URI("https://"*AUTH0_DOMAIN*"/api/v2/users/"*userId)
    resp = HTTP.request("GET", string(u), headers)
    # println(resp)
    
    user = JSON.Parser.parse(String(resp.body))
    # println(user["email"])
    return user
end

end # module Auth0
