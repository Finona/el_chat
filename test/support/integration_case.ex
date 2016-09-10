defmodule ElChat.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      import ElChat.IntegrationCase

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElChat.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElChat.Repo, {:shared, self()})
    end

    :ok
   end
end