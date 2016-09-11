defmodule ElChat.User do
  use ElChat.Web, :model
  alias ElChat.User

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: 

    has_many :messages, ElChat.Message
    has_many :rooms, ElChat.Room


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
