local M = {
  "ellisonleao/carbon-now.nvim", 
  opts = {
    base_url = "https://carbon.now.sh/",
    open_cmd = "xdg-open",
    options = {
      theme = "base16-dark",
      window_theme = "none",
      font_family = "MonoLisa",
      font_size = "18px",
      bg = "white",
      line_numbers = true,
      line_height = "100%",
      drop_shadow = true,
      drop_shadow_offset_y = "5px",
      drop_shadow_blur = "10px",
      width = "680",
      watermark = false,
    },
  },
  cmd = "CarbonNow"
}

return M
