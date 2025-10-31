// ANSI 工具函数 - 完整实现

// ANSI 转义序列正则表达式
let ANSI_REGEX = "\u001b\\[([0-9;]*)[a-zA-Z]"

// 移除字符串中的所有 ANSI 序列
pub fn strip_ansi(s: String) -> String {
  s.replace(ANSI_REGEX, "")
}

// 检测字符串是否包含 ANSI 序列
pub fn has_ansi(s: String) -> Bool {
  s.match(ANSI_REGEX).is_some()
}

// 判断字符是否为宽字符
pub fn is_wide_char(c: String) -> Bool {
  // Unicode 宽字符检测
  let code = c.code_point_at(0).get_or_else(0)
  
  // CJK 字符和其他宽字符范围
  code >= 0x1100 && code <= 0x115f || // Hangul Jamo
  code >= 0x2e80 && code <= 0xa4cf || // CJK 扩展 A 到 CJK 扩展 D
  code >= 0xac00 && code <= 0xd7a3 || // Hangul Syllables
  code >= 0xf900 && code <= 0xfaff || // CJK Compatibility Ideographs
  code >= 0xff00 && code <= 0xff60 || // Halfwidth and Fullwidth Forms
  code >= 0xffe0 && code <= 0xffe6 || // Fullwidth ASCII variants
  code >= 0x20000 && code <= 0x2fffd || // CJK Unified Ideographs Extension B
  code >= 0x30000 && code <= 0x3fffd // CJK Unified Ideographs Extension C
}

// 计算字符串的可见宽度（正确处理宽字符和合成字符）
pub fn visible_width(s: String) -> Int {
  let clean = strip_ansi(s)
  let width = 0
  let i = 0
  
  while i < clean.length() {
    let c = clean.substr(i, 1)
    
    // 检查是否为宽字符
    if is_wide_char(c) {
      width = width + 2
      i = i + 1
    } else {
      // 检查是否为组合字符或代理对
      let code = c.code_point_at(0).get_or_else(0)
      
      // 跳过组合字符 (COMBINING MARK)
      if code >= 0x0300 && code <= 0x036f || 
         code >= 0x1dc0 && code <= 0x1dff || 
         code >= 0x20d0 && code <= 0x20ff || 
         code >= 0xfe20 && code <= 0xfe2f {
        // 组合字符不计入宽度
        i = i + 1
      } 
      // 检查代理对 (SURROGATE PAIR)
      else if code >= 0xd800 && code <= 0xdbff && i + 1 < clean.length() {
        // Unicode 代理对，算作一个字符
        width = width + 1
        i = i + 2
      } else {
        // 普通字符
        width = width + 1
        i = i + 1
      }
    }
  }
  
  width
}

// 转义模板字符串中的特殊字符
pub fn escape_template(s: String) -> String {
  if s == "" {
    return ""
  }
  
  let mut result = ""
  let mut i = 0
  
  while i < s.length() {
    if i + 1 < s.length() && s[i] == '{' && s[i + 1] == '{' {
      result = result + "{"
      i = i + 2
    } else if i + 1 < s.length() && s[i] == '}' && s[i + 1] == '}' {
      result = result + "}"
      i = i + 2
    } else {
      result = result + s[i]
      i = i + 1
    }
  }
  
  result
}

// 解析模板字符串标签中的样式指令
pub fn parse_template(template: Array[String], args: Array[String]) -> String {
  if template.length() == 0 {
    return ""
  }
  
  let mut result = ""
  let i = 0
  
  for part in template {
    // 解析当前模板部分中的 {style ...} 和 {{ / }}
    let parsed_part = parse_style_commands(part)
    result = result + parsed_part
    
    // 添加参数
    if i < args.length() {
      result = result + args[i]
      i = i + 1
    }
  }
  
  result
}

