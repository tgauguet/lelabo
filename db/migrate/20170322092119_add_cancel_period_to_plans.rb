class AddCancelPeriodToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :cancel_at_period_end, :boolean
  end
end
