class Price < ActiveRecord::Base
  def to_param
    id
  end
end