
class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square

    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root

    @num = params.fetch("number").to_f
    @square_root_of_num = @num ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment_form

    @apr = params.fetch("user_apr").to_f.round(4)
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_principal").to_f
    numerator = @apr/100/12*@principal
    denominator =  1-((1+@apr/100/12)**(-@years*12))
    @results = numerator/denominator.to_f

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_random
    
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @results = rand(@lower..@upper)
    
    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

end
