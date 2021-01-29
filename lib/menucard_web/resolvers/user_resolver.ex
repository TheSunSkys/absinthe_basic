defmodule MenucardWeb.Resolvers.UserResolver do
  alias Menucard.Account
  alias Bcrypt

  def hash_password(password), do: Bcrypt.hash_pwd_salt(password)

  def get_user_by_username(_, args, %{context: %{current_user: current_user}}) do
    current_user |> IO.inspect()
    {:ok, Account.get_user_by_username!(args.username)}
  end

  def create_user(_, %{input: input}, _) do
    Account.create_user(Map.merge(input, %{password: input.password |> hash_password()}))
  end

  def login_user(_, %{input: input}, _) do
    Account.Session.authenticate(input)
  end
end
