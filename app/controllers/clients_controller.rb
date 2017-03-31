class ClientsController<ApplicationController
  def index
    @clients = Client.all
  end

  def show
    id = params[:id]
    @client = Client.find(id)
  end

  def foo
    puts 'bar'
  end

end