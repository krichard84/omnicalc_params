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
        m_interest_rate = ((@apr / 100) / 12)
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
        
        @value = rand(@min..@max)
    
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
    
    #Part 2.3
    
    def payment_form
        
        render("calculations/payment_form_template.html.erb")
    
    end

    def process_payment
    
        @user_apr = params["user_apr"].to_f
        @user_years = params["user_years"].to_i
        @user_pv = params["user_pv"].to_f
        
        principal = @user_pv
        m_interest_rate = ((@user_apr / 100) / 12)
        m_years = @user_years*12
        
        numerator = ((m_interest_rate) * (principal))
        
        denominator = (1 - ((1 + m_interest_rate)**(-1*m_years)))
        
        @payment = (numerator / denominator)
        
       render("calculations/payment_results_template.html.erb")  
        
    end

    #Part 2.4
    
    def random_form
       
       render("calculations/random_form_template.html.erb")
        
    end

    def process_random_form
    
        @min = params["user_min"].to_f
        @max = params["user_max"].to_f
        
        
        
        @value = rand(@min..@max)
    
        render("calculations/random_results_template.html.erb") 
    
    end

end