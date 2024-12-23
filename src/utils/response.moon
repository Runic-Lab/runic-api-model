---
--  Copyright (C) 2025 - Runic-Lab

module "Response", package.seeall
export BuildMeta, Send

BuildMeta = (code, req_time = os.time!, total_pages = 1) =>
    res_time = os.clock!
    exec_time = (res_time - req_time) * 1000

    data = {
        request_date: os.date "%Y-%m-%d %H:%M:%S", req_time
        response_date: os.date "%Y-%m-%d %H:%M:%S", res_time
        execution_time: exec_time
    }

    data.total_pages = total_pages if total_pages
    data.status_code = 200 if code
    
    return data

Send = (code, results, req_time = 1, total_pages = 1) =>
    meta = BuildMeta @, code == 200, req_time, total_pages

    msg = {}
    if code == 200
        msg = { results: results, meta: meta }
    else
        msg = { error: { message: results, status_code: code } }

    return { json: msg }