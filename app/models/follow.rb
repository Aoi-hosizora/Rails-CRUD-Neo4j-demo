class Follow
  include Neo4j::ActiveRel
  from_class :User
  to_class :User
end
