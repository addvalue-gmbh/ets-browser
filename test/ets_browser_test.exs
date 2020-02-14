defmodule EtsBrowserTest do
  use ExUnit.Case
  
  alias EtsBrowser
  alias EtsBrowser.Table

  test "get all ets tables on current node" do
    assert tables = EtsBrowser.all_tables()
    assert is_list(tables)
  end

  test "get a single ets table on current node" do
    assert %Table{ name: name } = EtsBrowser.get_table("user_lookup")
    assert name == :user_lookup
  end

  test "get all tuples within an ets table on current node" do
    assert table = EtsBrowser.get_table("user_lookup")
    assert EtsBrowser.all_tuples(table) == [{"doomspork", "Sean", ["Elixir", "Ruby", "Java"]}, {"3100", "", ["Elixir", "Ruby", "JavaScript"]}]
  end

  test "get all tuples within an private ets table on current node should be empty" do
    assert table = EtsBrowser.get_table("user_lookup_private")
    assert EtsBrowser.all_tuples(table) == []
  end
end