module Api::UsersControllerDocument
  extend Apipie::DSL::Concern

  api :GET, "/api/users/:id", "User info"
  example <<-EXAM
  http://localhost:3000/api/users/1
  {
    "id": 1,
    "name": "Duc",
    "created_at": "2021-10-23T07:29:45.320Z",
    "updated_at": "2021-10-23T07:29:45.320Z",
    "email": "hoangkimduclqd@gmail.com",
    "authentication_token": "mavZ8bX7JzQfuysaTa17"
  }
  EXAM

  def show; end
end
