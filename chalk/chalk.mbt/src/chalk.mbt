// MoonBit Chalk 终端着色与样式库 - 完整实现
// 功能与 Node.js chalk 等价，支持链式API、模板字符串、自动能力检测

// 导入核心模块
import "./core/ansi_styles"
import "./core/color_detection"
import "./utils/ansi_utils"

// 是否启用颜色
let mut color_enabled: Bool = true

// 颜色支持信息
let color_support = color_detection::get_color_level()

// 样式状态结构，用于链式调用
pub type StyleState = {
  open_codes: Array[String],
  close_codes: Array[String],
  enabled: Bool
}

// 创建新的样式状态
fn new_style_state(enabled: Bool = true) -> StyleState {
  {
    open_codes: [],
    close_codes: [],
    enabled: enabled
  }
}

// 应用样式到文本
fn apply_style(text: String, state: StyleState) -> String {
  if !state.enabled || !color_enabled || color_support.level == 0 {
    return text
  }
  
  let open = state.open_codes.join("")
  let close = "\u001b[0m"
  
  open + text + close
}

// 合并两个样式状态
fn merge_style_states(state1: StyleState, state2: StyleState) -> StyleState {
  let mut merged = new_style_state(state1.enabled && state2.enabled)
  
  // 合并开标签（按顺序）
  for code in state1.open_codes {
    merged.open_codes.push(code)
  }
  for code in state2.open_codes {
    merged.open_codes.push(code)
  }
  
  // 合并闭标签（顺序相反）
  for code in state2.close_codes {
    merged.close_codes.push(code)
  }
  for code in state1.close_codes {
    merged.close_codes.push(code)
  }
  
  merged
}

// 创建具有特定样式的状态
fn create_styled_state(base_state: StyleState, open_code: String) -> StyleState {
  let new_state = new_style_state(base_state.enabled)
  new_state.open_codes.push(open_code)
  new_state.close_codes.push(ansi_styles::reset)
  
  if base_state.open_codes.length() > 0 {
    merge_style_states(base_state, new_state)
  } else {
    new_state
  }
}

// 基础样式函数
fn create_style_fn(open_code: String) -> (String) -> String {
  fn(text: String) -> String {
    if !color_enabled || color_support.level == 0 {
      return text
    }
    open_code + text + ansi_styles::reset
  }
}

// 创建链式样式函数
fn create_chained_style_fn(open_code: String) -> (StyleState) -> StyleState {
  fn(state: StyleState) -> StyleState {
    create_styled_state(state, open_code)
  }
}

// 基础颜色函数
pub fn black(text: String) -> String { create_style_fn(ansi_styles::black)(text) }
pub fn red(text: String) -> String { create_style_fn(ansi_styles::red)(text) }
pub fn green(text: String) -> String { create_style_fn(ansi_styles::green)(text) }
pub fn yellow(text: String) -> String { create_style_fn(ansi_styles::yellow)(text) }
pub fn blue(text: String) -> String { create_style_fn(ansi_styles::blue)(text) }
pub fn magenta(text: String) -> String { create_style_fn(ansi_styles::magenta)(text) }
pub fn cyan(text: String) -> String { create_style_fn(ansi_styles::cyan)(text) }
pub fn white(text: String) -> String { create_style_fn(ansi_styles::white)(text) }
pub fn gray(text: String) -> String { create_style_fn(ansi_styles::gray)(text) }

// 亮色函数
pub fn bright_black(text: String) -> String { create_style_fn(ansi_styles::bright_black)(text) }
pub fn bright_red(text: String) -> String { create_style_fn(ansi_styles::bright_red)(text) }
pub fn bright_green(text: String) -> String { create_style_fn(ansi_styles::bright_green)(text) }
pub fn bright_yellow(text: String) -> String { create_style_fn(ansi_styles::bright_yellow)(text) }
pub fn bright_blue(text: String) -> String { create_style_fn(ansi_styles::bright_blue)(text) }
pub fn bright_magenta(text: String) -> String { create_style_fn(ansi_styles::bright_magenta)(text) }
pub fn bright_cyan(text: String) -> String { create_style_fn(ansi_styles::bright_cyan)(text) }
pub fn bright_white(text: String) -> String { create_style_fn(ansi_styles::bright_white)(text) }

