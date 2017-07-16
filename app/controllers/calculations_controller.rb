class CalculationsController < ApplicationController
    
    #Part 1.1
    
    def flex_square
       # The incoming parameters for this action look like {"a_number" => "5"]
       # Rails stores that hash in a variable called params
       
       @user_number = params["a_number"].to_i
       @squared_number = @user_number**2
       
       render("calculations/flexible_square_template.html.erb")
    end 
   
   #Part 1.2
   
    def flex_sqrt
    
       @user_number = params["a_number"].to_i
       @sqrt_number = Math.sqrt(@user_number)
       
       render("calculations/flexible_sqrt_template.html.erb")
       
    end       
   
   #Part 1.3
   
    def flex_pmt
        
        @apr = params["basis_points"].to_f * 1/100
        @years = params["number_of_years"].to_i
        @principal = params["present_value"].to_f
       
        principal = @principal
        m_interest_rate = (@apr/100)/12
        m_years = @years*12
        
        numerator = ((m_interest_rate) * (principal))
        
        denominator = (1 - ((1 + m_interest_rate)**(-1*m_years)))
        
        @payment = (numerator / denominator)
        
       render("calculations/flexible_pmt_template.html.erb")
       
    end 
    
    #Part 1.4
    
    def flex_random
    
        @min = params["min"].to_i
        @max = params["max"].to_i
    
        @value = rand(@max - @min)
    
        render("calculations/flexible_random_template.html.erb")
    
    end
    
    #Part 2.1
    
    def square_form
    
        render("calculations/square_form_template.html.erb")
    end
    
    def process_square
        
        @user_number = params["a_number"].to_i
        @squared_number = @user_number**2
        
        render("calculations/square_results_template.html.erb")
    end
    
    #Part 2.2
    
    def square_root_form
        
        render("calculations/square_root_form_template.html.erb")
    
    end
    
    def process_square_root
        
        @user_number = params["a_number"].to_i
        @sqrt_number = Math.sqrt(@user_number)
        
        render("calculations/square_root_results_template.html.erb")
    end
    
end