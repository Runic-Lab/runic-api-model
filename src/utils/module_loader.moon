---
--  Copyright (C) 2025 - Runic-Lab

module "ModuleLoader", package.seeall
export Load

---
-- Module Loader
-- Provides functionality to load and configure modules from a given path

---
-- Load modules from the specified path
-- @param application The application instance to update
-- @param path The directory path containing the modules to be loaded
Load = (application, path) =>
    for file in lfs.dir path
        if file != "." and file != ".."
        full_path = "#{path}/#{file}"
        attrs = lfs.attributes full_path
    
        if attrs and attrs.mode == "directory"
            router_path = "#{full_path}/router.lua"
            if lfs.attributes router_path
            success, module = pcall(require, "modules.#{file}.router")
            if success and module
                if type application.static["#{file}"] != "table"
                application.static["#{file}"] = {}
    
                application.static["#{file}"] = "modules/#{file}/static"
                module application
            else
                error "Failed to load module: #{file}\n"
            else
            error "Router not found for module: #{file}\n"