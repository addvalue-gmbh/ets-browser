defmodule EtsBrowser do
  @moduledoc """
  A simple web-based viewer of data stored in ETS.
  """

  alias EtsBrowser.Table

  @doc """
  Get all ETS tables on the current node.

  ## Examples

      iex> EtsBrowser.all_tables()
      [%EtsBrowser.Table{}]

  """
  def all_tables do
    :ets.all()
    |> Enum.map(fn table -> 
      Table.new(:ets.info(table))
    end)
  end

  @doc """
  Get a single ETS table on the current node by name.

  ## Examples

      iex> EtsBrowser.get_table("my_table")
      %EtsBrowser.Table{}

      iex> EtsBrowser.get_table("unknown_table")
      nil

  """
  def get_table(name) do
    :ets.all()
    |> Enum.map(fn table -> :ets.info(table) end)
    |> Enum.find(fn table -> to_string(table[:name]) == name end)
    |> may_return_table()
  end

  defp may_return_table(nil), do: nil
  defp may_return_table(table), do: Table.new(table)
  

  @doc """
  Get all contents of an ETS table on the current node by table id.

  ## Examples

      iex> EtsBrowser.all_tuples(%EtsBrowser.Table{})
      [{:some, :values}]

  """
  def all_tuples(%Table{ protection: :private }), do: []
  def all_tuples(%Table{ id: id }) do
    :ets.tab2list(id)
  end

end