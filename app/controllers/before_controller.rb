class BeforeController < ApplicationController
  before_filter:  :authorize

  def cool
  end

  def free 
  end 
  
end
