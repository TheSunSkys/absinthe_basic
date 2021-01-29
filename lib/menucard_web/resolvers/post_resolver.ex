defmodule MenucardWeb.Resolvers.PostResolver do
  alias Menucard.Posts

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    {:ok, Posts.create_post(Map.merge(input, %{author_id: current_user.id}))}
  end

  def get_post_list(_, _, _) do
    Posts.list_content() |> IO.inspect()
    {:ok, Posts.list_content()}
  end
end
