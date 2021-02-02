# Absinthe basic

Absinthe graphql toolkit for elixir https://github.com/absinthe-graphql/absinthe

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Graphql for test
  * create user
  `mutation {
   createUser (input: {
      username: "fang"
      name: "fang"
      password : "123456"
    }) {
      id
      username
    }
  }`
  * user login
  `mutation {
   loginUser (input: {
     username: "fang"
     password: "123456"
   }) {
     token
   }
 }`
  * get user profile
  `query {
    user (username: "fang") {
      name
      username
    }
  }`
  * create your post
  `
   mutation {
    createPost (input:{
      content: "some content"
      title: "some title"
    }) {
     id
      content
      author {
        username
      }
    }
  }`
  * create comment
  `
   mutation {
    createComment (input: {
      postId: "1"
      comment: "somecomment"
    }) {
      comment
      id
      author {
     name
      }
    }
  }
  `
  * get posts and comments
  `
  query {
    posts {
      id
      content
      title
      author {
        name
        username
      }
      comment {
        comment
        author {
          name
        }
      }
    }
  }
  `
## Learn more

  * Step by step: https://crypt.codemancers.com/posts/2020-03-16-a-full-stack-guide-to-graphql-elixir_phoenix_server/#loading-associations
  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
