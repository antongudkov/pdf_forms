Rails.application.routes.draw do
  resource :fill_form, only: [] do
    collection do
      get :fill
    end
  end
end
