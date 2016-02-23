ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FromSpace.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FromSpace.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FromSpace.Repo)

