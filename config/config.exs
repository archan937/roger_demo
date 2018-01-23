# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :roger_demo,
  ecto_repos: [RogerDemo.Repo]

# Configures the endpoint
config :roger_demo, RogerDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pEAUtuf4UGueemobV/KCA74dkYh2JMn+QjbJhMgLvnowVAjOWcWM/YULed/2Vm7f",
  render_errors: [view: RogerDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RogerDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configure AMQP
config :roger, Roger.AMQPClient,
  host: "localhost",
  port: 5672

config :roger, Roger.Partition.Worker,
  callbacks: RogerDemo.Worker.Callback

if node() == :"server@127.0.0.1" do

config :roger_ui, :server, true
config :roger, :partitions,
  roger_demo_partition: [default: 10, other: 2]

else

config :roger_ui, :server, false

end

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

if node() != :"server@127.0.0.1" do

:pong = Node.ping(:"server@127.0.0.1")

end