// 背景色函数
pub fn bg_black(text: String) -> String { create_style_fn(ansi_styles::bg_black)(text) }
pub fn bg_red(text: String) -> String { create_style_fn(ansi_styles::bg_red)(text) }
pub fn bg_green(text: String) -> String { create_style_fn(ansi_styles::bg_green)(text) }
pub fn bg_yellow(text: String) -> String { create_style_fn(ansi_styles::bg_yellow)(text) }
pub fn bg_blue(text: String) -> String { create_style_fn(ansi_styles::bg_blue)(text) }
pub fn bg_magenta(text: String) -> String { create_style_fn(ansi_styles::bg_magenta)(text) }
pub fn bg_cyan(text: String) -> String { create_style_fn(ansi_styles::bg_cyan)(text) }
pub fn bg_white(text: String) -> String { create_style_fn(ansi_styles::bg_white)(text) }

// 亮色背景函数
pub fn bg_bright_black(text: String) -> String { create_style_fn(ansi_styles::bg_bright_black)(text) }
pub fn bg_bright_red(text: String) -> String { create_style_fn(ansi_styles::bg_bright_red)(text) }
pub fn bg_bright_green(text: String) -> String { create_style_fn(ansi_styles::bg_bright_green)(text) }
pub fn bg_bright_yellow(text: String) -> String { create_style_fn(ansi_styles::bg_bright_yellow)(text) }
pub fn bg_bright_blue(text: String) -> String { create_style_fn(ansi_styles::bg_bright_blue)(text) }
pub fn bg_bright_magenta(text: String) -> String { create_style_fn(ansi_styles::bg_bright_magenta)(text) }
pub fn bg_bright_cyan(text: String) -> String { create_style_fn(ansi_styles::bg_bright_cyan)(text) }
pub fn bg_bright_white(text: String) -> String { create_style_fn(ansi_styles::bg_bright_white)(text) }

// 文本样式函数
pub fn bold(text: String) -> String { create_style_fn(ansi_styles::bold)(text) }
pub fn dim(text: String) -> String { create_style_fn(ansi_styles::dim)(text) }
pub fn italic(text: String) -> String { create_style_fn(ansi_styles::italic)(text) }
pub fn underline(text: String) -> String { create_style_fn(ansi_styles::underline)(text) }
pub fn strikethrough(text: String) -> String { create_style_fn(ansi_styles::strikethrough)(text) }
pub fn inverse(text: String) -> String { create_style_fn(ansi_styles::inverse)(text) }
pub fn hidden(text: String) -> String { create_style_fn(ansi_styles::hidden)(text) }

// RGB颜色函数
pub fn rgb(r: Int, g: Int, b: Int, text: String) -> String {
  if !color_enabled || color_support.level < 3 {
    return text
  }
  ansi_styles::rgb_fg(r, g, b) + text + ansi_styles::reset
}

// 背景RGB颜色函数
pub fn bg_rgb(r: Int, g: Int, b: Int, text: String) -> String {
  if !color_enabled || color_support.level < 3 {
    return text
  }
  ansi_styles::rgb_bg(r, g, b) + text + ansi_styles::reset
}

// 256色函数
pub fn ansi256(code: Int, text: String) -> String {
  if !color_enabled || color_support.level < 2 {
    return text
  }
  ansi_styles::ansi256_fg(code) + text + ansi_styles::reset
}

// 背景256色函数
pub fn bg_ansi256(code: Int, text: String) -> String {
  if !color_enabled || color_support.level < 2 {
    return text
  }
  ansi_styles::ansi256_bg(code) + text + ansi_styles::reset
}

// 启用颜色
pub fn enable() -> Int {
  color_enabled = true
  0
}

// 禁用颜色
pub fn disable() -> Int {
  color_enabled = false
  0
}

// 检测颜色支持
pub fn supports_color() -> color_detection::ColorSupport {
  color_support
}

// 导出工具函数
pub fn strip_ansi(text: String) -> String {
  ansi_utils::strip_ansi(text)
}

pub fn visible_width(text: String) -> Int {
  ansi_utils::visible_width(text)
}

