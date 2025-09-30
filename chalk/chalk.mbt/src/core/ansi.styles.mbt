// ANSI 转义码定义
// 包含所有支持的文本样式、前景色和背景色的 ANSI 代码

module ansi_styles

// 基础重置与样式
pub let reset = "\u001b[0m"

// 文本样式
pub let bold = "\u001b[1m"
pub let dim = "\u001b[2m"
pub let italic = "\u001b[3m"
pub let underline = "\u001b[4m"
pub let strikethrough = "\u001b[9m"
pub let inverse = "\u001b[7m"
pub let hidden = "\u001b[8m"

// 基础 16 色 - 前景色
pub let black = "\u001b[30m"
pub let red = "\u001b[31m"
pub let green = "\u001b[32m"
pub let yellow = "\u001b[33m"
pub let blue = "\u001b[34m"
pub let magenta = "\u001b[35m"
pub let cyan = "\u001b[36m"
pub let white = "\u001b[37m"
pub let gray = "\u001b[90m"

// 亮色调前景色
pub let bright_black = "\u001b[90m"
pub let bright_red = "\u001b[91m"
pub let bright_green = "\u001b[92m"
pub let bright_yellow = "\u001b[93m"
pub let bright_blue = "\u001b[94m"
pub let bright_magenta = "\u001b[95m"
pub let bright_cyan = "\u001b[96m"
pub let bright_white = "\u001b[97m"

// 基础 16 色 - 背景色
pub let bg_black = "\u001b[40m"
pub let bg_red = "\u001b[41m"
pub let bg_green = "\u001b[42m"
pub let bg_yellow = "\u001b[43m"
pub let bg_blue = "\u001b[44m"
pub let bg_magenta = "\u001b[45m"
pub let bg_cyan = "\u001b[46m"
pub let bg_white = "\u001b[47m"

// 亮色调背景色
pub let bg_bright_black = "\u001b[100m"
pub let bg_bright_red = "\u001b[101m"
pub let bg_bright_green = "\u001b[102m"
pub let bg_bright_yellow = "\u001b[103m"
pub let bg_bright_blue = "\u001b[104m"
pub let bg_bright_magenta = "\u001b[105m"
pub let bg_bright_cyan = "\u001b[106m"
pub let bg_bright_white = "\u001b[107m"

// 256 色与 TrueColor 生成函数
pub fn ansi256_fg(code: Int) -> String {
  "\u001b[38;5;%{code}m"
}

pub fn ansi256_bg(code: Int) -> String {
  "\u001b[48;5;%{code}m"
}

pub fn rgb_fg(r: Int, g: Int, b: Int) -> String {
  "\u001b[38;2;%{r};%{g};%{b}m"
}

pub fn rgb_bg(r: Int, g: Int, b: Int) -> String {
  "\u001b[48;2;%{r};%{g};%{b}m"
}

// 样式类型定义
pub type Style = {
  name: String,
  open: String,
  close: String,
  is_color: Bool
}

// 所有支持的样式映射
pub let styles_map: Dict[String, Style] = dict[
  "reset" => { name: "reset", open: reset, close: reset, is_color: false },
  "bold" => { name: "bold", open: bold, close: reset, is_color: false },
  "dim" => { name: "dim", open: dim, close: reset, is_color: false },
  "italic" => { name: "italic", open: italic, close: reset, is_color: false },
  "underline" => { name: "underline", open: underline, close: reset, is_color: false },
  "strikethrough" => { name: "strikethrough", open: strikethrough, close: reset, is_color: false },
  "inverse" => { name: "inverse", open: inverse, close: reset, is_color: false },
  "hidden" => { name: "hidden", open: hidden, close: reset, is_color: false },
  "black" => { name: "black", open: black, close: reset, is_color: true },
  "red" => { name: "red", open: red, close: reset, is_color: true },
  "green" => { name: "green", open: green, close: reset, is_color: true },
  "yellow" => { name: "yellow", open: yellow, close: reset, is_color: true },
  "blue" => { name: "blue", open: blue, close: reset, is_color: true },
  "magenta" => { name: "magenta", open: magenta, close: reset, is_color: true },
  "cyan" => { name: "cyan", open: cyan, close: reset, is_color: true },
  "white" => { name: "white", open: white, close: reset, is_color: true },
  "gray" => { name: "gray", open: gray, close: reset, is_color: true },
  "bright_black" => { name: "bright_black", open: bright_black, close: reset, is_color: true },
  "bright_red" => { name: "bright_red", open: bright_red, close: reset, is_color: true },
  "bright_green" => { name: "bright_green", open: bright_green, close: reset, is_color: true },
  "bright_yellow" => { name: "bright_yellow", open: bright_yellow, close: reset, is_color: true },
  "bright_blue" => { name: "bright_blue", open: bright_blue, close: reset, is_color: true },
  "bright_magenta" => { name: "bright_magenta", open: bright_magenta, close: reset, is_color: true },
  "bright_cyan" => { name: "bright_cyan", open: bright_cyan, close: reset, is_color: true },
  "bright_white" => { name: "bright_white", open: bright_white, close: reset, is_color: true },
  "bg_black" => { name: "bg_black", open: bg_black, close: reset, is_color: true },
  "bg_red" => { name: "bg_red", open: bg_red, close: reset, is_color: true },
  "bg_green" => { name: "bg_green", open: bg_green, close: reset, is_color: true },
  "bg_yellow" => { name: "bg_yellow", open: bg_yellow, close: reset, is_color: true },
  "bg_blue" => { name: "bg_blue", open: bg_blue, close: reset, is_color: true },
  "bg_magenta" => { name: "bg_magenta", open: bg_magenta, close: reset, is_color: true },
  "bg_cyan" => { name: "bg_cyan", open: bg_cyan, close: reset, is_color: true },
  "bg_white" => { name: "bg_white", open: bg_white, close: reset, is_color: true },
  "bg_bright_black" => { name: "bg_bright_black", open: bg_bright_black, close: reset, is_color: true },
  "bg_bright_red" => { name: "bg_bright_red", open: bg_bright_red, close: reset, is_color: true },
  "bg_bright_green" => { name: "bg_bright_green", open: bg_bright_green, close: reset, is_color: true },
  "bg_bright_yellow" => { name: "bg_bright_yellow", open: bg_bright_yellow, close: reset, is_color: true },
  "bg_bright_blue" => { name: "bg_bright_blue", open: bg_bright_blue, close: reset, is_color: true },
  "bg_bright_magenta" => { name: "bg_bright_magenta", open: bg_bright_magenta, close: reset, is_color: true },
  "bg_bright_cyan" => { name: "bg_bright_cyan", open: bg_bright_cyan, close: reset, is_color: true },
  "bg_bright_white" => { name: "bg_bright_white", open: bg_bright_white, close: reset, is_color: true }
]