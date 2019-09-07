class User
  include Neo4j::ActiveNode
  self.mapped_label_name = "User"

  property :user_id, type: Integer
  property :user_name, type: String

  has_many :in, :followers, rel_class: :Follow
  has_many :out, :followings, rel_class: :Follow
end
