local recording = {}

local recording_char

function recording.setup()
  local group = vim.api.nvim_create_augroup("nacro_recording", {})
  vim.api.nvim_create_autocmd("RecordingEnter", {
    group = group,
    callback = function()
      recording_char = vim.fn.reg_recording()
    end,
  })
  vim.api.nvim_create_autocmd("RecordingLeave", {
    group = group,
    callback = function()
      recording_char = nil
    end,
  })
end

function recording.is_recording()
  return recording_char ~= nil
end

function recording.get_recording()
  if recording_char ~= nil then
    return "@" .. recording_char
  end
end

return recording
