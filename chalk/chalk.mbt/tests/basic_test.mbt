// 基本功能测试

import "../src/main"
import "testing"

// 测试基本颜色功能
fn test_basic_colors() {
  testing::expect_true(chalk::chalk.red("red").contains("\u001b[31m"))
  testing::expect_true(chalk::chalk.green("green").contains("\u001b[32m"))
  testing::expect_true(chalk::chalk.blue("blue").contains("\u001b[34m"))
}

// 测试链式样式
fn test_chained_styles() {
  let styled = chalk::chalk.red.bold.underline("test")
  testing::expect_true(styled.contains("\u001b[31m"))
  testing::expect_true(styled.contains("\u001b[1m"))
  testing::expect_true(styled.contains("\u001b[4m"))
  testing::expect_true(styled.contains("\u001b[0m")) // 应该有重置码
}

// 测试strip_ansi函数
fn test_strip_ansi() {
  let colored = chalk::chalk.red.bold("test")
  let stripped = chalk::strip_ansi(colored)
  testing::expect_eq(stripped, "test")
  testing::expect_false(stripped.contains("\u001b"))
}

// 测试visible_width函数
fn test_visible_width() {
  let normal = "hello"
  let colored = chalk::chalk.red("hello")
  let wide_chars = "你好世界"
  
  testing::expect_eq(chalk::visible_width(normal), 5)
  testing::expect_eq(chalk::visible_width(colored), 5)  // 应该忽略ANSI序列
  testing::expect_eq(chalk::visible_width(wide_chars), 8)  // 中文字符应该占2个宽度
}

// 测试启用/禁用功能
fn test_enable_disable() {
  chalk::enable()
  let enabled = chalk::chalk.red("test")
  testing::expect_true(enabled.contains("\u001b"))
  
  chalk::disable()
  let disabled = chalk::chalk.red("test")
  testing::expect_eq(disabled, "test")
  
  chalk::enable()  // 恢复默认状态
}

// 测试supports_color函数
fn test_supports_color() {
  let support = chalk::supports_color()
  testing::expect_true(support.level >= 0 && support.level <= 3)
  testing::expect_true(support.level >= 2 == support.has256)
  testing::expect_true(support.level >= 3 == support.has16m)
}

// 运行所有测试
pub fn main() {
  testing::run(test_basic_colors)
  testing::run(test_chained_styles)
  testing::run(test_strip_ansi)
  testing::run(test_visible_width)
  testing::run(test_enable_disable)
  testing::run(test_supports_color)
}