library(httr)

q2q1 <- function  (url, repo)
{
  # 1. Find OAuth settings for github:
  #    http://developer.github.com/v3/oauth/
  oauth_endpoints("github")
  
  # 2. Register an application at https://github.com/settings/applications
  #    Insert your values below - if secret is omitted, it will look it up in
  #    the GITHUB_CONSUMER_SECRET environmental variable.
  #
  #    Use http://localhost:1410 as the callback url
  myapp <- oauth_app("github", "83efd79b5f21afffe177", 
                     secret='339341073e53105fb592404d05db9f0bec369a32')
  
  # 3. Get OAuth credentials
  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
  
  # 4. Use API
  req <- GET(url, config(token = github_token))
  stop_for_status(req)
  js <- content (req)
  mask <- sapply (js, function (x) x$name == repo)
  js[mask][[1]]$created_at
}