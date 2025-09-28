local M = {}
local api = vim.api
local timer = require("contest_timer")

local splits = {}
local start_time = nil
local hud_buf = nil
local hud_win = nil
local slot_index = 1
local slots = { "A", "B", "C", "D", "E" }

-- open HUD
local function open_hud()
    if hud_buf and api.nvim_buf_is_valid(hud_buf) then return end
    hud_buf = api.nvim_create_buf(false, true)
    hud_win = api.nvim_open_win(hud_buf, false, {
        relative = "editor",
        width = 30,
        height = 10,
        row = 1,
        col = vim.o.columns - 32,
        style = "minimal",
        border = "rounded"
    })
end

-- format seconds
local function fmt_time(sec)
    if not sec then return "--:--" end
    local m = math.floor(sec / 60)
    local s = sec % 60
    return string.format("%02d:%02d", m, s)
end

-- update HUD
local function update_hud()
    if not hud_buf or not api.nvim_buf_is_valid(hud_buf) then return end
    api.nvim_buf_clear_namespace(hud_buf, -1, 0, -1)  -- clear old highlights
    local lines = { "Contest HUD" }
    for _, s in ipairs(splits) do
        local elapsed = os.time() - s.start
        local pb_time = timer.pb[s.name]
        local delta = pb_time and (elapsed - pb_time) or 0
        local text = string.format("%s  %s", s.name, fmt_time(elapsed))
        table.insert(lines, text)
    end
    vim.api.nvim_buf_set_lines(hud_buf, 0, -1, false, lines)

    for i, s in ipairs(splits) do
        local pb_time = timer.pb[s.name]
        if pb_time then
            local delta = (os.time() - s.start) - pb_time
            local line_index = i  -- first line is header
            if delta < 0 then
                api.nvim_buf_add_highlight(hud_buf, -1, "String", line_index, 0, -1)
            else
                api.nvim_buf_add_highlight(hud_buf, -1, "ErrorMsg", line_index, 0, -1)
            end
        end
    end
end


-- start run
function M.start_run()
    splits = {}
    start_time = os.time()
    slot_index = 1
    open_hud()
    timer.start()
    if M.timer_loop then M.timer_loop:stop(); M.timer_loop:close() end
    M.timer_loop = vim.loop.new_timer()
    M.timer_loop:start(0, 1000, vim.schedule_wrap(update_hud))
end

-- add split
function M.add_split()
    if slot_index > #slots then
        print("All slots used")
        return
    end
    local slot_name = slots[slot_index]
    table.insert(splits, { name = slot_name, start = os.time() })
    slot_index = slot_index + 1
    timer.split()
    update_hud()
end

-- end run
function M.end_run()
    if M.timer_loop then M.timer_loop:stop(); M.timer_loop:close() end
    M.timer_loop = nil
    start_time = nil
    timer.stop()
    update_hud()
end

-- keymaps
vim.keymap.set("n", "<leader>rs", function() M.start_run() end, { desc = "Start contest run" })
vim.keymap.set("n", "<leader>ra", function() M.add_split() end, { desc = "Add next slot (A,B,C,…)" })
vim.keymap.set("n", "<leader>re", function() M.end_run() end, { desc = "End run" })

return M
