local utils = {}

function utils.loadrequire(module)
  local function requiref(module)
    require(module)
  end

  res = pcall(requiref, module)
  -- if not (res) then
  --   -- Do Stuff when no module
  -- end
end

return utils
