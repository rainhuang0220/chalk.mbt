// 简单演示文件
import "../src/main"

fn main {
  // 基础功能测试
  println("MoonBit Chalk 简单演示")
  println("")
  
  // 基本颜色测试
  println("基本颜色:")
  println("  " + red("红色文本"))
  println("  " + green("绿色文本"))
  println("  " + blue("蓝色文本"))
  println("")
  
  // 简单组合测试
  println("简单组合:")
  println("  " + bold(red("粗体红色")))
  println("  " + bold(green("粗体绿色")))
  println("  " + bold(blue("粗体蓝色")))
  println("")
  
  // 颜色支持信息
  println("颜色支持级别: " + supports_color().to_string())
  println("")
  
  println("演示完成！")
}

