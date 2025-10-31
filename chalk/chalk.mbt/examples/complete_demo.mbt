// MoonBit Chalk 完整功能演示

import "chalk.mbt"
import "chalk.mbt/utils/ansi_utils"
import "chalk.mbt/core/color_detection"

fn main() {
  // 欢迎信息
  print(chalk.bold.cyan("=== MoonBit Chalk 终端着色库演示 ===\n"))
  
  // 1. 基础颜色演示
  print("\n--- 基础颜色 ---")
  print("黑色: " + chalk.black("这是黑色文本"))
  print("红色: " + chalk.red("这是红色文本"))
  print("绿色: " + chalk.green("这是绿色文本"))
  print("黄色: " + chalk.yellow("这是黄色文本"))
  print("蓝色: " + chalk.blue("这是蓝色文本"))
  print("品红: " + chalk.magenta("这是品红色文本"))
  print("青色: " + chalk.cyan("这是青色文本"))
  print("白色: " + chalk.white("这是白色文本"))
  print("灰色: " + chalk.gray("这是灰色文本"))
  print("灰色别名: " + chalk.grey("这也是灰色文本"))
  
  // 2. 明亮颜色演示
  print("\n--- 明亮颜色 ---")
  print("明亮黑色: " + chalk.bright_black("这是明亮黑色文本"))
  print("明亮红色: " + chalk.bright_red("这是明亮红色文本"))
  print("明亮绿色: " + chalk.bright_green("这是明亮绿色文本"))
  print("明亮黄色: " + chalk.bright_yellow("这是明亮黄色文本"))
  print("明亮蓝色: " + chalk.bright_blue("这是明亮蓝色文本"))
  print("明亮品红: " + chalk.bright_magenta("这是明亮品红色文本"))
  print("明亮青色: " + chalk.bright_cyan("这是明亮青色文本"))
  print("明亮白色: " + chalk.bright_white("这是明亮白色文本"))
  
  // 3. 背景颜色演示
  print("\n--- 背景颜色 ---")
  print("黑底: " + chalk.bg_black.white("黑底白字"))
  print("红底: " + chalk.bg_red("这是红底文本"))
  print("绿底: " + chalk.bg_green("这是绿底文本"))
  print("黄底: " + chalk.bg_yellow("这是黄底文本"))
  print("蓝底: " + chalk.bg_blue("这是蓝底文本"))
  print("品红底: " + chalk.bg_magenta("这是品红底文本"))
  print("青底: " + chalk.bg_cyan("这是青底文本"))
  print("白底: " + chalk.bg_white.black("白底黑字"))
  
  // 4. 明亮背景颜色演示
  print("\n--- 明亮背景颜色 ---")
  print("明亮黑底: " + chalk.bg_bright_black("这是明亮黑底文本"))
  print("明亮红底: " + chalk.bg_bright_red("这是明亮红底文本"))
  print("明亮绿底: " + chalk.bg_bright_green("这是明亮绿底文本"))
  print("明亮黄底: " + chalk.bg_bright_yellow("这是明亮黄底文本"))
  print("明亮蓝底: " + chalk.bg_bright_blue("这是明亮蓝底文本"))
  
  // 5. 文本样式演示
  print("\n--- 文本样式 ---")
  print("粗体: " + chalk.bold("这是粗体文本"))
  print("斜体: " + chalk.italic("这是斜体文本"))
  print("下划线: " + chalk.underline("这是下划线文本"))
  print("删除线: " + chalk.strikethrough("这是删除线文本"))
  print("暗淡: " + chalk.dim("这是暗淡文本"))
  print("反色: " + chalk.inverse("这是反色文本"))
  print("隐藏: " + chalk.hidden("这是隐藏文本") + " (隐藏文本后)")
  print("重置: " + chalk.reset("这是重置样式文本"))
  
  // 6. 链式调用演示
  print("\n--- 链式调用组合样式 ---")
  print("粗体红色: " + chalk.bold.red("这是粗体红色文本"))
  print("斜体绿色: " + chalk.italic.green("这是斜体绿色文本"))
  print("下划线蓝色: " + chalk.underline.blue("这是下划线蓝色文本"))
  print("粗体斜体黄色: " + chalk.bold.italic.yellow("这是粗体斜体黄色文本"))
  print("蓝底白字粗体: " + chalk.bg_blue.bold.white("这是蓝底白字粗体文本"))
  print("多样式组合: " + chalk.bold.underline.italic.cyan("这是多样式组合的文本"))
  
  // 7. 扩展颜色演示
  print("\n--- 扩展颜色功能 ---")
  
  // RGB颜色
  print("RGB橙色: " + chalk.rgb(255, 165, 0)("这是RGB橙色文本"))
  print("RGB紫色: " + chalk.rgb(128, 0, 128)("这是RGB紫色文本"))
  
  // 背景RGB颜色
  print("RGB背景: " + chalk.bg_rgb(0, 128, 128).white("这是青色背景白色文本"))
  
  // 256色
  print("256色: " + chalk.ansi256(160)("这是256色中的红色文本"))
  print("256背景色: " + chalk.bg_ansi256(120)("这是256色中的绿色背景"))
  
  // HEX颜色
  print("HEX颜色: " + chalk.hex("#ff6347")("这是HEX颜色（番茄红）文本"))
  print("HEX背景: " + chalk.bg_hex("#4682b4").white("这是HEX背景（钢蓝）白色文本"))
  
  // 8. 模板字符串演示
  print("\n--- 模板字符串标签 ---")
  
  // 简单模板字符串
  let error = "严重错误"
  let code = "E1234"
  
  let template_text = chalk.tag`
  错误信息: {red ${error}}
  错误代码: {bold.yellow ${code}}
  时间: {blue ${Date.now().to_string()}}
  `
  print(template_text)
  
  // 嵌套样式
  let nested_text = chalk.tag`
  {bold 标题: {red 重要通知}}
  {italic 描述: {green 这是一个{underline 嵌套}的样式示例}}
  `
  print(nested_text)
  
  // 转义示例
  print(chalk.tag`转义示例: {{这是{red 不会被解析}的文本}}`)
  
  // 9. 辅助函数演示
  print("\n--- 辅助函数 ---")
  
  // strip_ansi
  let colored_text = chalk.red.bold("彩色文本")
  print("原始文本: " + colored_text)
  print("移除ANSI: " + ansi_utils::strip_ansi(colored_text))
  
  // visible_width
  let width_text = chalk.green("中文文本测试")
  print("文本可见宽度: " + ansi_utils::visible_width(width_text).to_string())
  
  // has_ansi
  print("包含ANSI序列: " + ansi_utils::has_ansi(colored_text).to_string())
  print("不包含ANSI序列: " + ansi_utils::has_ansi("普通文本").to_string())
  
  // 10. 颜色支持检测
  print("\n--- 颜色支持信息 ---")
  let color_support = color_detection::get_color_level()
  print("颜色级别: " + color_support.level.to_string())
  print("支持256色: " + color_support.has256.to_string())
  print("支持TrueColor: " + color_support.has16m.to_string())
  print("是否为TTY: " + color_detection::is_tty().to_string())
  
  // 11. 主题功能
  print("\n--- 主题功能 ---")
  
  // 主题功能部分移至演示末尾
  
  // 12. 启用/禁用演示
  print("\n--- 启用/禁用颜色 ---")
  print("启用颜色: " + chalk.red("这是彩色文本"))
  
  // 禁用颜色
  chalk::disable()
  print("禁用颜色: " + chalk.red("这是黑白文本"))
  
  // 重新启用颜色
  chalk::enable()
  print("重新启用颜色: " + chalk.red("这是彩色文本"))
  
  // 13. 实际应用场景示例
  print("\n--- 实际应用场景 ---")
  
  // 命令行界面样式
  print(chalk.bg_blue.bold.white(" CLI 工具 "))
  print(chalk.bold("选项:") + "\n  " + chalk.green("-h, --help") + "  显示帮助信息\n  " + chalk.green("-v, --version") + "  显示版本号")
  
  // 日志样式
  print("\n" + chalk.gray("[2023-06-15 10:30:45]") + " " + chalk.green("INFO") + "  服务器启动成功")
  print(chalk.gray("[2023-06-15 10:30:46]") + " " + chalk.yellow("WARN") + "  内存使用率超过80%")
  print(chalk.gray("[2023-06-15 10:30:47]") + " " + chalk.red("ERROR") + "  数据库连接失败")
  
  // 表格样式
  print("\n" + chalk.bold("用户列表:"))
  print(chalk.cyan("ID\tName\tEmail"))
  print("1\t" + chalk.green("张三") + "\tuser1@example.com")
  print("2\t" + chalk.green("李四") + "\tuser2@example.com")
  
  // 结束信息
  print("\n" + chalk.bold.cyan("=== 演示结束 ==="))
}