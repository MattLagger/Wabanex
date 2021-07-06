defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params is valid, returns the user" do
      params = %{name: "Rafael", email: "rafael@gmail.com", password: "123456"}

      response = User.changeset(params)

      assert errors_on(response) == %{}
    end

    test "when all password length is invalid, returns the error" do
      params = %{name: "R", email: "rafaelgmail.com", password: "123"}

      errors_expected = %{
        password: ["should be at least 6 character(s)"],
        name: ["should be at least 2 character(s)"],
        email: ["has invalid format"]
      }

      response = User.changeset(params)

      assert errors_on(response) == errors_expected
    end
  end
end
