Rails.application.routes.draw do
  get 'jobs/create'

  get 'users/login'

  resources :beers
  root 'beers#index'


  resources :users

  resources :clients do
    resources :jobs do
      root 'clients#foo'
    end
  end

  resources :jobs
  resources :job_logs


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources "clients"  do

    collection do
    end

    member do
    end

  end


  resources "jobs"  do

    collection do

    end

    member do
      get 'pdf_mailer'
      post 'edit'
      get 'paid'
      get 'get_jobs'
    end

  end

end
