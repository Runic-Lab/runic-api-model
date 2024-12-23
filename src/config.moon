---
--  Copyright (C) 2025 - Runic-Lab

import config from require "lapis.config"

config "development", ->
  server "nginx"
  code_cache "off"
  num_workers "1"
  port "8081"
