// MoonBit Chalk CLI 演示工具 - mb-chalk-demo
// 用于展示终端的颜色支持能力和常用样式

import "../src/chalk"
import "../src/utils/ansi_utils"

fn main() {
  // 标题
  print(chalk.bold.cyan("\n========== MoonBit Chalk 终端能力演示 ==========\n"))
  
  // 显示终端能力信息
  show_terminal_capabilities()
  
  // 基本颜色测试
  print(chalk.bold.yellow("\n--- 基本 16 色测试 ---") + "\n")
  test_basic_colors()
  
  // 256 色测试（如果支持）
  let color_level = color_detection::get_color_level()
  if color_level.has_256 {
    print(chalk.bold.yellow("\n--- 256 色测试 ---") + "\n")
    test_256_colors()
  }
  
  // TrueColor 测试（如果支持）
  if color_level.has_16m {
    print(chalk.bold.yellow("\n--- TrueColor (16m) 测试 ---") + "\n")
    test_truecolor()
  }
  
  // 文本样式测试
  print(chalk.bold.yellow("\n--- 文本样式测试 ---") + "\n")
  test_text_styles()
  
  // 组合样式测试
  print(chalk.bold.yellow("\n--- 组合样式测试 ---") + "\n")
  test_combined_styles()
  
  // 背景色测试
  print(chalk.bold.yellow("\n--- 背景色测试 ---") + "\n")
  test_background_colors()
  
  // 信息总结
  print(chalk.bold.cyan("\n========== 演示完成 ==========\n"))
  print("终端能力评级: " + get_capability_rating())
  print("如需更多信息，请使用: " + chalk.green("moon run examples/complete_demo"))
}

// 显示终端能力信息
fn show_terminal_capabilities() {
  let support = color_detection::get_color_level()
  
  print("终端信息:")
  print("- 颜色支持级别: " + get_level_description(support.level))
  print("- 支持 256 色: " + (if support.has_256 { chalk.green("✓ 支持") } else { chalk.red("✗ 不支持") }))
  print("- 支持 TrueColor: " + (if support.has_16m { chalk.green("✓ 支持") } else { chalk.red("✗ 不支持") }))
  print("- 是否为 TTY: " + (if ansi_utils::is_tty() { chalk.green("✓ 是") } else { chalk.yellow("✗ 否") }))
  
  // 环境变量提示
  let env_vars = []
  if get_env("NO_COLOR") != "" {
    env_vars.push(chalk.red("NO_COLOR") + "=" + get_env("NO_COLOR"))
  }
  if get_env("FORCE_COLOR") != "" {
    env_vars.push(chalk.green("FORCE_COLOR") + "=" + get_env("FORCE_COLOR"))
  }
  
  if env_vars.length() > 0 {
    print("- 影响颜色的环境变量: " + env_vars.join(", "))
  }
}

// 获取级别描述
fn get_level_description(level: Int) -> String {
  match level {
    0 => chalk.red("0 (无颜色)"),
    1 => chalk.yellow("1 (基本 16 色)"),
    2 => chalk.blue("2 (256 色)"),
    3 => chalk.green("3 (TrueColor 16m)")
    _ => chalk.gray("未知级别")
  }
}

// 获取终端能力评级
fn get_capability_rating() -> String {
  let level = color_detection::get_color_level().level
  match level {
    0 => chalk.red("基础终端 (不支持颜色)") + " - 建议使用支持颜色的现代终端",
    1 => chalk.yellow("基本支持 (16 色)") + " - 可以显示基本颜色",
    2 => chalk.blue("良好支持 (256 色)") + " - 支持大多数终端应用",
    3 => chalk.green("优秀支持 (TrueColor)") + " - 支持最丰富的颜色体验"
    _ => chalk.gray("未知级别")
  }
}

// 测试基本颜色
fn test_basic_colors() {
  let colors = [
    ("黑色", chalk.black),
    ("红色", chalk.red),
    ("绿色", chalk.green),
    ("黄色", chalk.yellow),
    ("蓝色", chalk.blue),
    ("品红", chalk.magenta),
    ("青色", chalk.cyan),
    ("白色", chalk.white),
    ("灰色", chalk.gray)
  ]
  
  for (name, color_fn) in colors {
    print("  " + color_fn(name) + "  ")
  }
  
  print("\n明亮颜色:")
  let bright_colors = [
    ("明亮黑色", chalk.bright_black),
    ("明亮红色", chalk.bright_red),
    ("明亮绿色", chalk.bright_green),
    ("明亮黄色", chalk.bright_yellow),
    ("明亮蓝色", chalk.bright_blue),
    ("明亮品红", chalk.bright_magenta),
    ("明亮青色", chalk.bright_cyan),
    ("明亮白色", chalk.bright_white)
  ]
  
  for (name, color_fn) in bright_colors {
    print("  " + color_fn(name) + "  ")
  }
}

