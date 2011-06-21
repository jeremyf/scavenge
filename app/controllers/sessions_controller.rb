class SessionsController < Devise::SessionsController
  prepend_view_path('app/views/devise')
end
