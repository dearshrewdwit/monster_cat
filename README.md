Has 3 main models : workshops, users and feedback.

Has corresponding datbase tables (psql database)
User columns:
id
created_at
updated_at
email
username
avatar_url
uid
provider
oauth_token
admin

Workshop columns:
id
name
url
created_at
updated_at
description
image_url

Feedback columns:
id
workshop_id
user_id
created_at
updated_at
body

Many to one realationships between user and feedback and workshop and feedback.

Users have an account- sign in via github
Users can look at workshops
Users can give feedback to workshops.
