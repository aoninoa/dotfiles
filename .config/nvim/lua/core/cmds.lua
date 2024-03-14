local cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

cmd("WinCloseAnother", function ()
    local cur_win = vim.api.nvim_get_current_win()
    for _, value in ipairs(vim.api.nvim_list_wins()) do
        if cur_win ~= value then
            vim.api.nvim_win_close(value, false)
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
				::again::
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
					goto again
				end
			end
		end
		vim.api.nvim_buf_delete(bufn, opt)
		::continue::
	end
end, { nargs = "?" })

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
    pattern =  { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "json", },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 4
        vim.opt.expandtab = true
    end
})

