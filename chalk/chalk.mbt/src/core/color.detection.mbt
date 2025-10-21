// 终端颜色支持检测
// 负责检测终端是否支持颜色、支持的颜色级别
// 遵循 NO_COLOR、FORCE_COLOR、TERM、COLORTERM 等环境变量

module color_detection

// 导入系统模块以获取环境变量
import "sys"

// 颜色级别定义
pub type ColorSupport = {
  level: Int,     // 0: 不支持颜色, 1: 16色, 2: 256色, 3: 16m真彩色
  has256: Bool,
  has16m: Bool
}

// 默认颜色支持配置
let default_support: ColorSupport = {
  level: 0,
  has256: false,
  has16m: false
}

// 检查是否有 NO_COLOR 环境变量
// 如有，应完全禁用颜色
let has_no_color = sys.getenv("NO_COLOR") !== null

// 获取 FORCE_COLOR 环境变量的值
let force_color = sys.getenv("FORCE_COLOR")

// 获取 TERM 环境变量
let term = sys.getenv("TERM")

// 获取 COLORTERM 环境变量
let colorterm = sys.getenv("COLORTERM")

// 检查字符串是否包含子串
fn string_contains(s: String, substr: String) -> Bool {
  s.find(substr) !== null
}

// 字符串转小写
fn string_to_lowercase(s: String) -> String {
  s.to_lowercase()
}

// 字符串解析为整数
fn string_parse_int(s: String) -> Option[Int] {
  match Int.parse(s) {
    Some(x) => Some(x),
    None => None
  }
}

// 检查是否是 TTY
// 在 MoonBit 中，我们需要实现一个简单的检测方法
let is_tty = {
  // 这里是一个简化的实现
  // 实际项目中可能需要更复杂的检测逻辑
  match sys.os() {
    "windows" => true,  // Windows 环境默认认为是 TTY
    _ => term !== null && !string_contains(term, "dumb")  // 非 dumb 终端通常是 TTY
  }
}

// 检测颜色支持级别
pub fn supports_color() -> ColorSupport {
  // 如果设置了 NO_COLOR，完全禁用颜色
  if has_no_color {
    return default_support
  }

  // 如果设置了 FORCE_COLOR，强制使用指定的颜色级别
  if force_color !== null {
    let level = match string_parse_int(force_color) {
      Some(x) => x,
      None => 0
    }
    return {
      level: max(0, min(3, level)),
      has256: level >= 2,
      has16m: level >= 3
    }
  }

  // 如果不是 TTY，默认不使用颜色
  if !is_tty {
    return default_support
  }

  // 基于 COLORTERM 检测真彩色支持
  if colorterm !== null {
    let ct = string_to_lowercase(colorterm)
    if ct == "truecolor" || ct == "24bit" {
      return {
        level: 3,
        has256: true,
        has16m: true
      }
    }
  }

  // 基于 TERM 环境变量检测颜色支持
  if term !== null {
    let t = term.to_lowercase()
    if t.contains("256color") || t.contains("xterm-256color") {
      return {
        level: 2,
        has256: true,
        has16m: false
      }
    }
    if t.contains("color") || t == "xterm" || t == "screen" || t == "vt100" {
      return {
        level: 1,
        has256: false,
        has16m: false
      }
    }
  }

  // 基于操作系统类型提供默认支持
  match sys.os() {
    "windows" => {
      // Windows 10+ 的 Windows Terminal、PowerShell 通常支持真彩色
      // 这里提供一个保守的默认值
      {
        level: 2,
        has256: true,
        has16m: false
      }
    },
    "macos" => {
      // macOS 的 Terminal 通常支持 256 色
      {
        level: 2,
        has256: true,
        has16m: false
      }
    },
    "linux" => {
      // 大多数现代 Linux 终端支持 256 色
      {
        level: 2,
        has256: true,
        has16m: false
      }
    },
    _ => default_support
  }
}

// 检查是否支持特定颜色级别
pub fn supports_level(level: Int) -> Bool {
  let support = supports_color()
  support.level >= level
}

// 获取当前颜色级别
pub fn color_level() -> Int {
  supports_color().level
}
