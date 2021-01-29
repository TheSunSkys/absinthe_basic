defmodule MenucardWeb.Resolvers.CommentResolver do
  alias Menucard.Posts

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    {:ok, Posts.create_comment(Map.merge(input, %{author_id: current_user.id}))}
  end
end
