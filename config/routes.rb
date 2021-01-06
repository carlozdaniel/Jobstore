Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root 'welcome#index'
  end

  unauthenticated :user do
    devise_scope :uder do
      root 'welcome#unregistered', as: :unregistered_root
    end
  end
end