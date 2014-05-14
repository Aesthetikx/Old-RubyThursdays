module PostsHelper

  def human_date date
    date.strftime("%A, %B %e, %Y")
  end

end
