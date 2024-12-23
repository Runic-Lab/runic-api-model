---
--  Copyright (C) 2025 - Runic-Lab

module "Reflection", package.seeall
export ClassProperties

ClassProperties = (obj) =>
    for property, value in pairs obj
        if type(value) != "function" and type(value) != "table"
            functionName = property->sub(1, 1)->upper() .. property->sub(2)

            obj["Get" .. functionName] = =>
                obj[property]

            obj["Set" .. functionName] = (newValue) =>
                obj[property] = newValue