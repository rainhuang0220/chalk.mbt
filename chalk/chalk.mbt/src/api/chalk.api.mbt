// Chalk API 实现
// 提供链式样式 API、模板字符串、颜色函数等核心功能

module chalk_api

import "../core/ansi.styles"
import "../core/color.detection"
import "../utils/ansi.utils"

// 样式状态
pub struct StyleState {
  styles: Array[String]
  enabled: Bool
}

// 主 Chalk 类型
pub struct Chalk {
  state: StyleState
}

// 全局配置
let mut global_config = StyleState {
  styles: [],
  enabled: true
}

// 创建新的 Chalk 实例
fn new_chalk(styles: Array[String] = []) -> Chalk {
  Chalk {
    state: StyleState {
      styles: styles,
      enabled: global_config.enabled
    }
  }
}

// 主 chalk 实例
pub let chalk = new_chalk()

// 启用颜色
pub fn enable() {
  global_config.enabled = true
}

// 禁用颜色
pub fn disable() {
  global_config.enabled = false
}

// 应用样式到文本
fn apply_style(text: String, styles: Array[String]) -> String {
  if !global_config.enabled || styles.length() == 0 {
    return text
  }

  let support = color_detection.supports_color()
  var applied = ""
  
  // 根据颜色支持级别选择适当的样式
  for style in styles {
    if ansi_styles.styles_map.contains(style) {
      applied += ansi_styles.styles_map[style]!.open
    }
  }
  
  applied + text + ansi_styles.reset
}

// 链式 API 实现
// 为 Chalk 类型添加所有样式方法
// 基础样式
def Chalk.bold(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bold"))
}

def Chalk.dim(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("dim"))
}

def Chalk.italic(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("italic"))
}

def Chalk.underline(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("underline"))
}

def Chalk.strikethrough(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("strikethrough"))
}

def Chalk.inverse(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("inverse"))
}

def Chalk.hidden(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("hidden"))
}

def Chalk.reset(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("reset"))
}

// 前景色
def Chalk.black(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("black"))
}

def Chalk.red(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("red"))
}

def Chalk.green(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("green"))
}

def Chalk.yellow(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("yellow"))
}

def Chalk.blue(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("blue"))
}

def Chalk.magenta(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("magenta"))
}

def Chalk.cyan(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("cyan"))
}

def Chalk.white(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("white"))
}

def Chalk.gray(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("gray"))
}

// 亮色调前景色
def Chalk.bright_black(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_black"))
}

def Chalk.bright_red(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_red"))
}

def Chalk.bright_green(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_green"))
}

def Chalk.bright_yellow(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_yellow"))
}

def Chalk.bright_blue(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_blue"))
}

def Chalk.bright_magenta(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_magenta"))
}

def Chalk.bright_cyan(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_cyan"))
}

def Chalk.bright_white(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bright_white"))
}

// 背景色
def Chalk.bg_black(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_black"))
}

def Chalk.bg_red(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_red"))
}

def Chalk.bg_green(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_green"))
}

def Chalk.bg_yellow(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_yellow"))
}

def Chalk.bg_blue(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_blue"))
}

def Chalk.bg_magenta(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_magenta"))
}

def Chalk.bg_cyan(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_cyan"))
}

def Chalk.bg_white(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_white"))
}

// 亮色调背景色
def Chalk.bg_bright_black(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_black"))
}

def Chalk.bg_bright_red(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_red"))
}

def Chalk.bg_bright_green(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_green"))
}

def Chalk.bg_bright_yellow(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_yellow"))
}

def Chalk.bg_bright_blue(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_blue"))
}

def Chalk.bg_bright_magenta(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_magenta"))
}

def Chalk.bg_bright_cyan(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_cyan"))
}

def Chalk.bg_bright_white(self: Chalk) -> Chalk {
  new_chalk(self.state.styles.append("bg_bright_white"))
}

