require 'open-uri'
require 'json'

class News

    attr_accessor :name, :body, :url, :author

    @@all = []

    def initialize(name, body, url, author)

        @name = name
        @body = body
        @url = url
        @author = author
        @@all << self

    end

    def self.GetNews 
        @@all = []
        url = 'https://newsapi.org/v2/top-headlines?'\
        'country=au&'\
        'apiKey=d864aba1ea3141269c84c167e72e5c24'

        request = open(url)
        response = request.read
        parsed = JSON(response)
        parsed['articles'].each do |article|
            News.new(article['title'], article['description'], article['url'], article['author'])
        end

    end

    def self.List
        @@all.map.with_index do |object, index|
            "#{index+1} - #{object.name}"
        end
    end

    def saveArticle
        Article.create(:name => self.name, :body => self.body, :url => self.url, :author => self.author)
    end
    

    def self.All
        @@all
    end



end
