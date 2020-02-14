ExUnit.start()

:ets.new(:user_lookup, [:set, :protected, :named_table])
:ets.insert(:user_lookup, {"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})
:ets.insert(:user_lookup, {"3100", "", ["Elixir", "Ruby", "JavaScript"]})

:ets.new(:user_lookup_private, [:set, :private, :named_table])
:ets.insert(:user_lookup, {"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})
:ets.insert(:user_lookup, {"3100", "", ["Elixir", "Ruby", "JavaScript"]})