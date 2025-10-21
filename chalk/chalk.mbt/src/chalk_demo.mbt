// MoonBit Chalk 终端着色与样式库演示
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

// 颜色支持检测结构体
pub struct ColorSupport {
  level: Int
  has256: Bool
  has16m: Bool
}

// 颜色支持检测
pub fn supports_color() -> ColorSupport {
  // 简化实现，实际项目中需要更复杂的检测逻辑
  ColorSupport { level: 3, has256: true, has16m: true }
}

// 主函数 - 演示所有功能
fn main {
  println("=== MoonBit Chalk 库演示 ===")
  println("")
  
  // 基础颜色展示
  println("=== 基础颜色 ===")
  println(red("红色文本"))
  println(green("绿色文本"))
  println(blue("蓝色文本"))
  println(yellow("黄色文本"))
  println(magenta("品红文本"))
  println(cyan("青色文本"))
  println(white("白色文本"))
  println(black("黑色文本"))
  println(gray("灰色文本"))
  println("")
  
  // 亮色调颜色展示
  println("=== 亮色调颜色 ===")
  println(bright_red("亮红色文本"))
  println(bright_green("亮绿色文本"))
  println(bright_blue("亮蓝色文本"))
  println(bright_yellow("亮黄色文本"))
  println(bright_magenta("亮品红文本"))
  println(bright_cyan("亮青色文本"))
  println(bright_white("亮白色文本"))
  println(bright_black("亮黑色文本"))
  println("")
  
  // 样式展示
  println("=== 文本样式 ===")
  println(bold("粗体文本"))
  println(dim("暗淡文本"))
  println(italic("斜体文本"))
  println(underline("下划线文本"))
  println(strikethrough("删除线文本"))
  println(inverse("反转文本"))
  println(hidden("隐藏文本") + " (隐藏文本，实际终端可能不可见)")
  println("")
  
  // 背景色展示
  println("=== 背景色 ===")
  println(bg_red("红色背景文本"))
  println(bg_green("绿色背景文本"))
  println(bg_blue("蓝色背景文本"))
  println(bg_yellow("黄色背景文本"))
  println(bg_magenta("品红背景文本"))
  println(bg_cyan("青色背景文本"))
  println(bg_white("白色背景文本"))
  println(bg_black("黑色背景文本"))
  println("")
  
  // 亮色调背景色展示
  println("=== 亮色调背景色 ===")
  println(bg_bright_red("亮红色背景文本"))
  println(bg_bright_green("亮绿色背景文本"))
  println(bg_bright_blue("亮蓝色背景文本"))
  println(bg_bright_yellow("亮黄色背景文本"))
  println(bg_bright_magenta("亮品红背景文本"))
  println(bg_bright_cyan("亮青色背景文本"))
  println(bg_bright_white("亮白色背景文本"))
  println(bg_bright_black("亮黑色背景文本"))
  println("")
  
  // 链式样式展示
  println("=== 链式样式 ===")
  println(red_bold("红色粗体文本"))
  println(green_bold("绿色粗体文本"))
  println(blue_bold("蓝色粗体文本"))
  println(yellow_bold("黄色粗体文本"))
  println("")
  
  // RGB 颜色展示
  println("=== RGB 颜色 ===")
  println(rgb(255, 0, 0, "RGB红色文本"))
  println(rgb(0, 255, 0, "RGB绿色文本"))
  println(rgb(0, 0, 255, "RGB蓝色文本"))
  println(rgb(255, 165, 0, "RGB橙色文本"))
  println(rgb(128, 0, 128, "RGB紫色文本"))
  println("")
  
  // HEX 颜色展示
  println("=== HEX 颜色 ===")
  println(hex("#ff0000", "HEX红色文本"))
  println(hex("#00ff00", "HEX绿色文本"))
  println(hex("#0000ff", "HEX蓝色文本"))
  println(hex("#ff6b6b", "HEX粉红色文本"))
  println(hex("#4ecdc4", "HEX青绿色文本"))
  println("")
  
  // 背景 RGB 颜色展示
  println("=== 背景 RGB 颜色 ===")
  println(bg_rgb(255, 0, 0, "RGB红色背景文本"))
  println(bg_rgb(0, 255, 0, "RGB绿色背景文本"))
  println(bg_rgb(0, 0, 255, "RGB蓝色背景文本"))
  println("")
  
  // 背景 HEX 颜色展示
  println("=== 背景 HEX 颜色 ===")
  println(bg_hex("#ff0000", "HEX红色背景文本"))
  println(bg_hex("#00ff00", "HEX绿色背景文本"))
  println(bg_hex("#0000ff", "HEX蓝色背景文本"))
  println("")
  
  // 工具函数演示
  println("=== 工具函数 ===")
  let colored_text = red("彩色文本")
  println("原始文本: " + colored_text)
  println("移除ANSI: " + strip_ansi(colored_text))
  println("可见宽度: " + visible_width(colored_text).to_string())
  println("")
  
  // 颜色支持信息
  let support = supports_color()
  println("=== 颜色支持信息 ===")
  println("级别: " + support.level.to_string())
  println("支持256色: " + support.has256.to_string())
  println("支持真彩色: " + support.has16m.to_string())
  println("")
  
  // 启用/禁用颜色演示
  println("=== 启用/禁用颜色 ===")
  println("启用颜色: " + red("这是红色文本"))
  disable()
  println("禁用颜色: " + red("这应该是普通文本"))
  enable()
  println("重新启用颜色: " + red("这应该是红色文本"))
  println("")
  
  println("=== 演示完成 ===")
}
