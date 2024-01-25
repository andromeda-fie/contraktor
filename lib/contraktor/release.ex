defmodule Contraktor.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """

  @app :contraktor

  def migrate do
    load_app()

    # Do seeds
  end

  # defp repos do
  #   Application.fetch_env!(@app, :ecto_repos)
  # end

  defp load_app do
    Application.load(@app)
  end
end
