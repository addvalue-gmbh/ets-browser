defmodule EtsBrowser.Table do
  @moduledoc """
  """

  defstruct [:id, :read_concurrency, :write_concurrency, :compressed, 
    :memory, :owner, :heir, :name, :size, :node, :named_table, :type, :keypos,
    :protection]

  @type t :: %__MODULE__{
    id: reference(),
    read_concurrency: boolean(),
    write_concurrency: boolean(), 
    compressed: boolean(), 
    memory: integer(), 
    owner: pid(), 
    heir: pid() | none(), 
    name: atom(), 
    size: integer(), 
    node: node(), 
    named_table: boolean(), 
    type: atom(), 
    keypos: integer(), 
    protection: atom()
  }

  @doc ~S"""
  Creates a new Table
  """

  def new(
    [
      id: id, 
      read_concurrency: read_concurrency,
      write_concurrency: write_concurrency, 
      compressed: compressed, 
      memory: memory, 
      owner: owner, 
      heir: heir, 
      name: name, 
      size: size, 
      node: node, 
      named_table: named_table, 
      type: type, 
      keypos: keypos, 
      protection: protection
    ]
  ) do
    %__MODULE__{
      id: id, 
      read_concurrency: read_concurrency, 
      write_concurrency: write_concurrency, 
      compressed: compressed, 
      memory: memory, 
      owner: owner,
      heir: heir, 
      name: name, 
      size: size, 
      node: node, 
      named_table: named_table, 
      type: type, 
      keypos: keypos, 
      protection: protection
    }
  end
end