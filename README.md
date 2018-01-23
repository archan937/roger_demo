# RogerDemo

Installation:

  * Clone `git clone git@github.com:archan937/roger_demo.git`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Make sure you have RabbitMQ installed (`brew install rabbitmq`)

Startup:

  * Run `iex --name server@127.0.0.1 --cookie monster -S mix` in Terminal tab 1
  * Run `iex --name watcher@127.0.0.1 --cookie monster -S mix run` in Terminal tab 2

```
    Node.ping(:"server@127.0.0.1")
    Roger.Info.partitions
    Roger.Info.partitions[:"server@127.0.0.1"]
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
