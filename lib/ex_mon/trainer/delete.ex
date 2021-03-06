defmodule ExMon.Trainer.Delete do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid UUID format!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Trainer.Get.fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> Repo.delete(trainer)
    end
  end
end
