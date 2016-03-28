module UsersHelper

  def full_name
    "#{current_user.name} #{current_user.surname}"
  end
end
