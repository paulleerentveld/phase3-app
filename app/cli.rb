class Cli 
    def initialize
        continue = 'y'
        while continue == 'y'
            puts "Welcome to the News CLI App"
            puts "Select an option"
            puts "1. Get News"
            
            input  = gets.strip

            if input == '1'
                startNews
            else
            puts "Do you want to continue(y/n)"
            continue = gets.strip
            end
        end
    end

    def startNews
        News.new.getnews
    end

    def saveArticle

    end

    def getArticles
        puts "Select an option"
        puts "1. List Saved Articles"
        puts "2. Search by name"
        
        input  = gets.strip 

        if input == "1"
            puts articles.all
        elsif input == '2'
            puts "Article name"
            search = gets.strip
            puts Article.find_by(name: search)
        end


    end


end