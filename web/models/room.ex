defmodule ElChat.Room do
  use ElChat.Web, :model

  schema "rooms" do
    field :name, :string

    has_many :messages, ElChat.Message
    belongs_to :user, ElChat.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
