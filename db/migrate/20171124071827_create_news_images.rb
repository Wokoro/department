class CreateNewsImages < ActiveRecord::Migration[5.0]
  def change
    create_table :news_images do |t|
		t.references :news
		t.string :path
    end
  end
end
