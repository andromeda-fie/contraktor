import Config

# Configure your database
config :contraktor, Contraktor.Repo,
  username: System.get_env("POSTGRES_USER", "contraktor"),
  password: System.get_env("POSTGRES_PASS", "contraktor"),
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  database: System.get_env("POSTGRES_DATA", "contraktor_test"),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :contraktor, ContraktorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wGGWFF3LsRHnhXl0HbWeUBRROAG2Ac5WvfBVHWFtMDJS8SjEb4Vby0ouyON6rxfa",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
