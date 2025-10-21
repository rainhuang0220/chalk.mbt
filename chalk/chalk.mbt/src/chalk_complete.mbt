// MoonBit Chalk 终端着色与样式库
// 使用正确的 MoonBit 语法

// ANSI 转义码常量
let reset = "\u001b[0m"
let bold = "\u001b[1m"
let dim = "\u001b[2m"
let italic = "\u001b[3m"
let underline = "\u001b[4m"
let strikethrough = "\u001b[9m"
let inverse = "\u001b[7m"
let hidden = "\u001b[8m"

// 基础颜色
let black = "\u001b[30m"
let red = "\u001b[31m"
let green = "\u001b[32m"
let yellow = "\u001b[33m"
let blue = "\u001b[34m"
let magenta = "\u001b[35m"
let cyan = "\u001b[36m"
let white = "\u001b[37m"
let gray = "\u001b[90m"

// 亮色调颜色
let bright_black = "\u001b[90m"
let bright_red = "\u001b[91m"
let bright_green = "\u001b[92m"
let bright_yellow = "\u001b[93m"
let bright_blue = "\u001b[94m"
let bright_magenta = "\u001b[95m"
let bright_cyan = "\u001b[96m"
let bright_white = "\u001b[97m"

// 背景色
let bg_black = "\u001b[40m"
let bg_red = "\u001b[41m"
let bg_green = "\u001b[42m"
let bg_yellow = "\u001b[43m"
let bg_blue = "\u001b[44m"
let bg_magenta = "\u001b[45m"
let bg_cyan = "\u001b[46m"
let bg_white = "\u001b[47m"

// 亮色调背景色
let bg_bright_black = "\u001b[100m"
let bg_bright_red = "\u001b[101m"
let bg_bright_green = "\u001b[102m"
let bg_bright_yellow = "\u001b[103m"
let bg_bright_blue = "\u001b[104m"
let bg_bright_magenta = "\u001b[105m"
let bg_bright_cyan = "\u001b[106m"
let bg_bright_white = "\u001b[107m"

// 全局颜色启用状态
let mut color_enabled = true

// 启用颜色
pub fn enable() {
  color_enabled = true
}

// 禁用颜色
pub fn disable() {
  color_enabled = false
}

// 应用样式到文本
fn apply_style(text: String, style: String) -> String {
  if color_enabled {
    style + text + reset
  } else {
    text
  }
}

// 基础颜色函数
pub fn red(text: String) -> String {
  apply_style(text, red)
}

pub fn green(text: String) -> String {
  apply_style(text, green)
}

pub fn blue(text: String) -> String {
  apply_style(text, blue)
}

pub fn yellow(text: String) -> String {
  apply_style(text, yellow)
}

pub fn magenta(text: String) -> String {
  apply_style(text, magenta)
}

pub fn cyan(text: String) -> String {
  apply_style(text, cyan)
}

pub fn white(text: String) -> String {
  apply_style(text, white)
}

pub fn black(text: String) -> String {
  apply_style(text, black)
}

pub fn gray(text: String) -> String {
  apply_style(text, gray)
}

// 亮色调颜色
pub fn bright_red(text: String) -> String {
  apply_style(text, bright_red)
}

pub fn bright_green(text: String) -> String {
  apply_style(text, bright_green)
}

pub fn bright_blue(text: String) -> String {
  apply_style(text, bright_blue)
}

pub fn bright_yellow(text: String) -> String {
  apply_style(text, bright_yellow)
}

pub fn bright_magenta(text: String) -> String {
  apply_style(text, bright_magenta)
}

pub fn bright_cyan(text: String) -> String {
  apply_style(text, bright_cyan)
}

pub fn bright_white(text: String) -> String {
  apply_style(text, bright_white)
}

pub fn bright_black(text: String) -> String {
  apply_style(text, bright_black)
}

// 样式函数
pub fn bold(text: String) -> String {
  apply_style(text, bold)
}

pub fn dim(text: String) -> String {
  apply_style(text, dim)
}

pub fn italic(text: String) -> String {
  apply_style(text, italic)
}

pub fn underline(text: String) -> String {
  apply_style(text, underline)
}

pub fn strikethrough(text: String) -> String {
  apply_style(text, strikethrough)
}

pub fn inverse(text: String) -> String {
  apply_style(text, inverse)
}

pub fn hidden(text: String) -> String {
  apply_style(text, hidden)
}

// 背景色函数
pub fn bg_red(text: String) -> String {
  apply_style(text, bg_red)
}

pub fn bg_green(text: String) -> String {
  apply_style(text, bg_green)
}

pub fn bg_blue(text: String) -> String {
  apply_style(text, bg_blue)
}

pub fn bg_yellow(text: String) -> String {
  apply_style(text, bg_yellow)
}

pub fn bg_magenta(text: String) -> String {
  apply_style(text, bg_magenta)
}

pub fn bg_cyan(text: String) -> String {
  apply_style(text, bg_cyan)
}

pub fn bg_white(text: String) -> String {
  apply_style(text, bg_white)
}

pub fn bg_black(text: String) -> String {
  apply_style(text, bg_black)
}

