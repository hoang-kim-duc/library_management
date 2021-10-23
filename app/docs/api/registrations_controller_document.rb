module Api::RegistrationsControllerDocument
  extend Apipie::DSL::Concern

  api :POST, "/sign_up/", "Sign up"
  param "user", Hash, desc: "User login information", require: true do
    param "email", String, desc: "User's email", require: true
    param "name", String, desc: "User's name", require: true
    param "password", String, desc: "user's password", require: true
    param "password_confirmation", String, desc: "Password confirmation", require: true
  end
  example <<-EXAM
  {
    "messages": "Sign Up Successfully",
    "is_success": true,
    "data": {
        "user": {
            "id": 2,
            "name": "Duc",
            "created_at": "2021-10-19T17:10:15.268Z",
            "updated_at": "2021-10-19T17:10:15.268Z",
            "email": "hoangkimduclqd@gmail.comm",
            "authentication_token": "6fk42fsmcteDMd3Xa1xS"
        }
    }
  }
  EXAM

  def create; end
end