// 解析样式指令 {style ...} 和转义 {{ / }}
fn parse_style_commands(text: String) -> String {
  let result = ""
  let i = 0
  
  while i < text.length() {
    let c = text.substr(i, 1)
    
    if c == "{" && i + 1 < text.length() {
      let next = text.substr(i + 1, 1)
      
      if next == "{" {
        // 转义的 {{，添加单个 { 并跳过下一个
        result = result + "{"
        i = i + 2
      } else if next == "}" {
        // 转义的 }}，添加单个 } 并跳过下一个
        result = result + "}"
        i = i + 2
      } else {
        // 可能是样式指令 {style ...}
        let end_pos = text.find("}", i + 1)
        if end_pos.is_some() {
          let end = end_pos.unwrap()
          let command = text.substr(i + 1, end - i - 1).trim()
          
          // 解析样式命令
          let style_result = process_style_command(command)
          result = result + style_result
          i = end + 1
        } else {
          // 未找到结束符号，按普通字符处理
          result = result + c
          i = i + 1
        }
      }
    } else if c == "}" && i + 1 < text.length() && text.substr(i + 1, 1) == "}" {
      // 已经在上面处理过转义的 }}
      i = i + 1
    } else {
      // 普通字符
      result = result + c
      i = i + 1
    }
  }
  
  result
}

// 处理样式命令
fn process_style_command(command: String) -> String {
  // 导入chalk模块
  import "..\\chalk"
  
  // 解析样式名和内容
  let parts = command.split(" ")
  if parts.length() == 0 {
    return ""
  }
  
  let style_name = parts[0]
  let content = parts.slice(1).join(" ")
  
  // 根据样式名应用相应的chalk样式
  match style_name {
    "red" => chalk.red(content),
    "green" => chalk.green(content),
    "blue" => chalk.blue(content),
    "yellow" => chalk.yellow(content),
    "magenta" => chalk.magenta(content),
    "cyan" => chalk.cyan(content),
    "white" => chalk.white(content),
    "black" => chalk.black(content),
    "gray" | "grey" => chalk.gray(content),
    "bold" => chalk.bold(content),
    "italic" => chalk.italic(content),
    "underline" => chalk.underline(content),
    "strikethrough" => chalk.strikethrough(content),
    "dim" => chalk.dim(content),
    "inverse" => chalk.inverse(content),
    "hidden" => chalk.hidden(content),
    "reset" => chalk.reset(content),
    _ => {
      // 尝试解析组合样式，如 "red.bold" 或 "bgBlue.white"
      if style_name.includes(".") {
        let style_parts = style_name.split(".")
        let current_style = chalk
        
        for part in style_parts {
          match part {
            "red" => current_style = current_style.red,
            "green" => current_style = current_style.green,
            "blue" => current_style = current_style.blue,
            "yellow" => current_style = current_style.yellow,
            "magenta" => current_style = current_style.magenta,
            "cyan" => current_style = current_style.cyan,
            "white" => current_style = current_style.white,
            "black" => current_style = current_style.black,
            "gray" | "grey" => current_style = current_style.gray,
            "bold" => current_style = current_style.bold,
            "italic" => current_style = current_style.italic,
            "underline" => current_style = current_style.underline,
            "strikethrough" => current_style = current_style.strikethrough,
            "dim" => current_style = current_style.dim,
            "inverse" => current_style = current_style.inverse,
            "hidden" => current_style = current_style.hidden,
            "reset" => current_style = current_style.reset,
            _ => {
              // 尝试处理背景色
              if part.starts_with("bg") {
                let color_part = part.substr(2).lower()
                match color_part {
                  "black" => current_style = current_style.bg_black,
                  "red" => current_style = current_style.bg_red,
                  "green" => current_style = current_style.bg_green,
                  "blue" => current_style = current_style.bg_blue,
                  "yellow" => current_style = current_style.bg_yellow,
                  "magenta" => current_style = current_style.bg_magenta,
                  "cyan" => current_style = current_style.bg_cyan,
                  "white" => current_style = current_style.bg_white,
                  "gray" | "grey" => current_style = current_style.bg_gray,
                  _ => {}
                }
              }
            }
          }
        }
        
        // 应用组合样式
        if current_style.is_object() && current_style.has("__call") {
          return current_style.__call(content)
        }
      }
      
      // 未识别的样式，返回原始内容
      content
    }
  }
}

// 检测是否为TTY环境
pub fn is_tty() -> Bool {
  // 导入颜色检测模块
  import "..\\core\\color_detection"
  color_detection::is_tty()
}