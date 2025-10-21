// Chalk 库测试
import "./chalk"

test "basic colors" {
  let red_text = chalk::red("红色文本")
  let green_text = chalk::green("绿色文本")
  let blue_text = chalk::blue("蓝色文本")
  
  // 检查是否包含 ANSI 转义序列
  inspect(red_text.contains("\u001b[31m"), content="true")
  inspect(green_text.contains("\u001b[32m"), content="true")
  inspect(blue_text.contains("\u001b[34m"), content="true")
}

test "styles" {
  let bold_text = chalk::bold("粗体文本")
  let underline_text = chalk::underline("下划线文本")
  
  inspect(bold_text.contains("\u001b[1m"), content="true")
  inspect(underline_text.contains("\u001b[4m"), content="true")
}

test "background colors" {
  let bg_red_text = chalk::bg_red("红色背景")
  let bg_blue_text = chalk::bg_blue("蓝色背景")
  
  inspect(bg_red_text.contains("\u001b[41m"), content="true")
  inspect(bg_blue_text.contains("\u001b[44m"), content="true")
}

test "chained styles" {
  let red_bold_text = chalk::red_bold("红色粗体")
  
  inspect(red_bold_text.contains("\u001b[31m"), content="true")
  inspect(red_bold_text.contains("\u001b[1m"), content="true")
}

test "rgb colors" {
  let rgb_text = chalk::rgb(255, 0, 0, "RGB红色")
  
  inspect(rgb_text.contains("\u001b[38;2;255;0;0m"), content="true")
}

test "hex colors" {
  let hex_text = chalk::hex("#ff0000", "HEX红色")
  
  inspect(hex_text.contains("\u001b[38;2;255;0;0m"), content="true")
}

test "enable disable" {
  chalk::disable()
  let disabled_text = chalk::red("禁用颜色")
  inspect(disabled_text, content="禁用颜色")
  
  chalk::enable()
  let enabled_text = chalk::red("启用颜色")
  inspect(enabled_text.contains("\u001b[31m"), content="true")
}

test "strip ansi" {
  let colored_text = chalk::red("彩色文本")
  let stripped = chalk::strip_ansi(colored_text)
  inspect(stripped, content="彩色文本")
}

test "visible width" {
  let normal_text = "hello"
  let colored_text = chalk::red("hello")
  let wide_text = "你好世界"
  
  inspect(chalk::visible_width(normal_text), content="5")
  inspect(chalk::visible_width(colored_text), content="5")
  inspect(chalk::visible_width(wide_text), content="8")
}

