// MoonBit Chalk 终端着色与样式库 - 简化版本

// 简单的颜色函数实现
fn red(text: String) -> String {
  "\u001b[31m" + text + "\u001b[0m"
}

fn green(text: String) -> String {
  "\u001b[32m" + text + "\u001b[0m"
}

fn blue(text: String) -> String {
  "\u001b[34m" + text + "\u001b[0m"
}

fn bold(text: String) -> String {
  "\u001b[1m" + text + "\u001b[0m"
}

// 颜色支持检测函数
fn supports_color() -> Int {
  2 // 假设支持256色
}

// 主函数演示
fn main {
  println("Chalk 库功能演示:")
  println(red("红色文本"))
  println(green("绿色文本"))
  println(bold(blue("蓝色粗体文本")))
  println("颜色支持级别: " + supports_color().to_string())
}
