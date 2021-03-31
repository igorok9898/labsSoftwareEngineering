module Resource
    def connection(routes)
    if routes.nil?
        puts "No route matches for #{self}"
        return
    end
  
    loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
  
        action = nil
  
        if verb == 'GET'
            print 'Choose action (index/show) / q to exit: '
            action = gets.chomp
            break if action == 'q'
        end
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
        end
    end
end

class PostsController
    extend Resource

    def initialize 
        @posts = []
    end

    def index
        ind = 0
        @posts.each do |item|
            puts ind.to_s + '. ' + item
            ind += 1
        end
    end

    def show
        puts 'Print id of post'
        id = gets.to_i
        puts "Post with such id doesn't exists"
        puts @posts[id]        
    end

    def create
        puts 'Print text of post'
        text = gets.chomp
        @posts.push(text)
        len = @posts.length - 1
        puts len.to_s + '. ' + @posts[len]
    end

    def update
        puts 'Print ID of post, you want to change'
        id = gets.to_i
        if @posts[id] == nil
            puts "Post with such id doesn't exists"
            return
        end
        puts 'Print new text of post'
        text = gets.to_s
        @posts[id] = text
        puts id.to_s + '. ' + @posts[id]
    end

    def destroy
        puts 'Print ID of post, you want to delete'
        id = gets.to_i
        if @posts[id] == nil
            puts "Post with such id doesn't exists"
            return
        end
        @posts.delete(@posts[id])
    end
end

class CommentsController
    extend Resource

    def initialize 
        @comments = []
    end

    def index
        ind = 0
        @comments.each do |item|
            puts ind.to_s + '. ' + item
            ind += 1
        end
    end

    def show
        puts 'Print id of comment'
        id = gets.to_i
        puts "Comment with such id doesn't exists"
        puts @comments[id]        
    end

    def create
        puts 'Print your comment'
        text = gets.chomp
        @comments.push(text)
        len = @comments.length - 1
        puts len.to_s + '. ' + @comments[len]
    end

    def update
        puts 'Print ID of comment, you want to change'
        id = gets.to_i
        if @comments[id] == nil
            puts "Comment with such id doesn't exists"
            return
        end
        puts 'Print comment'
        text = gets.to_s
        @comments[id] = text
        puts id.to_s + '. ' + @comments[id]
    end

    def destroy
        puts 'Print ID of comment, you want to delete'
        id = gets.to_i
        if @comments[id] == nil
            puts "Comment with such id doesn't exists"
            return
        end
        @comments.delete(@comments[id])
    end
end

class Router
    def initialize
        @routes = {}
    end

    def init
        resources(PostsController, 'posts')
        resources(CommentsController, 'comments')

        loop do
            print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
            choise = gets.chomp

            PostsController.connection(@routes['posts']) if choise == '1'
            CommentsController.connection(@routes['comments']) if choise == '2'
            break if choise == 'q'
        end

        puts 'Good bye!'
    end

    def resources(klass, keyword)
        controller = klass.new
        @routes[keyword] = {
          'GET' => {
            'index' => controller.method(:index),
            'show' => controller.method(:show)
          },
          'POST' => controller.method(:create),
          'PUT' => controller.method(:update),
          'DELETE' => controller.method(:destroy)
        }
    end
end

router = Router.new

router.init