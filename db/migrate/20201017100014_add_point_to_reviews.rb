class AddPointToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :point, :decimal, precision: 5, scale: 3
  end
end
