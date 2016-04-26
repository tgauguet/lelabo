class AddTrialToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :trial_period_days, :string
  end
end
