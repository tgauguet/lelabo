class ProviderPrice < ActiveRecord::Base
  belongs_to :provider, :class_name => 'Provider', :foreign_key => 'provider_id'
  belongs_to :ingredient
  belongs_to :user
end
