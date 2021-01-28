defmodule Menucard.Account.JWT do
  @moduledoc """
  JSON Web Token helper functions, using Guardian
  """

  alias Menucard.Guardian
  alias Menucard.Account.User

  def generate_jwt(%User{} = resource) do
    case Guardian.encode_and_sign(resource, %{}, token_type: :token, ttl: {10, :hours}) do
      {:ok, jwt, _full_claims} ->
        {:ok, jwt}

      e ->
        e |> IO.inspect()
    end
  end
end
