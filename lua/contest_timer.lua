local M = {}
local uv = vim.loop
-- install via luarocks if needed

local slots = { "A", "B", "C", "D", "E" }
local pb_file = vim.fn.stdpath("data") .. "/contest_pb.json"

local state = {
    running = false,
    start_time = nil,
    current_slot = 1,
    splits = {},
    pb = {}
}


-- load PBs
local function load_pb()
    local f = io.open(pb_file, "r")
    if f then
        local data = f:read("*a")
        f:close()
        local ok, parsed = pcall(vim.fn.json_decode, data)
        if ok and parsed then
            state.pb = parsed
        end
    end
end

-- save PBs
local function save_pb()
    local f = io.open(pb_file, "w")
    if f then
        f:write(vim.fn.json_encode(state.pb))
        f:close()
    end
end


-- start contest
function M.start()
    state.running = true
    state.start_time = uv.now()
    state.current_slot = 1
    state.splits = {}
    print("Contest timer started")
end

-- stop contest
function M.stop()
    state.running = false
    save_pb()
    print("Contest finished")
end

-- mark split
function M.split()
    if not state.running then return end
    if state.current_slot > #slots then return end

    local now = uv.now()
    local elapsed = (now - state.start_time) / 1000
    local slot = slots[state.current_slot]

    state.splits[slot] = elapsed

    if not state.pb[slot] or elapsed < state.pb[slot] then
        state.pb[slot] = elapsed
    end

    state.current_slot = state.current_slot + 1
end

-- get HUD info
function M.get_hud()
    local lines = {}
    for _, slot in ipairs(slots) do
        local t = state.splits[slot]
        local pb = state.pb[slot]
        if t then
            local delta = pb and (t - pb) or 0
            local status = ""
            if pb then
                if delta < 0 then status = string.format(" -%0.2fs (ahead)", -delta)
                else status = string.format(" +%0.2fs (behind)", delta) end
            end
            table.insert(lines, string.format("%s  %0.2fs%s", slot, t, status))
        else
            table.insert(lines, string.format("%s  --:--", slot))
        end
    end
    return lines
end

-- setup autocmd for new .cpp files
function M.setup_autocmd()
    vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.cpp",
        callback = function()
            M.split()
        end
    })
end

load_pb()
M.pb=state.pb
return M