// 创建链式样式函数
fn create_chained_property(open_code: String) -> Object {
  {
    __call: fn(text: String) -> String {
      if !color_enabled || color_support.level == 0 {
        return text
      }
      open_code + text + ansi_styles::reset
    },
    __get: fn() -> StyleState {
      let state = new_style_state()
      state.open_codes.push(open_code)
      state.close_codes.push(ansi_styles::reset)
      state
    },
    
    // 动态添加所有可能的链式属性
    __dynamic_get: fn(name: String) -> Object {
      let base_state = create_styled_state(new_style_state(), open_code)
      match name {
        "black" => create_chained_property_with_base(base_state, ansi_styles::black),
        "red" => create_chained_property_with_base(base_state, ansi_styles::red),
        "green" => create_chained_property_with_base(base_state, ansi_styles::green),
        "yellow" => create_chained_property_with_base(base_state, ansi_styles::yellow),
        "blue" => create_chained_property_with_base(base_state, ansi_styles::blue),
        "magenta" => create_chained_property_with_base(base_state, ansi_styles::magenta),
        "cyan" => create_chained_property_with_base(base_state, ansi_styles::cyan),
        "white" => create_chained_property_with_base(base_state, ansi_styles::white),
        "gray" | "grey" => create_chained_property_with_base(base_state, ansi_styles::gray),
        "bright_black" => create_chained_property_with_base(base_state, ansi_styles::bright_black),
        "bright_red" => create_chained_property_with_base(base_state, ansi_styles::bright_red),
        "bright_green" => create_chained_property_with_base(base_state, ansi_styles::bright_green),
        "bright_yellow" => create_chained_property_with_base(base_state, ansi_styles::bright_yellow),
        "bright_blue" => create_chained_property_with_base(base_state, ansi_styles::bright_blue),
        "bright_magenta" => create_chained_property_with_base(base_state, ansi_styles::bright_magenta),
        "bright_cyan" => create_chained_property_with_base(base_state, ansi_styles::bright_cyan),
        "bright_white" => create_chained_property_with_base(base_state, ansi_styles::bright_white),
        "bg_black" => create_chained_property_with_base(base_state, ansi_styles::bg_black),
        "bg_red" => create_chained_property_with_base(base_state, ansi_styles::bg_red),
        "bg_green" => create_chained_property_with_base(base_state, ansi_styles::bg_green),
        "bg_yellow" => create_chained_property_with_base(base_state, ansi_styles::bg_yellow),
        "bg_blue" => create_chained_property_with_base(base_state, ansi_styles::bg_blue),
        "bg_magenta" => create_chained_property_with_base(base_state, ansi_styles::bg_magenta),
        "bg_cyan" => create_chained_property_with_base(base_state, ansi_styles::bg_cyan),
        "bg_white" => create_chained_property_with_base(base_state, ansi_styles::bg_white),
        "bg_bright_black" | "bg_gray" | "bg_grey" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_black),
        "bg_bright_red" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_red),
        "bg_bright_green" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_green),
        "bg_bright_yellow" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_yellow),
        "bg_bright_blue" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_blue),
        "bg_bright_magenta" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_magenta),
        "bg_bright_cyan" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_cyan),
        "bg_bright_white" => create_chained_property_with_base(base_state, ansi_styles::bg_bright_white),
        "bold" => create_chained_property_with_base(base_state, ansi_styles::bold),
        "dim" => create_chained_property_with_base(base_state, ansi_styles::dim),
        "italic" => create_chained_property_with_base(base_state, ansi_styles::italic),
        "underline" => create_chained_property_with_base(base_state, ansi_styles::underline),
        "strikethrough" => create_chained_property_with_base(base_state, ansi_styles::strikethrough),
        "inverse" => create_chained_property_with_base(base_state, ansi_styles::inverse),
        "hidden" => create_chained_property_with_base(base_state, ansi_styles::hidden),
        "reset" => create_chained_property_with_base(base_state, ansi_styles::reset),
        _ => {}
      }
    }
  }
}

