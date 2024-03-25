local cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- Unused
--[[
-- from
-- `stackoverflow.com/questions/5303174/how-to-get-list-of-directories-in-lua`

local function listdir(dirname)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -aA "' .. dirname .. '"')
    if pfile ~= nil then
        for filename in pfile:lines() do
            i = i + 1
            t[i] = filename
        end
        pfile:close()
    end
    return t
end

-- from
-- https://stackoverflow.com/questions/1410862/concatenation-of-tables-in-lua
local function tblconcat(t1, t2)
    for i=1, #t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

cmd("Compile", function(opts)
    local command = opts.args
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.fn.getbufvar(buf, "&buftype") == "terminal" then
            vim.cmd("bd " .. buf)
        end
    end
    if string.len(command) == 0 then
        command = vim.fn.input("Enter a compile command: ", "", "shellcmd")
        if string.len(command) == 0 then
            vim.api.nvim_err_writeln("No compile command")
        end
    end
    if #vim.api.nvim_list_wins() == 1 then
        vim.cmd("14sp")
    end
    vim.cmd("term " .. command)
end, {
    nargs = "*",
    force = true,
    range = true,
    -- complete = "shellcmd",
    -- TODO: Implement more frinendly completion
    -- TODO: Implement recursive direcory completion
    complete = function(arglead, line)
        local words = vim.split(line, "%s+")
        local matches = {}
        if vim.startswith(arglead, "./") then
            for _, file in ipairs(listdir(vim.fn.getcwd())) do
                table.insert(matches, "./" .. file)
            end
            return matches
        end
        if #words == 2 then
            for path in string.gmatch(os.getenv("PATH"), "([^:]+)") do
                for _, command in ipairs(listdir(path)) do
                    if vim.startswith(command, arglead) then
                        table.insert(matches, command)
                    end
                end
            end
        elseif #words > 2 then
            if vim.startswith(arglead, "./") then
                -- string.gsub(
            end
            for _, file in ipairs(listdir(vim.fn.getcwd())) do
                if vim.startswith(file, arglead) then
                    table.insert(matches, file)
                end
            end
        end
        return matches
    end,
})
--]]

cmd("WinCloseAnother", function()
    local cur_win = vim.api.nvim_get_current_win()
    for _, value in ipairs(vim.api.nvim_list_wins()) do
        if cur_win ~= value then
            vim.api.nvim_win_close(value, false)
        end
    end
end, {})

cmd("BufCloseAnother", function()
    local cur_buf = vim.api.nvim_get_current_buf()
    for _, value in ipairs(vim.api.nvim_list_bufs()) do
        if cur_buf ~= value then
            vim.cmd("DelBuf " .. value)
        end
    end
end, {})

local function split_string_by_white(str)
    if string.len(str) == 0 then
        return { 0 }
    end
    local t = {}
    for w in string.gmatch(str, "([^%s]+)") do
        table.insert(t, w)
    end
    return t
end

cmd("DelBuf", function(opts)
    -- split argument by white space
    local args = split_string_by_white(opts.args)
    local all = false
    for _, value in ipairs(args) do
        local bufn = tonumber(value)
        if bufn == nil then
            goto continue
        end
        -- check specified buffer is valid
        if
            not vim.api.nvim_buf_is_valid(bufn)
            and not vim.api.nvim_buf_is_loaded(bufn)
        then
            goto continue
        end
        if bufn == 0 then
            bufn = vim.api.nvim_get_current_buf()
        end
        local opt = { force = false, unload = false }
        -- if specified buffer is modified
        if vim.fn.getbufvar(bufn, "&mod") == 1 then
            if all then
                vim.cmd("silent " .. bufn .. "bufdo :w")
            else
                ::try_again::
                local input = vim.fn.input(
                    "Are you sure to save and delete buffer `"
                    .. vim.api.nvim_buf_get_name(bufn)
                    .. "`? {(y)es, (n)o, (i)gnore, (a)ll, (c)ancel} "
                )
                -- process user input
                if input == "yes" or input == "y" then
                    vim.cmd("silent " .. bufn .. "bufdo :w")
                elseif input == "no" or input == "n" then
                    goto continue
                elseif input == "ignore" or input == "i" then
                    opt.force = true
                elseif input == "all" or input == "a" then
                    all = true
                    vim.cmd("silent " .. bufn .. "bufdo :w")
                elseif input == "cancel" or input == "c" then
                    break
                else
                    vim.print("\nPlease answer one of presented values")
                    goto try_again
                end
            end
        end
        vim.api.nvim_buf_delete(bufn, opt)
        ::continue::
    end
end, {
    nargs = "*",
    force = true,
    range = true,
    complete = function(_, _)
        local t = {}
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            table.insert(t, tostring(bufnr))
        end
        return t
    end,
})

-- auto commands --

autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("text_yank_post", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch" })
    end,
})

vim.api.nvim_create_augroup("tab", { clear = true })

autocmd("FileType", {
    group = "tab",
    pattern = "make",
    callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.expandtab = false
    end,
})

autocmd("FileType", {
    group = "tab",
    pattern = {
        "html",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "json",
        "toml",
        "yaml",
    },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 4
        vim.opt.expandtab = true
    end,
})
