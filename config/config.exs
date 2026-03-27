import Config

config :hyper_ui,
  namespace: HyperUI

import_config "#{config_env()}.exs"
