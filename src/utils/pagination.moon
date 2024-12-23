---
--  Copyright (C) 2025 - Runic-Lab

module "Pagination", package.seeall
export GetPageAndSize

GetPageAndSize = (params) =>
    page = params and tonumber(params.page) or 1
    size = params and tonumber(params.size) or 100
    
    return page, size