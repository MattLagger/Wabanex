defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "wendreo@email.com", name: "Wendreo", password: "123456"}

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "wendreo@email.com",
            "name" => "Wendreo"
          }
        }
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("api/graphql", %{query: query})
        |> json_response(:ok)

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      expected_response = %{
        "data" => %{
          "createUser" => %{"email" => "wendreo@email.com", "name" => "Wendreo"}
        }
      }

      mutation = """
        mutation {
          createUser(input: {
            name: "Wendreo", email: "wendreo@email.com", password: "123456"
          }){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert response == expected_response
    end
  end
end
