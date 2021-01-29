defmodule MenucardWeb.Types.PostType do
  use Absinthe.Schema.Notation

  @desc "Post"
  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:content, :string)
    field(:comment, list_of(:comment))
    field(:author, :user)
  end

  @desc "Post input"
  input_object :post_input do
    field(:content, non_null(:string))
    field(:title, non_null(:string))
  end

  @desc "Comment"
  object :comment do
    field(:id, :id)
    field(:comment, :string)
    field(:author, :user)
  end

  @desc "Comment input"
  input_object :comment_input do
    field(:post_id, non_null(:id))
    field(:comment, non_null(:string))
  end
end
