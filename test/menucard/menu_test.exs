defmodule Menucard.MenuTest do
  use Menucard.DataCase

  alias Menucard.Menu

  describe "items" do
    alias Menucard.Menu.Item

    @valid_attrs %{name: "some name", price: 42}
    @update_attrs %{name: "some updated name", price: 43}
    @invalid_attrs %{name: nil, price: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Menu.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Menu.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Menu.create_item(@valid_attrs)
      assert item.name == "some name"
      assert item.price == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Menu.update_item(item, @update_attrs)
      assert item.name == "some updated name"
      assert item.price == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_item(item, @invalid_attrs)
      assert item == Menu.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Menu.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Menu.change_item(item)
    end
  end

  describe "reviews" do
    alias Menucard.Menu.Review

    @valid_attrs %{author_id: 42, comment: "some comment"}
    @update_attrs %{author_id: 43, comment: "some updated comment"}
    @invalid_attrs %{author_id: nil, comment: nil}

    def review_fixture(attrs \\ %{}) do
      {:ok, review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_review()

      review
    end

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert Menu.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert Menu.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      assert {:ok, %Review{} = review} = Menu.create_review(@valid_attrs)
      assert review.author_id == 42
      assert review.comment == "some comment"
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      assert {:ok, %Review{} = review} = Menu.update_review(review, @update_attrs)
      assert review.author_id == 43
      assert review.comment == "some updated comment"
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_review(review, @invalid_attrs)
      assert review == Menu.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = Menu.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = Menu.change_review(review)
    end
  end
end
