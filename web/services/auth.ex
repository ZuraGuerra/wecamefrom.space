defmodule FromSpace.AuthService do
  #use FromSpace.Web, :model

  def hash_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

end