defmodule Menucard.Account.Session do
  alias Menucard.Account
  alias Bcrypt

  def validate_password(password, hash), do: Bcrypt.verify_pass(password, hash)

  def authenticate(args) do
    with %Account.User{} = user <- Account.get_user_by_username!(args.username),
         {:ok, %Account.User{} = user} <- check_password(user, args.password),
         {:ok, jwt} <- Account.JWT.generate_jwt(user) do
      {:ok, %{token: jwt, user: user}}
    else
      {:error, :unauthenticated} -> {:error, "Password is invalided"}
      _ -> {:error, "Not found user by username: #{args.username}"}
    end
  end

  defp check_password(%Account.User{password: hashed_password} = user, password) do
    case validate_password(password, hashed_password) do
      true -> {:ok, user}
      _ -> {:error, :unauthenticated}
    end
  end
end
