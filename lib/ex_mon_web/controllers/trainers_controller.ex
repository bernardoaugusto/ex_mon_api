defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  @spec create(any, :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          any
  def create(conn, params) do
    params |> ExMon.create_trainer() |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn |> put_status(:ok) |> render("create.json", trainer: trainer)
  end
end
