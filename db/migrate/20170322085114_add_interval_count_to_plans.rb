class AddIntervalCountToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :interval_count, :integer
  end
end