// 颜色函数 - RGB
def Chalk.rgb(self: Chalk, r: Int, g: Int, b: Int) -> Chalk {
  // 验证 RGB 值
  let valid_r = max(0, min(255, r))
  let valid_g = max(0, min(255, g))
  let valid_b = max(0, min(255, b))
  
  let support = color_detection.supports_color()
  var new_styles = self.state.styles
  
  if support.level >= 3 {
    // 真彩色支持
    let rgb_code = "\u001b[38;2;" + valid_r.to_string() + ";" + valid_g.to_string() + ";" + valid_b.to_string() + "m"
    new_styles = new_styles.append(rgb_code)
  } else if support.level >= 2 {
    // 256 色支持 - 简化的 RGB 到 256 色映射
    let color_code = (valid_r * 6 / 256) * 36 + (valid_g * 6 / 256) * 6 + (valid_b * 6 / 256)
    let ansi256_code = "\u001b[38;5;" + color_code.to_string() + "m"
    new_styles = new_styles.append(ansi256_code)
  } else {
    // 16 色支持，进行颜色近似
    let color = if valid_r > 128 && valid_g < 128 && valid_b < 128 {
      "red"
    } else if valid_r < 128 && valid_g > 128 && valid_b < 128 {
      "green"
    } else if valid_r < 128 && valid_g < 128 && valid_b > 128 {
      "blue"
    } else if valid_r > 128 && valid_g > 128 && valid_b < 128 {
      "yellow"
    } else if valid_r > 128 && valid_g < 128 && valid_b > 128 {
      "magenta"
    } else if valid_r < 128 && valid_g > 128 && valid_b > 128 {
      "cyan"
    } else if valid_r > 128 && valid_g > 128 && valid_b > 128 {
      "white"
    } else {
      "black"
    }
    new_styles = new_styles.append(color)
  }
  
  new_chalk(new_styles)
}

// 颜色函数 - Hex
def Chalk.hex(self: Chalk, hex: String) -> Chalk {
  // 解析十六进制颜色
  if hex.starts_with("#") {
    let clean = hex.slice(1)
    if clean.length() == 6 {
      let r = Int.parse(clean.slice(0, 2), 16) ?? 0
      let g = Int.parse(clean.slice(2, 4), 16) ?? 0
      let b = Int.parse(clean.slice(4, 6), 16) ?? 0
      return self.rgb(r, g, b)
    }
  }
  
  self // 无效的 hex 值，返回原对象
}

// 颜色函数 - HSL
def Chalk.hsl(self: Chalk, h: Int, s: Int, l: Int) -> Chalk {
  // 确保参数在有效范围内
  let h_normalized = h % 360
  let s_normalized = max(0, min(100, s))
  let l_normalized = max(0, min(100, l))
  
  // HSL 到 RGB 的转换
  // 转换为 0-1 范围
  let h = h_normalized.to_float() / 360.0
  let s = s_normalized.to_float() / 100.0
  let l = l_normalized.to_float() / 100.0
  
  fn hue2rgb(p: Float, q: Float, t: Float) -> Int {
    var t = t
    if t < 0.0 { t += 1.0 }
    if t > 1.0 { t -= 1.0 }
    if t < 1.0/6.0 { 
      return ((p + (q - p) * 6.0 * t) * 255.0).to_int() 
    }
    if t < 1.0/2.0 { 
      return (q * 255.0).to_int() 
    }
    if t < 2.0/3.0 { 
      return ((p + (q - p) * (2.0/3.0 - t) * 6.0) * 255.0).to_int() 
    }
    (p * 255.0).to_int()
  }
  
  let r: Int
  let g: Int
  let b: Int
  
  if s == 0.0 {
    // 灰色
    r = (l * 255.0).to_int()
    g = (l * 255.0).to_int()
    b = (l * 255.0).to_int()
  } else {
    let q = if l < 0.5 {
      l * (1.0 + s)
    } else {
      l + s - l * s
    }
    let p = 2.0 * l - q
    
    r = hue2rgb(p, q, h + 1.0/3.0)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1.0/3.0)
  }
  
  self.rgb(r, g, b)
}

// 背景色函数 - RGB
def Chalk.bg_rgb(self: Chalk, r: Int, g: Int, b: Int) -> Chalk {
  // 类似 rgb 方法，但应用于背景色
  let valid_r = max(0, min(255, r))
  let valid_g = max(0, min(255, g))
  let valid_b = max(0, min(255, b))
  
  let support = color_detection.supports_color()
  var new_styles = self.state.styles
  
  if support.level >= 3 {
    let bg_rgb_code = "\u001b[48;2;" + valid_r.to_string() + ";" + valid_g.to_string() + ";" + valid_b.to_string() + "m"
    new_styles = new_styles.append(bg_rgb_code)
  } else if support.level >= 2 {
    let color_code = (valid_r * 6 / 256) * 36 + (valid_g * 6 / 256) * 6 + (valid_b * 6 / 256)
    let bg_ansi256_code = "\u001b[48;5;" + color_code.to_string() + "m"
    new_styles = new_styles.append(bg_ansi256_code)
  } else {
    let bg_color = if valid_r > 128 && valid_g < 128 && valid_b < 128 {
      "bg_red"
    } else if valid_r < 128 && valid_g > 128 && valid_b < 128 {
      "bg_green"
    } else if valid_r < 128 && valid_g < 128 && valid_b > 128 {
      "bg_blue"
    } else if valid_r > 128 && valid_g > 128 && valid_b < 128 {
      "bg_yellow"
    } else if valid_r > 128 && valid_g < 128 && valid_b > 128 {
      "bg_magenta"
    } else if valid_r < 128 && valid_g > 128 && valid_b > 128 {
      "bg_cyan"
    } else if valid_r > 128 && valid_g > 128 && valid_b > 128 {
      "bg_white"
    } else {
      "bg_black"
    }
    new_styles = new_styles.append(bg_color)
  }
  
  new_chalk(new_styles)
}

