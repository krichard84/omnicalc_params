Rails.application.routes.draw do
  
  # Part 1 Targets
  
  get("/flexible/square/:a_number", { :controller => "calculations", :action => "flex_square" })
  get("/flexible/square_root/:a_number", { :controller => "calculations", :action => "flex_sqrt"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calculations", :action => "flex_pmt"})
  get("/flexible/random/:min/:max", { :controller => "calculations", :action => "flex_random"})
  
  # Part 2 Targets
  
  get("/square/new", { :controller => "calculations", :action => "square_form" })
  
  get("/square/results", { :controller => "calculations", :action => "process_square"})
  
  # Part 3 Targets
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
