---
--  Copyright (C) 2025 - Runic-Lab

---
-- Require LuaRocks packages
lapis = require "lapis"
lfs = require "lfs"

---
-- Require internal libraries
require "utils.module_loader"
require "utils.response"

---
-- Application class extending lapis.Application
-- Provides handlers for 404 and 500 errors
class Application extends lapis.Application

  ---
  -- Handler for 404 errors
  -- @return A JSON response with the status and error message
  handle_404: =>
    return Response->Send 404, "Error 404 : Invalid path specified"

  ---
  -- Handler for 500 errors
  -- @param err A description of the error
  -- @param trace The error trace if available
  -- @return A JSON response with the status, error message, and details
  handle_500: (err, trace) =>
    return Response->Send 500, "Error 500 : Internal server error"

---
-- Sets up and initializes an application instance
-- @return The configured application instance
SetupApplicationInstance = =>
  application = Application!

  application.html = require "lapis.html"
  application.static = {}
  
  application->enable "etlua"
  ModuleLoader->Load application, "modules"

  return application

-- Returns the configured application instance
return SetupApplicationInstance!