// 亮色调背景色
pub fn bg_bright_red(text: String) -> String {
  apply_style(text, bg_bright_red)
}

pub fn bg_bright_green(text: String) -> String {
  apply_style(text, bg_bright_green)
}

pub fn bg_bright_blue(text: String) -> String {
  apply_style(text, bg_bright_blue)
}

pub fn bg_bright_yellow(text: String) -> String {
  apply_style(text, bg_bright_yellow)
}

pub fn bg_bright_magenta(text: String) -> String {
  apply_style(text, bg_bright_magenta)
}

pub fn bg_bright_cyan(text: String) -> String {
  apply_style(text, bg_bright_cyan)
}

pub fn bg_bright_white(text: String) -> String {
  apply_style(text, bg_bright_white)
}

pub fn bg_bright_black(text: String) -> String {
  apply_style(text, bg_bright_black)
}

// 链式样式函数
pub fn red_bold(text: String) -> String {
  apply_style(text, red + bold)
}

pub fn green_bold(text: String) -> String {
  apply_style(text, green + bold)
}

pub fn blue_bold(text: String) -> String {
  apply_style(text, blue + bold)
}

pub fn yellow_bold(text: String) -> String {
  apply_style(text, yellow + bold)
}

// RGB 颜色函数
pub fn rgb(r: Int, g: Int, b: Int, text: String) -> String {
  let valid_r = max(0, min(255, r))
  let valid_g = max(0, min(255, g))
  let valid_b = max(0, min(255, b))
  let rgb_code = "\u001b[38;2;" + valid_r.to_string() + ";" + valid_g.to_string() + ";" + valid_b.to_string() + "m"
  apply_style(text, rgb_code)
}

// 背景 RGB 颜色函数
pub fn bg_rgb(r: Int, g: Int, b: Int, text: String) -> String {
  let valid_r = max(0, min(255, r))
  let valid_g = max(0, min(255, g))
  let valid_b = max(0, min(255, b))
  let bg_rgb_code = "\u001b[48;2;" + valid_r.to_string() + ";" + valid_g.to_string() + ";" + valid_b.to_string() + "m"
  apply_style(text, bg_rgb_code)
}

// HEX 颜色函数
pub fn hex(hex_color: String, text: String) -> String {
  if hex_color.starts_with("#") {
    let clean = hex_color.slice(1)
    if clean.length() == 6 {
      let r = Int.parse(clean.slice(0, 2), 16) ?? 0
      let g = Int.parse(clean.slice(2, 4), 16) ?? 0
      let b = Int.parse(clean.slice(4, 6), 16) ?? 0
      return rgb(r, g, b, text)
    }
  }
  text
}

// 背景 HEX 颜色函数
pub fn bg_hex(hex_color: String, text: String) -> String {
  if hex_color.starts_with("#") {
    let clean = hex_color.slice(1)
    if clean.length() == 6 {
      let r = Int.parse(clean.slice(0, 2), 16) ?? 0
      let g = Int.parse(clean.slice(2, 4), 16) ?? 0
      let b = Int.parse(clean.slice(4, 6), 16) ?? 0
      return bg_rgb(r, g, b, text)
    }
  }
  text
}

// 工具函数
pub fn strip_ansi(text: String) -> String {
  // 简单的 ANSI 转义序列移除
  let ansi_regex = regex::Regex.new("\\u001b\\[[0-9;]*m")
  ansi_regex.replace_all(text, "")
}

pub fn visible_width(text: String) -> Int {
  let clean = strip_ansi(text)
  let chars = clean.to_array()
  var width = 0
  
  for c in chars {
    let code_point = c.code_point()
    // 宽字符（如中文）占两个字符宽度
    if (code_point >= 0x4e00 && code_point <= 0x9fff) ||  // CJK 统一表意文字
       (code_point >= 0x3040 && code_point <= 0x30ff) ||  // 日文平假名和片假名
       (code_point >= 0xac00 && code_point <= 0xd7af) ||  // 韩文音节
       code_point == 0x3000 {  // 全角空格
      width += 2
    } else if code_point < 32 || code_point == 127 { // 控制字符
      width += 0
    } else {
      width += 1
    }
  }
  
  width
}

// 颜色支持检测
pub fn supports_color() -> { level: Int, has256: Bool, has16m: Bool } {
  // 简化实现，实际项目中需要更复杂的检测逻辑
  { level: 3, has256: true, has16m: true }
}

// 测试函数
pub fn test_chalk() {
  println("=== Chalk 库测试 ===")
  println(red("红色文本"))
  println(green("绿色文本"))
  println(blue("蓝色文本"))
  println(yellow("黄色文本"))
  println("")
  println(bold("粗体文本"))
  println(underline("下划线文本"))
  println("")
  println(bg_red("红色背景文本"))
  println(bg_blue("蓝色背景文本"))
  println("")
  println(red_bold("红色粗体文本"))
  println(green_bold("绿色粗体文本"))
  println("")
  println(rgb(255, 0, 0, "RGB红色文本"))
  println(hex("#00ff00", "HEX绿色文本"))
  println("")
  println("禁用颜色测试:")
  disable()
  println(red("这应该是普通文本"))
  enable()
  println(red("这应该是红色文本"))
}

