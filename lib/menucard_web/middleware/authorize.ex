defmodule MenucardWeb.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, _config) do
    with %{current_user: _current_user} <- resolution.context do
      resolution
    else
      _ -> resolution |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end
end
