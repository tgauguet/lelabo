class ProviderPrice < ActiveRecord::Base
  belongs_to :providers
  belongs_to :ingredients
end
