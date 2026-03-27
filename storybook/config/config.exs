import Config

config :hyper_ui_storybook,
  namespace: HyperUI

import_config "#{config_env()}.exs"
