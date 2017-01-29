require_relative '../data_mapper_setup'
require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_body, Text
  property :peep_time, DateTime

  belongs_to :maker

end