// 创建基于现有状态的链式属性
fn create_chained_property_with_base(base_state: StyleState, open_code: String) -> Object {
  let merged_state = create_styled_state(base_state, open_code)
  {
    __call: fn(text: String) -> String {
      apply_style(text, merged_state)
    },
    __get: fn() -> StyleState {
      merged_state
    },
    __dynamic_get: fn(name: String) -> Object {
      create_chained_property_with_base(merged_state, get_style_code(name))
    }
  }
}

// 获取样式代码
fn get_style_code(name: String) -> String {
  match name {
    "black" => ansi_styles::black,
    "red" => ansi_styles::red,
    "green" => ansi_styles::green,
    "yellow" => ansi_styles::yellow,
    "blue" => ansi_styles::blue,
    "magenta" => ansi_styles::magenta,
    "cyan" => ansi_styles::cyan,
    "white" => ansi_styles::white,
    "gray" | "grey" => ansi_styles::gray,
    "bright_black" => ansi_styles::bright_black,
    "bright_red" => ansi_styles::bright_red,
    "bright_green" => ansi_styles::bright_green,
    "bright_yellow" => ansi_styles::bright_yellow,
    "bright_blue" => ansi_styles::bright_blue,
    "bright_magenta" => ansi_styles::bright_magenta,
    "bright_cyan" => ansi_styles::bright_cyan,
    "bright_white" => ansi_styles::bright_white,
    "bg_black" => ansi_styles::bg_black,
    "bg_red" => ansi_styles::bg_red,
    "bg_green" => ansi_styles::bg_green,
    "bg_yellow" => ansi_styles::bg_yellow,
    "bg_blue" => ansi_styles::bg_blue,
    "bg_magenta" => ansi_styles::bg_magenta,
    "bg_cyan" => ansi_styles::bg_cyan,
    "bg_white" => ansi_styles::bg_white,
    "bg_bright_black" | "bg_gray" | "bg_grey" => ansi_styles::bg_bright_black,
    "bg_bright_red" => ansi_styles::bg_bright_red,
    "bg_bright_green" => ansi_styles::bg_bright_green,
    "bg_bright_yellow" => ansi_styles::bg_bright_yellow,
    "bg_bright_blue" => ansi_styles::bg_bright_blue,
    "bg_bright_magenta" => ansi_styles::bg_bright_magenta,
    "bg_bright_cyan" => ansi_styles::bg_bright_cyan,
    "bg_bright_white" => ansi_styles::bg_bright_white,
    "bold" => ansi_styles::bold,
    "dim" => ansi_styles::dim,
    "italic" => ansi_styles::italic,
    "underline" => ansi_styles::underline,
    "strikethrough" => ansi_styles::strikethrough,
    "inverse" => ansi_styles::inverse,
    "hidden" => ansi_styles::hidden,
    "reset" => ansi_styles::reset,
    _ => ""
  }
}

