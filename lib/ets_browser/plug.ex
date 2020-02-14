defmodule EtsBrowser.Plug do
  use Plug.Router
  require EEx

  index_template = Path.join(__DIR__, "index.html.eex")
  EEx.function_from_file(:defp, :index, index_template, [:assigns])

  show_template = Path.join(__DIR__, "show.html.eex")
  EEx.function_from_file(:defp, :show, show_template, [:assigns])

  @moduledoc """
  A plug that can be used in your router to browse public or protected 
  ETS tables.

  ## Using with Plug or Phoenix

    # In your Router
    defmodule MyApp.Router do
      use Phoenix.Router # or use Plug.Router if you're not using Phoenix
      if Mix.env == :dev do
        # If using Phoenix
        forward "/ets_browser", EtsBrowser.Plug
        # If using Plug.Router, make sure to add the `to`
        forward "/ets_browser", to: EtsBrowser.Plug
      end
    end

  Now if you visit your app at `/ets_browser` you will see a list of all public 
  or protected ETS tables on your current node.
  """

  plug(:match)
  plug(:dispatch)

  get "/" do
    tables = EtsBrowser.all_tables()

    render_index(conn, tables)
  end

  get "/:id" do
    tables = EtsBrowser.all_tables()
    table = EtsBrowser.get_table(id)
    tuples = EtsBrowser.all_tuples(table)

    render_show(conn, tuples, tables)
  end

  defp render_show(conn, tuples, tables) do
    assigns = %{
      conn: conn,
      tuples: tuples,
      tables: tables,
      base_path: base_path(conn),
    }

    send_html(conn, :ok, show(assigns))
  end

  defp render_index(conn, tables) do
    assigns = %{
      conn: conn,
      tables: tables,
      base_path: base_path(conn),
    }

    send_html(conn, :ok, index(assigns))
  end

  defp send_html(conn, status, body) do
    conn
    |> Plug.Conn.put_resp_content_type("text/html")
    |> send_resp(status, body)
  end

  defp base_path(%{script_name: []}), do: ""

  defp base_path(%{script_name: script_name}) do
    "/" <> Enum.join(script_name, "/")
  end

end