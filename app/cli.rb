class Cli 
    

    def initialize
        continue = 'y'
        while continue == 'y'
            puts "Welcome to the News CLI App"
            puts "Select an option"
            puts "1. Get Latest News"
            puts "2. Saved Articles"
            puts "3. Exit"
            
            input  = gets.strip

            if input == '1'
                startNews
            elsif input == '2'
                puts "get articles"
            elsif input == '3'
                return
            else
                puts "Do you want to continue(y/n)"
                continue = gets.strip
            end
        end
    end

    def startNews
        newsContinue = 'y'
        News.GetNews
        while newsContinue == 'y'
            puts "=========================================================================================="
            puts News.List
            puts "=========================================================================================="
            puts "Select a News article to view details"
            input = gets.strip
            if input.to_i <= News.List.count 
                viewarticle = 'y'
                while viewarticle == 'y'
                    puts "Title:" + News.All[input.to_i].name
                    puts "Body:" + News.All[input.to_i].body
                    puts "1. Save Article"
                    puts "2. Return"
                    articleinput = gets.strip
                    if articleinput == '1'
                        News.All[input.to_i-1].saveArticle
                    else 
                        return
                    end
                end

            elsif input.to_i > News.List.count
                "Please select a valid article number"
            else
                puts "Do you want to continue (y/n)"
                newsContinue = gets.strip
            end
        end
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