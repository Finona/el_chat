defmodule ElChat.Message do
  use ElChat.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :user, ElChat.User
    belongs_to :room, ElChat.Room

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :user_id, :room_id])
    |> validate_required([:body, :user_id, :room_id])
  end
end