// 测试256色
fn test_256_colors() {
  // 展示一些256色调色板示例
  print("基本16色 (0-15):\n")
  for i in 0..16 {
    let cell = chalk.ansi256(i)(" " + i.to_string().pad_left(3) + " ")
    print(cell + " ")
    if (i + 1) % 8 == 0 {
      print("")
    }
  }
  
  print("\n颜色立方体 (16-231):\n")
  for r in 0..6 {
    for g in 0..6 {
      for b in 0..6 {
        let code = 16 + r * 36 + g * 6 + b
        print(chalk.ansi256(code)(" ") + " ")
      }
      print("")
      if r < 5 {
        print("") // 添加空行增加可读性
      }
    }
  }
  
  print("灰度 (232-255):\n")
  for i in 232..256 {
    let cell = chalk.ansi256(i)(" ")
    print(cell + " ")
  }
}

// 测试TrueColor
fn test_truecolor() {
  // 显示RGB颜色渐变
  print("RGB颜色渐变:\n")
  
  // 红色渐变
  print("红色渐变: ")
  for i in 0..10 {
    let r = 255
    let g = 255 - (i * 25)
    let b = 255 - (i * 25)
    print(chalk.rgb(r, g, b)("█"))
  }
  print("")
  
  // 绿色渐变
  print("绿色渐变: ")
  for i in 0..10 {
    let r = 255 - (i * 25)
    let g = 255
    let b = 255 - (i * 25)
    print(chalk.rgb(r, g, b)("█"))
  }
  print("")
  
  // 蓝色渐变
  print("蓝色渐变: ")
  for i in 0..10 {
    let r = 255 - (i * 25)
    let g = 255 - (i * 25)
    let b = 255
    print(chalk.rgb(r, g, b)("█"))
  }
  print("")
  
  // HEX颜色示例
  print("\nHEX颜色示例:")
  let hex_colors = ["#FF5733", "#33FF57", "#3357FF", "#F3FF33", "#FF33F3", "#33FFF3"]
  for hex in hex_colors {
    print("  " + chalk.hex(hex)(hex) + "  ")
  }
}

// 测试文本样式
fn test_text_styles() {
  let styles = [
    ("粗体", chalk.bold),
    ("斜体", chalk.italic),
    ("下划线", chalk.underline),
    ("删除线", chalk.strikethrough),
    ("暗淡", chalk.dim),
    ("反色", chalk.inverse),
    ("隐藏", chalk.hidden),
    ("重置", chalk.reset)
  ]
  
  for (name, style_fn) in styles {
    if name == "隐藏" {
      print("  " + name + ": [隐藏文本] " + style_fn("(此文本已隐藏)"))
    } else {
      print("  " + name + ": " + style_fn("这是" + name + "文本"))
    }
  }
}

// 测试组合样式
fn test_combined_styles() {
  let combined_styles = [
    chalk.bold.red,
    chalk.italic.green,
    chalk.underline.blue,
    chalk.bold.italic.yellow,
    chalk.underline.strikethrough.magenta,
    chalk.bold.dim.cyan,
    chalk.italic.underline.white,
    chalk.bold.italic.underline.strikethrough
  ]
  
  let descriptions = [
    "粗体红色",
    "斜体绿色",
    "下划线蓝色",
    "粗体斜体黄色",
    "下划线删除线品红",
    "粗体暗淡青色",
    "斜体下划线白色",
    "全样式组合"
  ]
  
  for i in 0..combined_styles.length() {
    print("  " + descriptions[i] + ": " + combined_styles[i]("组合样式演示"))
  }
}

// 测试背景色
fn test_background_colors() {
  let bg_colors = [
    chalk.bg_black.white,
    chalk.bg_red,
    chalk.bg_green,
    chalk.bg_yellow,
    chalk.bg_blue,
    chalk.bg_magenta,
    chalk.bg_cyan,
    chalk.bg_white.black
  ]
  
  let names = [
    "黑底白字",
    "红底",
    "绿底",
    "黄底",
    "蓝底",
    "品红底",
    "青底",
    "白底黑字"
  ]
  
  print("基本背景色:")
  for i in 0..bg_colors.length() {
    print("  " + bg_colors[i](" " + names[i] + " "))
  }
  
  print("\n明亮背景色:")
  let bright_bg_colors = [
    chalk.bg_bright_black,
    chalk.bg_bright_red,
    chalk.bg_bright_green,
    chalk.bg_bright_yellow,
    chalk.bg_bright_blue
  ]
  
  let bright_names = [
    "明亮黑底",
    "明亮红底",
    "明亮绿底",
    "明亮黄底",
    "明亮蓝底"
  ]
  
  for i in 0..bright_bg_colors.length() {
    print("  " + bright_bg_colors[i](" " + bright_names[i] + " "))
  }
  
  // RGB背景色示例
  print("\nRGB背景色:")
  print("  " + chalk.bg_rgb(100, 149, 237).white(" 钢蓝色背景 "))
  print("  " + chalk.bg_rgb(255, 182, 193).black(" 浅粉色背景 "))
}

// 获取环境变量（简化实现）
fn get_env(name: String) -> String {
  // 在实际环境中，这里应该调用系统API获取环境变量
  // 这里返回空字符串作为默认值
  ""
}