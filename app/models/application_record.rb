class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def default_user
    User.first
  end
end
