ActiveAdmin.register Post do

  permit_params :title, :body, :date

  index do
    column :id
    column :title
    column :cached_slug do |post|
      link_to post.cached_slug, post
    end
    column :date

    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :body
      f.input :cached_slug
      f.input :date, :as => :datepicker
    end

    f.actions
  end

  controller do
    def resource
      Post.where(cached_slug: params[:id]).first!
    end
  end

end