// 背景色函数 - Hex
def Chalk.bg_hex(self: Chalk, hex: String) -> Chalk {
  if hex.starts_with("#") {
    let clean = hex.slice(1)
    if clean.length() == 6 {
      let r = Int.parse(clean.slice(0, 2), 16) ?? 0
      let g = Int.parse(clean.slice(2, 4), 16) ?? 0
      let b = Int.parse(clean.slice(4, 6), 16) ?? 0
      return self.bg_rgb(r, g, b)
    }
  }
  
  self
}

// 背景色函数 - HSL
def Chalk.bg_hsl(self: Chalk, h: Int, s: Int, l: Int) -> Chalk {
  // 确保参数在有效范围内
  let h_normalized = h % 360
  let s_normalized = max(0, min(100, s))
  let l_normalized = max(0, min(100, l))
  
  // HSL 到 RGB 的转换
  // 转换为 0-1 范围
  let h = h_normalized.to_float() / 360.0
  let s = s_normalized.to_float() / 100.0
  let l = l_normalized.to_float() / 100.0
  
  fn hue2rgb(p: Float, q: Float, t: Float) -> Int {
    var t = t
    if t < 0.0 { t += 1.0 }
    if t > 1.0 { t -= 1.0 }
    if t < 1.0/6.0 { 
      return ((p + (q - p) * 6.0 * t) * 255.0).to_int() 
    }
    if t < 1.0/2.0 { 
      return (q * 255.0).to_int() 
    }
    if t < 2.0/3.0 { 
      return ((p + (q - p) * (2.0/3.0 - t) * 6.0) * 255.0).to_int() 
    }
    (p * 255.0).to_int()
  }
  
  let r: Int
  let g: Int
  let b: Int
  
  if s == 0.0 {
    // 灰色
    r = (l * 255.0).to_int()
    g = (l * 255.0).to_int()
    b = (l * 255.0).to_int()
  } else {
    let q = if l < 0.5 {
      l * (1.0 + s)
    } else {
      l + s - l * s
    }
    let p = 2.0 * l - q
    
    r = hue2rgb(p, q, h + 1.0/3.0)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1.0/3.0)
  }
  
  self.bg_rgb(r, g, b)
}

// 模板字符串标签方法
def Chalk.tag(self: Chalk, template: Array[String], substitutions: Array[String]) -> String {
  if !global_config.enabled {
    // 禁用颜色时，直接拼接模板和替换内容
    var result = ""
    for i in 0 to template.length() - 1 {
      result += template[i]
      if i < substitutions.length() {
        result += substitutions[i]
      }
    }
    return result
  }
  
  // 解析模板字符串，处理 {style text} 语法
  // 简化实现，实际项目中需要更复杂的解析逻辑
  var result = ""
  for i in 0 to template.length() - 1 {
    let part = template[i]
    // 这里应该实现模板语法的解析
    result += part
    
    if i < substitutions.length() {
      result += substitutions[i]
    }
  }
  
  result
}

// 主题支持
pub fn theme(theme_obj: Dict[String, Chalk]) -> Dict[String, (String) -> String] {
  var result: Dict[String, (String) -> String] = {}
  
  for (name, style) in theme_obj {
    result[name] = fn(text: String) -> String {
      // 应用主题样式到文本
      apply_style(text, style.state.styles)
    }
  }
  
  result
}

// 调用方法 - 将样式应用到文本
def Chalk.call(self: Chalk, text: String) -> String {
  apply_style(text, self.state.styles)
}

// 字符串拼接方法
def Chalk.add(self: Chalk, other: String) -> String {
  self.call(other)
}

// 允许直接使用 chalk("text") 语法
def chalk.call(text: String) -> String {
  apply_style(text, [])
}
