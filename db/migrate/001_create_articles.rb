class CreateArticles < ActiveRecord::Migration[5.2]
    def change
        create_table :articles do |t|
            t.string :name
            t.string :body
        end
    end
end