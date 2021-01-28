defmodule Menucard.Guardian do
  use Guardian, otp_app: :menucard

  alias Menucard.Account.User
  alias Menucard.Account

  def subject_for_token(%User{} = user, _claims), do: {:ok, "User:#{user.id}"}

  def resource_from_claims(%{"sub" => "User:" <> id}) do
    try do
      {:ok, Account.get_user!(id)}
    rescue
      _ in [Ecto.NoResultsError] -> {:error, :unauthorized}
    end
  end
end
