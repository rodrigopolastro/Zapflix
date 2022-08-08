module ApplicationHelper

  def format_date(date)
    date.strftime('%d/%m/%y') if date
  end
  
end
