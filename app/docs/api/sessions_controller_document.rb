module Api::SessionsControllerDocument
  extend Apipie::DSL::Concern

  api :POST, "/log_in/", "Log in"
  param "user", Hash, desc: "User login information", require: true do
    param "email", String, desc: "User's email", require: true
    param "password", String, desc: "user's password", require: true
  end
  example <<-EXAM
  {
    "messages": "Signed In Successfully",
    "is_success": true,
    "data": {
        "user": {
            "id": 1,
            "name": "Duc",
            "created_at": "2021-10-19T16:30:11.431Z",
            "updated_at": "2021-10-19T16:30:11.431Z",
            "email": "hoangkimduclqd@gmail.com",
            "authentication_token": "szySk3kYrUJ1Yd7bvTtB"
        }
    }
  }
  EXAM

  def create; end
end
