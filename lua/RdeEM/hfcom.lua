local full_sym = {
    "，", "。", "、", "・", "｜", "／", "＼", "［", "］", "～", "｛", "｝"
}

local full_com = "〔全角〕"

local half_sym = {
    ",", ".", "､", "·", "|", "/", "\\", "[", "]", "~", "{", "}"
}

local half_com = "〔半角〕"

local function table_include_value(loc_table, loc_value)
    for _, loop_value in pairs(loc_table) do
        if loop_value == loc_value then
            return true
        end
    end
    return false
end

local function filter(input)
    for cand in input:iter() do
        local str = cand.text
        if utf8.len(str) == 1 then
            if table_include_value(full_sym, str) then
                cand:get_genuine().comment = full_com
            elseif table_include_value(half_sym, str) then
                cand:get_genuine().comment = half_com
            end
        end
        yield(cand)
    end
end

return filter