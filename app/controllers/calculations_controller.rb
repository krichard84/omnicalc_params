class CalculationsController < ApplicationController
    def flex_square
       # The incoming parameters for this action look like {"a_number" => "5"]
       # Rails stores that hash in a variable called params
       
       @user_number = params["a_number"].to_i
       @squared_number = @user_number**2
       
       render("calculations/flexible_square_template.html.erb")
    end 
   
    def flex_sqrt
    
       @user_number = params["a_number"].to_i
       @sqrt_number = Math.sqrt(@user_number)
       
       render("calculations/flexible_sqrt_template.html.erb")
       
    end       
   
    def flex_pmt
        
        @apr = params["basis_points"].to_f
        @years = params["number_of_years"].to_i
        @principal = params["present_value"].to_f
       
        principal = @principal.round(2)
        interest_rate = @apr/10000
        years = @years
        
        numerator = interest_rate*principal
        denominator = (1 - ((1 + interest_rate)**(-1*years)))
        @payment = (numerator / denominator).round(2)
     
       render("calculations/flexible_pmt_template.html.erb")
       
    end 
    
    def flex_random
    
        @min = params["min"].to_i
        @max = params["max"].to_i
    
        @value = rand(@max - @min)
    
        render("calculations/flexible_random_template.html.erb")
    
    end
    
    
    
    
    def square_form
    
        render("calculations/square_form_template.html.erb")
    end
    
    def process_square
        
        @user_number = params["the_user_number"].to_i
        @squared_number = @user_number**2
        
        render("calculations/square_results_template.html.erb")
    end
end