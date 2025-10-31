// 测试chalk库的演示文件

// 导入chalk模块
import "./chalk"

fn main {
  // 基础颜色测试
  println("=== 基础颜色测试 ===")
  println(chalk::black("黑色文本"))
  println(chalk::red("红色文本"))
  println(chalk::green("绿色文本"))
  println(chalk::blue("蓝色文本"))
  println(chalk::yellow("黄色文本"))
  println()
  
  // 文本样式测试
  println("=== 文本样式测试 ===")
  println(chalk::bold("粗体文本"))
  println(chalk::italic("斜体文本"))
  println(chalk::underline("下划线文本"))
  println()
  
  println("演示完成！")
}