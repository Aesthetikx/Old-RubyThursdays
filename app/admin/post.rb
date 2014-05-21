ActiveAdmin.register Post do

  permit_params :title, :body, :date

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :body
      f.input :cached_slug
      f.input :date, :as => :datepicker
    end

    f.actions
  end

end
