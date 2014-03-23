module ApplicationHelper
  def intellinav
    if @current_user
      "<li>#{ link_to('Log out ' + @current_user.name, login_path, :method => :delete, :confirm => 'Really log out?') }</li>"
    else
      "<li>#{ link_to('Sign up', new_user_path) }</li>
       <li>#{ link_to('Sign in', login_path) }</li>"
    end
  end
end
