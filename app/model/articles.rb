class Article < ActiveRecord::Base

    def self.List
        Article.all.map do |article|
            "#{article.id} - #{article.name}"
        end
    end

    def self.search(term)
        results = Article.where("name LIKE ?", "%" + term + "%")
        results.map do |article|
            "#{article.id} - #{article.name}"
        end

    end


end