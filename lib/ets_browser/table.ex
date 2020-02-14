defmodule EtsBrowser.Table do
  defstruct [:id, :read_concurrency, :write_concurrency, :compressed, 
    :memory, :owner, :heir, :name, :size, :node, :named_table, :type, :keypos,
    :protection]

  alias __MODULE__

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
    %Table{
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