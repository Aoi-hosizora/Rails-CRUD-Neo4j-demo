class User
  include Neo4j::ActiveNode
  property :user_id, type: Integer
  property :user_name, type: String

  has_many :in, :followers, model_class: :User, rel_class: :Follow
end
