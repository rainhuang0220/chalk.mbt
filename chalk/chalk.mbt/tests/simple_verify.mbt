import "../src/main"
import "testing"

// 简单验证第二阶段功能
fn TestPhase2() {
  println("验证第二阶段功能：")
  
  // 验证基础颜色API生成正确的ANSI代码
  testing::expect_true(chalk::chalk.red("red").contains("\u001b[31m"))
  testing::expect_true(chalk::chalk.green("green").contains("\u001b[32m"))
  testing::expect_true(chalk::chalk.blue("blue").contains("\u001b[34m"))
  
  // 验证文本样式API
  testing::expect_true(chalk::chalk.bold("bold").contains("\u001b[1m"))
  testing::expect_true(chalk::chalk.italic("italic").contains("\u001b[3m"))
  testing::expect_true(chalk::chalk.underline("underline").contains("\u001b[4m"))
  
  // 验证链式调用
  let styled = chalk::chalk.red.bold.underline("test")
  testing::expect_true(styled.contains("\u001b[31m"))
  testing::expect_true(styled.contains("\u001b[1m"))
  testing::expect_true(styled.contains("\u001b[4m"))
  
  println("第二阶段功能验证通过!")
}

// 简单验证第三阶段功能
fn TestPhase3() {
  println("\n验证第三阶段功能：")
  
  // 验证颜色支持检测
  let support = chalk::supports_color()
  testing::expect_true(support.level >= 0 && support.level <= 3)
  testing::expect_true((support.level >= 2) == support.has256)
  testing::expect_true((support.level >= 3) == support.has16m)
  
  println("颜色支持级别: " + support.level.to_string())
  println("支持256色: " + support.has256.to_string())
  println("支持真彩色: " + support.has16m.to_string())
  
  // 验证扩展颜色API（只检查是否能正常调用，不检查具体ANSI代码）
  let rgb_color = chalk::chalk.rgb(255, 0, 0)("red")
  let hex_color = chalk::chalk.hex("#00FF00")("green")
  let bg_color = chalk::chalk.bg_blue("blue bg")
  
  testing::expect_true(rgb_color.len() > 3)  // 确保返回了非空字符串
  testing::expect_true(hex_color.len() > 5)  // 确保返回了非空字符串
  testing::expect_true(bg_color.len() > 7)   // 确保返回了非空字符串
  
  println("第三阶段功能验证通过!")
}

fn main {
  println("开始验证Chalk库功能...")
  
  testing::run(TestPhase2)
  testing::run(TestPhase3)
  
  println("\n所有功能验证完成!")
}