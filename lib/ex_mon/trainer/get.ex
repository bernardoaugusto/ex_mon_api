defmodule ExMon.Trainer.Get do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid UUID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> {:ok, trainer}
    end
  end

  def fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end
