module Api::CategoriesControllerDocument
  extend Apipie::DSL::Concern

  api :GET, "/categories", "List categories"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  example <<-EXAM
  [
    {
        "id": 1,
        "name": "Detective and Mystery"
    },
    {
        "id": 2,
        "name": "Novel"
    },
    {
        "id": 3,
        "name": "Comic Book"
    },
    {
        "id": 4,
        "name": "Action"
    },
    {
        "id": 5,
        "name": "Adventure"
    }
  ]
  EXAM
  def index; end
end
