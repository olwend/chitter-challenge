class Peep
  include DataMapper::Resource

  property :id, Serial
  property :handle, String
  property :peep_body, Text
  property :peep_time, DateTime

  belongs_to :maker
end
