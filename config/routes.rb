ActionController::Routing::Routes.draw do |map|



  
  map.root :controller => "home", :action =>"index"
  map.resource :home
  map.resources :fitness_plans , :has_many => :exercises 
  map.resources :workouts , :has_many => :exercises 
  map.resources :charts
  map.resources :users
  map.resource :session
  map.resources :cholesterols
  map.resources :bps
  map.resources :medications
  map.resources :stresses 
  map.resources :stresses , :has_many => :stress_logs
  map.resources :relationships
  map.resources :relationships , :has_many => :journals
  map.resources :medical_histories
  map.resources :foods
  map.resource :profile
  map.resources :measurements
  map.resources :illness_histories
  map.resources :opinions
  map.resources :surveys
  map.resources :supports
  map.resources :supports, :has_many => :support_dialogs
  map.resources :roles
  map.resources :subjects
  map.resources :permissions
  map.resources :sleeps
  map.resources :quotients
  
  map.resources :roles
  map.resources :setups


  
  
  map.namespace :admin do |admin|
    admin.root :controller => "home", :action => 'show'
    admin.resource :home, :controller => "home"
    admin.resources :users
    admin.resources :supports
    admin.resources :supports, :has_many => :support_dialogs
    admin.resources :samples
    admin.resources :reports
  end
  
  map.namespace :member do |member|
    member.root :controller => "home", :action => 'show'
    member.resource :home, :controller => "home"
    member.resources :users
    member.resources :supports
    member.resources :supports, :has_many => :support_dialogs
    member.resources :samples
    member.resources :reports
  end


  #map.chart '/chart' , :controller => 'charts' , :action => 'index'

 # map.home '', :controller => 'home', :action => 'index'
  map.home '', :controller => 'sessions', :action => 'new'
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  
  
  map.error '/error', :controller => 'some_controller', :action => 'error_action'
  map.denied '/denied', :controller => 'some_controller', :action => 'denied_action'

  
# Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
