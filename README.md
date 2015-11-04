
[![hex.pm version](https://img.shields.io/hexpm/v/supervisord.svg)](https://hex.pm/packages/supervisord)
[![hex.pm](https://img.shields.io/hexpm/l/supervisord.svg)](https://github.com/pocketberserker/elixir-supervisord/blob/master/LICENSE)

[supervisord](http://supervisord.org/) RPC client for Elixir.

## Installation

Add supervisord (and erlsom) to your mix dependencies

```
def deps do
  [{:erlsom, git: "https://github.com/willemdj/erlsom.git", tag: "v1.3.1"},
   {:supervisord, "~> 0.1.0"}]
end
```

