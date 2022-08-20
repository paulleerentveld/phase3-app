require 'open-uri'
require 'json'

class News

    attr_accessor :name, :body

    @@all = []

    def initialize(name, body)

        @name = name
        @body = body
        #@@all << self

    end

    def self.GetNews 
        url = 'https://newsapi.org/v2/top-headlines?'\
        'country=au&'\
        'apiKey=d864aba1ea3141269c84c167e72e5c24'

        request = open(url)
        response = request.read
        parsed = JSON(response)
        parsed['articles'].each.with_index(1) do |article, index|
            index = News.new(article['title'], article['description'])
            @@all << index
        end

    end

    def self.List
        @@all.map.with_index do |object, index|
            "#{index} - #{object.name}"
        end
    end

    def saveArticle
        Article.create(:name => self.name, :body => self.body)
    end
    

    def self.All
        @@all
    end

    def showNews


    end


end
