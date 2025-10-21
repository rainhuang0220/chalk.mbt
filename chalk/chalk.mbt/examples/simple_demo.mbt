// 简化的 Chalk 库演示
// 测试基本功能

import "../src/main"

// 主函数
fn main {
  // 显示终端颜色支持信息
  let support = chalk::supports_color()
  println("终端颜色支持信息:")
  println("级别: %{support.level}")
  println("支持256色: %{support.has256}")
  println("支持真彩色: %{support.has16m}")
  println("")

  // 基础颜色展示
  println("=== 基础颜色 ===")
  println(chalk::chalk.red("红色文本"))
  println(chalk::chalk.green("绿色文本"))
  println(chalk::chalk.blue("蓝色文本"))
  println("")

  // 链式样式展示
  println("=== 链式样式 ===")
  println(chalk::chalk.red.bold("红色粗体文本"))
  println(chalk::chalk.bg_blue.white("蓝色背景白色文本"))
  println("")

  // 工具函数演示
  println("=== 工具函数 ===")
  let colored_text = chalk::chalk.red.bold("红色粗体文本")
  println("原始文本: %{colored_text}")
  println("移除ANSI: %{chalk::strip_ansi(colored_text)}")
  println("可见宽度: %{chalk::visible_width(colored_text)}")
  println("")

  // 启用/禁用颜色演示
  println("=== 启用/禁用颜色 ===")
  println("启用颜色: " + chalk::chalk.red("这是红色文本"))
  chalk::disable()
  println("禁用颜色: " + chalk::chalk.red("这是应该没有颜色的文本"))
  chalk::enable()
  println("重新启用颜色: " + chalk::chalk.red("这是红色文本"))
}

