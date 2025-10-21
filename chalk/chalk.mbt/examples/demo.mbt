// Chalk 库演示示例
// 展示常用样式、颜色和能力级别

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

  // 基础样式展示
  println("=== 基础样式 ===")
  println(chalk::chalk.bold("粗体文本"))
  println(chalk::chalk.dim("暗淡文本"))
  println(chalk::chalk.italic("斜体文本"))
  println(chalk::chalk.underline("下划线文本"))
  println(chalk::chalk.strikethrough("删除线文本"))
  println(chalk::chalk.inverse("反转文本"))
  println(chalk::chalk.hidden("隐藏文本") + " (隐藏文本，实际终端可能不可见)")
  println("")

  // 基础颜色展示
  println("=== 基础颜色 ===")
  println(chalk::chalk.black("黑色文本"))
  println(chalk::chalk.red("红色文本"))
  println(chalk::chalk.green("绿色文本"))
  println(chalk::chalk.yellow("黄色文本"))
  println(chalk::chalk.blue("蓝色文本"))
  println(chalk::chalk.magenta("品红文本"))
  println(chalk::chalk.cyan("青色文本"))
  println(chalk::chalk.white("白色文本"))
  println(chalk::chalk.gray("灰色文本"))
  println("")

  // 亮色调颜色展示
  println("=== 亮色调颜色 ===")
  println(chalk::chalk.bright_black("亮黑色文本"))
  println(chalk::chalk.bright_red("亮红色文本"))
  println(chalk::chalk.bright_green("亮绿色文本"))
  println(chalk::chalk.bright_yellow("亮黄色文本"))
  println(chalk::chalk.bright_blue("亮蓝色文本"))
  println(chalk::chalk.bright_magenta("亮品红文本"))
  println(chalk::chalk.bright_cyan("亮青色文本"))
  println(chalk::chalk.bright_white("亮白色文本"))
  println("")

  // 背景色展示
  println("=== 背景色 ===")
  println(chalk::chalk.bg_black.white("黑色背景白色文本"))
  println(chalk::chalk.bg_red.white("红色背景白色文本"))
  println(chalk::chalk.bg_green.black("绿色背景黑色文本"))
  println(chalk::chalk.bg_yellow.black("黄色背景黑色文本"))
  println(chalk::chalk.bg_blue.white("蓝色背景白色文本"))
  println("")

  // 链式样式展示
  println("=== 链式样式 ===")
  println(chalk::chalk.red.bold.underline("红色粗体下划线文本"))
  println(chalk::chalk.bg_blue.white.bold("蓝色背景白色粗体文本"))
  println("")

  // RGB 颜色展示
  println("=== RGB 颜色 ===")
  println(chalk::chalk.rgb(255, 165, 0)("橙色文本 (RGB: 255,165,0)"))
  println(chalk::chalk.bg_rgb(128, 0, 128).white("紫色背景白色文本 (RGB: 128,0,128)"))
  println("")

  // HEX 颜色展示
  println("=== HEX 颜色 ===")
  println(chalk::chalk.hex("#ff6b6b")("粉红色文本 (HEX: #ff6b6b)"))
  println(chalk::chalk.bg_hex("#4ecdc4").black("青绿色背景黑色文本 (HEX: #4ecdc4)"))
  println("")

  // 工具函数演示
  println("=== 工具函数 ===")
  let colored_text = chalk::chalk.red.bold("红色粗体文本")
  println("原始文本: %{colored_text}")
  println("移除ANSI: %{chalk::strip_ansi(colored_text)}")
  println("可见宽度: %{chalk::visible_width(colored_text)}")
  println("")

  // 主题演示
  println("=== 主题 ===")
  let themes = chalk::theme({
    "error": chalk::chalk.red.bold,
    "success": chalk::chalk.green.bold,
    "info": chalk::chalk.blue.italic,
    "warning": chalk::chalk.yellow.bold
  })
  
  if themes.contains("error") {
    println(themes["error"]("这是一个错误消息"))
  }
  if themes.contains("success") {
    println(themes["success"]("操作成功完成"))
  }
  if themes.contains("info") {
    println(themes["info"]("这是一条信息"))
  }
  if themes.contains("warning") {
    println(themes["warning"]("警告：请谨慎操作"))
  }
  println("")

  // 启用/禁用颜色演示
  println("=== 启用/禁用颜色 ===")
  println("启用颜色: " + chalk::chalk.red("这是红色文本"))
  chalk::disable()
  println("禁用颜色: " + chalk::chalk.red("这是应该没有颜色的文本"))
  chalk::enable()
  println("重新启用颜色: " + chalk::chalk.red("这是红色文本"))
}
