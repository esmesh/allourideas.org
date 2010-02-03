ActionController::Routing::Routes.draw do |map|
  #map.root :controller => "clearance/sessions", :action => "new"
  map.resources :questions, 
                :member => {:skip => :post, 
                            :vote_left => :post, 
                            :vote_right => :post, 
                            :add_idea => :post, 
                            :toggle => :post, 
                            :admin => :get, 
                            :results => :get,
  		            :update => :post }
  #map.resources :choices, :member => {:activate => :get}
  map.connect '/questions/:question_id/choices/:id', :controller => 'choices', :action => 'show'
  map.activate_choice '/:question_id/choices/:id/activate', :controller => 'choices', :action => 'activate'
  map.deactivate_choice '/:question_id/choices/:id/deactivate', :controller => 'choices', :action => 'deactivate'
  map.toggle_choice_status '/questions/:earl_id/choices/:id/toggle.:format', :controller => 'choices', :action => 'toggle', :conditions => { :method => :post }
  
  map.about '/about', :controller => 'home', :action => 'about'
  map.admin '/admin', :controller => 'home', :action => 'admin'
  map.privacy '/privacy', :controller => 'home', :action => 'privacy'
  map.tour '/tour', :controller => 'home', :action => 'tour'
  map.connect '/signup', :controller => 'users', :action => 'new'
  map.root :controller => 'home', :action => 'index'
  #map.toggle_question '/questions/:id/toggle', :controller => 'questions'
  
  map.connect '/:id', :controller => 'earls', :action => 'show'
  map.connect '/:id/:action', :controller => 'questions'
  map.connect '/:question_id/choices/:id', :controller => 'choices', :action => 'show'
  

  # rake routes
  # http://guides.rubyonrails.org/routing.html
end
