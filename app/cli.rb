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
                getArticles
            elsif input == '3'
                return
            else
                puts "You entered an invalid command, Do you want to continue(y/n)"
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
            if input.to_i == 0
                "Please select a valid article number"
            elsif input.to_i <= News.List.count
                viewarticle = 'y'
                while viewarticle == 'y'
                    articleid = input.to_i - 1
                    puts "=========================================================================================="
                    puts "Title:" + News.All[articleid].name
                    puts "Body:" + News.All[articleid].body
                    puts "URL:" + News.All[articleid].url
                    puts "Author:" + News.All[articleid].author
                    puts "=========================================================================================="
                    puts "1. Save Article"
                    puts "2. Return"
                    articleinput = gets.strip
                    if articleinput == '1'
                        News.All[articleid].saveArticle
                        viewarticle = 'n'
                    else 
                        viewarticle = 'n'
                    end
                end
            elsif input.to_i > News.List.count
                "Please select a valid article number"
            end
            puts "Do you want to continue viewing News (y/n)"
            newsContinue = gets.strip
        end
    end

    def getArticles
        articlesContinue = 'y'
        while articlesContinue == 'y'
            puts "Select an option"
            puts "1. List Saved Articles"
            puts "2. Search by name"
            
            input  = gets.strip 

            if input == "1"
                puts "=========================================================================================="
                puts Article.List
                puts "=========================================================================================="
                puts "Select a News article to view details"
                articleinput = gets.strip.to_i
                if articleinput == 0
                    return
                elsif articleinput <= Article.last.id 
                    article = Article.find(articleinput)
                    puts "=========================================================================================="
                    puts "ID# #{article.id}"
                    puts "Title: #{article.name}"
                    puts "Body: #{article.body}"
                    puts "URL: #{article.url}"
                    puts "author: #{article.author}"
                    puts "=========================================================================================="
                    puts "Select an option"
                    puts "1. Return"
                    puts "2. Delete Article"
                    innerarticleinput = gets.strip.to_i
                    if innerarticleinput == 1
                        return
                    elsif innerarticleinput == 2
                        Article.delete(articleinput)
                    else
                        return
                    end
                elsif articleinput > Article.List.count 
                    "Please select a valid article number"
                else
                    return
                end
            elsif input == '2'
                puts "Enter a search term to find by article name"
                search = gets.strip
                result = Article.search(search)
                puts result
                puts "Select a News article to view details"
                searchselection = gets.strip.to_i
                if searchselection 
                    articlefound = Article.find(searchselection)
                    puts "=========================================================================================="
                    puts "ID# #{articlefound.id}"
                    puts "Title: #{articlefound.name}"
                    puts "Body: #{articlefound.body}"
                    puts "URL: #{articlefound.url}"
                    puts "author: #{articlefound.author}"
                    puts "=========================================================================================="
                    puts "Select an option"
                    puts "1. Return"
                    puts "2. Delete Article"
                    innerarticleinput = gets.strip.to_i
                    if innerarticleinput == 1
                        return
                    elsif innerarticleinput == 2
                        Article.delete(articleinput)
                    else
                        return
                    end
                else
                    return
                end
            end
            puts "Do you want to continue (y/n)"
            articlesContinue = gets.strip
            if articlesContinue != 'y' || articlesContinue != 'n'
                "Please enter y/n"
            else
                return
            end
        end
    end
end