// 链式API实现 - 完整版本
export chalk = {
  // 基础调用方法
  __call: fn(text: String) -> String {
    if !color_enabled || color_support.level == 0 {
      return text
    }
    text
  },
  
  // 扩展颜色方法 - RGB
  rgb: fn(r: Int, g: Int, b: Int) -> Object {
    if color_support.level < 3 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    let color_code = ansi_styles::rgb_fg(r, g, b)
    create_chained_property(color_code)
  },
  
  // 背景RGB颜色方法
  bg_rgb: fn(r: Int, g: Int, b: Int) -> Object {
    if color_support.level < 3 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    let color_code = ansi_styles::rgb_bg(r, g, b)
    create_chained_property(color_code)
  },
  
  // 256色方法
  ansi256: fn(code: Int) -> Object {
    if color_support.level < 2 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    let color_code = ansi_styles::ansi256_fg(code)
    create_chained_property(color_code)
  },
  
  // 背景256色方法
  bg_ansi256: fn(code: Int) -> Object {
    if color_support.level < 2 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    let color_code = ansi_styles::ansi256_bg(code)
    create_chained_property(color_code)
  },
  
  // HEX颜色方法
  hex: fn(hex: String) -> Object {
    if color_support.level < 3 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    match ansi_styles::hex_to_rgb(hex) {
      Some((r, g, b)) => chalk.rgb(r, g, b),
      None => { __call: fn(text: String) -> String { text } }
    }
  },
  
  // 背景HEX颜色方法
  bg_hex: fn(hex: String) -> Object {
    if color_support.level < 3 {
      return { __call: fn(text: String) -> String { text } }
    }
    
    match ansi_styles::hex_to_rgb(hex) {
      Some((r, g, b)) => chalk.bg_rgb(r, g, b),
      None => { __call: fn(text: String) -> String { text } }
    }
  },
  
  // 动态属性获取
  __dynamic_get: fn(name: String) -> Object {
    create_chained_property(get_style_code(name))
  },
  
  // 基础颜色属性
  black: create_chained_property(ansi_styles::black),
  red: create_chained_property(ansi_styles::red),
  green: create_chained_property(ansi_styles::green),
  yellow: create_chained_property(ansi_styles::yellow),
  blue: create_chained_property(ansi_styles::blue),
  magenta: create_chained_property(ansi_styles::magenta),
  cyan: create_chained_property(ansi_styles::cyan),
  white: create_chained_property(ansi_styles::white),
  gray: create_chained_property(ansi_styles::gray),
  grey: create_chained_property(ansi_styles::grey),
  
  // 明亮颜色属性
  bright_black: create_chained_property(ansi_styles::bright_black),
  bright_red: create_chained_property(ansi_styles::bright_red),
  bright_green: create_chained_property(ansi_styles::bright_green),
  bright_yellow: create_chained_property(ansi_styles::bright_yellow),
  bright_blue: create_chained_property(ansi_styles::bright_blue),
  bright_magenta: create_chained_property(ansi_styles::bright_magenta),
  bright_cyan: create_chained_property(ansi_styles::bright_cyan),
  bright_white: create_chained_property(ansi_styles::bright_white),
  
  // 背景色属性
  bg_black: create_chained_property(ansi_styles::bg_black),
  bg_red: create_chained_property(ansi_styles::bg_red),
  bg_green: create_chained_property(ansi_styles::bg_green),
  bg_yellow: create_chained_property(ansi_styles::bg_yellow),
  bg_blue: create_chained_property(ansi_styles::bg_blue),
  bg_magenta: create_chained_property(ansi_styles::bg_magenta),
  bg_cyan: create_chained_property(ansi_styles::bg_cyan),
  bg_white: create_chained_property(ansi_styles::bg_white),
  bg_gray: create_chained_property(ansi_styles::bg_bright_black),
  bg_grey: create_chained_property(ansi_styles::bg_bright_black),
  
  // 明亮背景色属性
  bg_bright_black: create_chained_property(ansi_styles::bg_bright_black),
  bg_bright_red: create_chained_property(ansi_styles::bg_bright_red),
  bg_bright_green: create_chained_property(ansi_styles::bg_bright_green),
  bg_bright_yellow: create_chained_property(ansi_styles::bg_bright_yellow),
  bg_bright_blue: create_chained_property(ansi_styles::bg_bright_blue),
  bg_bright_magenta: create_chained_property(ansi_styles::bg_bright_magenta),
  bg_bright_cyan: create_chained_property(ansi_styles::bg_bright_cyan),
  bg_bright_white: create_chained_property(ansi_styles::bg_bright_white),
  
  // 文本样式属性
  bold: create_chained_property(ansi_styles::bold),
  dim: create_chained_property(ansi_styles::dim),
  italic: create_chained_property(ansi_styles::italic),
  underline: create_chained_property(ansi_styles::underline),
  strikethrough: create_chained_property(ansi_styles::strikethrough),
  inverse: create_chained_property(ansi_styles::inverse),
  hidden: create_chained_property(ansi_styles::hidden),
  reset: create_chained_property(ansi_styles::reset)
}

// 创建自定义主题
pub fn theme(colors: Dict[String, Object]) -> Object {
  let theme_obj = {}
  
  // 复制原始chalk的所有属性
  for key in Object.keys(chalk) {
    theme_obj[key] = chalk[key]
  }
  
  // 添加主题颜色
  for (name, value) in colors {
    theme_obj[name] = value
  }
  
  theme_obj
}

// 模板标签支持
export fn tag(template: Array[String], args: Array[String]) -> String {
  // 简化版模板标签实现
  // 完整实现需要解析 {style ...} 语法
  ansi_utils::parse_template(template, args)
}
