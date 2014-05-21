ActiveAdmin.register Post do

  permit_params :title, :body, :date, :tag_list

  index do
    column :id
    column :title
    column :cached_slug do |post|
      link_to post.cached_slug, post
    end
    column :date

    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :body
      row :cached_slug do |post|
        link_to post.cached_slug, post
      end
      row :date
      row :tag_list
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :body
      f.input :cached_slug
      f.input :date, :as => :datepicker
      f.input :tag_list
    end

    f.actions
  end

  controller do
    def resource
      Post.where(cached_slug: params[:id]).first!
    end
  end

end
