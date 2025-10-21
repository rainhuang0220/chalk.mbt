// 简化的 Chalk 实现
// 使用正确的 MoonBit 语法

// ANSI 转义码
let reset = "\u001b[0m"
let bold = "\u001b[1m"
let red = "\u001b[31m"
let green = "\u001b[32m"
let blue = "\u001b[34m"
let yellow = "\u001b[33m"
let bg_red = "\u001b[41m"
let bg_blue = "\u001b[44m"

// 基础 Chalk 类型
pub struct Chalk {
  styles: Array[String]
}

// 创建新的 Chalk 实例
fn new_chalk(styles: Array[String]) -> Chalk {
  Chalk { styles: styles }
}

// 应用样式到文本
fn apply_styles(text: String, styles: Array[String]) -> String {
  if styles.length() == 0 {
    return text
  }
  
  var result = ""
  for style in styles {
    result += style
  }
  result + text + reset
}

// 基础颜色方法
pub fn red(text: String) -> String {
  apply_styles(text, [red])
}

pub fn green(text: String) -> String {
  apply_styles(text, [green])
}

pub fn blue(text: String) -> String {
  apply_styles(text, [blue])
}

pub fn yellow(text: String) -> String {
  apply_styles(text, [yellow])
}

// 样式方法
pub fn bold(text: String) -> String {
  apply_styles(text, [bold])
}

// 背景色方法
pub fn bg_red(text: String) -> String {
  apply_styles(text, [bg_red])
}

pub fn bg_blue(text: String) -> String {
  apply_styles(text, [bg_blue])
}

// 链式样式
pub fn red_bold(text: String) -> String {
  apply_styles(text, [red, bold])
}

pub fn green_bold(text: String) -> String {
  apply_styles(text, [green, bold])
}

pub fn blue_bold(text: String) -> String {
  apply_styles(text, [blue, bold])
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
  println(bg_red("红色背景文本"))
  println(bg_blue("蓝色背景文本"))
  println("")
  println(red_bold("红色粗体文本"))
  println(green_bold("绿色粗体文本"))
  println(blue_bold("蓝色粗体文本"))
}

