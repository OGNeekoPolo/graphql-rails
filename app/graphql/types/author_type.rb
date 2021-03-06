Types::AuthorType = GraphQL::ObjectType.define do
  name 'AuthorType'

  field :first_name, !types.String
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, types.ID

  # Custom Fields
  field :full_name, types.String do
    description 'The full name of the author'
    resolve ->(o, _, _) { [o.first_name, o.last_name].compact.join(' ') }
  end

  field :coordinates, Types::PairType do
    description 'The coordinates of the author'
  end

  field :publication_years, types[types.Int]
end