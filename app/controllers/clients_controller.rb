class ClientsController<ApplicationController

  #http_basic_authenticate_with name: 'alex' , password: 'great'


  def index
    @clients = Client.all
  end

  def show
    id = params[:id]
    @client = Client.find(id)
    @prices = Price.where("client_id = ?", id)
  end

  def update
    id = params[:id]
    @client = Client.find(id)
    @client.name = params[:name]
    @client.phone = params[:phone]
    @client.email = params[:email]
    @client.save
  end

  def foo
    puts 'bar'
  end

end