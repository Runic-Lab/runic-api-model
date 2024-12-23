---
--  Copyright (C) 2025 - Runic-Lab

module "Hydratation", package.seeall
export ClassProperties

ClassProperties = (instance, data) =>
    for key, value in pairs data
        if instance[key] != nil
            instance[key] = value