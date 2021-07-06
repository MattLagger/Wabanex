defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc ifo", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      expected_response = %{
        "result" => %{
          "Dani" => 23.437499999999996,
          "Diego" => 23.04002019946976,
          "Gabul" => 22.857142857142858,
          "Rafael" => 24.897060231734173,
          "Rodrigo" => 26.234567901234566
        }
      }

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert expected_response == response
    end

    test "when all params are invalid, returns bad_request", %{conn: conn} do
      params = %{"filename" => "banana_response.csv"}

      expected_response = %{"result" => "Error while opening the file"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert expected_response == response
    end
  end
end
