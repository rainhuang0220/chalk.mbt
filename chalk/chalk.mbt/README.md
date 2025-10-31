# MoonBit Chalk

![MoonBit Chalk Logo](https://via.placeholder.com/150)

一个功能强大的 MoonBit 终端着色与样式库，与 Node.js 的 chalk 库功能等价，支持链式 API、模板字符串、自动能力检测等特性。

## 功能特性

- **链式样式 API**：支持流畅的链式调用，如 `chalk.red.bold("text")`
- **丰富的颜色支持**：前景色、背景色、16色、256色、TrueColor (16m)
- **文本样式**：粗体、斜体、下划线、删除线、暗淡、反色、隐藏等
- **模板字符串标签**：支持 `chalk.tag\{red error\}` 语法
- **自动能力检测**：根据终端环境自动降级，支持 0-3 级颜色
- **环境变量兼容**：遵循 NO_COLOR、FORCE_COLOR 等标准
- **辅助工具函数**：stripAnsi、visibleWidth、supportsColor 等
- **主题功能**：自定义颜色主题
- **跨平台兼容**：支持 Linux、macOS、Windows 终端

## 安装

将此库添加到您的 MoonBit 项目中：

```bash
# 在项目中添加依赖
moon add chalk.mbt
```

## 基本用法

### 导入库

```moonbit
import "chalk.mbt"
```

### 基本颜色

```moonbit
print(chalk.red("红色文本"))
print(chalk.green("绿色文本"))
print(chalk.blue("蓝色文本"))
```

### 链式调用

```moonbit
print(chalk.bold.red("粗体红色文本"))
print(chalk.italic.green("斜体绿色文本"))
print(chalk.underline.blue("下划线蓝色文本"))
print(chalk.bold.italic.underline.yellow("多重样式组合"))
```

### 背景色

```moonbit
print(chalk.bg_red("红色背景"))
print(chalk.bg_blue.white("蓝底白字"))
print(chalk.bg_green.bold("粗体绿底"))
```

### 扩展颜色

```moonbit
// RGB 颜色
print(chalk.rgb(255, 165, 0)("橙色文本"))

// 背景 RGB 颜色  
print(chalk.bg_rgb(0, 128, 0)("绿色背景"))

// 256 色
print(chalk.ansi256(160)("256色中的红色"))

// HEX 颜色
print(chalk.hex("#FF6347")("番茄红色"))
print(chalk.bg_hex("#4682b4")("钢蓝色背景"))
```

### 模板字符串

```moonbit
let error = "错误信息"
let code = "E1234"

// 使用模板标签
let message = chalk.tag`
错误: {red ${error}}
代码: {bold.yellow ${code}}
`

print(message)
```

### 主题功能

```moonbit
// 创建自定义主题
let custom_theme = chalk::theme({
  "success": chalk.green.bold,
  "error": chalk.red.bold,
  "warning": chalk.yellow.bold,
  "info": chalk.blue.bold
})

print(custom_theme.success("操作成功!"))
print(custom_theme.error("操作失败!"))
```

### 辅助函数

```moonbit
import "chalk.mbt/ansi_utils"

// 移除 ANSI 序列
let clean = ansi_utils::strip_ansi(chalk.red("彩色文本"))

// 计算可见宽度
let width = ansi_utils::visible_width("中文文本测试")

// 检测是否包含 ANSI 序列
let has_color = ansi_utils::has_ansi(chalk.red("彩色文本"))

// 获取颜色支持信息
let color_support = color_detection::get_color_level()
print("颜色级别: " + color_support.level.to_string())
```

### 启用/禁用颜色

```moonbit
// 禁用颜色
chalk::disable()
print(chalk.red("这将显示为普通文本"))

// 重新启用颜色
chalk::enable()
print(chalk.red("这将显示为红色文本"))
```

## 完整 API 参考

### 前景色

- **基本颜色**: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `gray`, `grey`
- **明亮颜色**: `bright_black`, `bright_red`, `bright_green`, `bright_yellow`, `bright_blue`, `bright_magenta`, `bright_cyan`, `bright_white`

### 背景色

- **基本背景色**: `bg_black`, `bg_red`, `bg_green`, `bg_yellow`, `bg_blue`, `bg_magenta`, `bg_cyan`, `bg_white`, `bg_gray`, `bg_grey`
- **明亮背景色**: `bg_bright_black`, `bg_bright_red`, `bg_bright_green`, `bg_bright_yellow`, `bg_bright_blue`, `bg_bright_magenta`, `bg_bright_cyan`, `bg_bright_white`

### 文本样式

- `bold`: 粗体
- `dim`: 暗淡
- `italic`: 斜体
- `underline`: 下划线
- `strikethrough`: 删除线
- `inverse`: 反色
- `hidden`: 隐藏
- `reset`: 重置

### 扩展颜色方法

- `rgb(r: Int, g: Int, b: Int)`: RGB 颜色
- `bg_rgb(r: Int, g: Int, b: Int)`: RGB 背景色
- `ansi256(code: Int)`: 256 色
- `bg_ansi256(code: Int)`: 256 背景色
- `hex(color: String)`: HEX 颜色
- `bg_hex(color: String)`: HEX 背景色

### 工具函数

- `chalk::enable()`: 启用颜色
- `chalk::disable()`: 禁用颜色
- `chalk::theme(colors: Dict[String, Object])`: 创建自定义主题
- `chalk::tag(template: Array[String], args: Array[String])`: 模板标签函数
- `ansi_utils::strip_ansi(s: String)`: 移除 ANSI 序列
- `ansi_utils::visible_width(s: String)`: 计算可见宽度
- `ansi_utils::has_ansi(s: String)`: 检测是否包含 ANSI 序列
- `color_detection::get_color_level()`: 获取颜色支持级别

## 终端兼容性

本库会根据终端环境自动检测颜色支持能力并降级：

- **级别 0**: 无颜色
- **级别 1**: 基本 16 色
- **级别 2**: 256 色
- **级别 3**: TrueColor (1600万色)

遵循以下环境变量规则：
- `NO_COLOR`: 存在时禁用所有颜色
- `FORCE_COLOR`: 强制设置颜色级别 (0-3)
- 自动检测 `TERM` 和 `COLORTERM` 环境变量

## 演示

### 运行完整演示

```bash
moon run examples/complete_demo
```

### 运行终端能力测试

```bash
moon run examples/mb_chalk_demo
```

这将显示您的终端支持的颜色能力和各种样式示例。

## 实际应用场景

### 命令行工具输出

```moonbit
print(chalk.bold("选项:") + "\n  " + chalk.green("-h, --help") + "  显示帮助信息")
```

### 日志系统

```moonbit
print(chalk.gray("[INFO] ") + "应用启动成功")
print(chalk.yellow("[WARN] ") + "内存使用率超过80%")
print(chalk.red("[ERROR] ") + "数据库连接失败")
```

### 表格和数据展示

```moonbit
print(chalk.bold("用户列表"))
print(chalk.cyan("ID\tName\tEmail"))
print("1\t" + chalk.green("张三") + "\tuser1@example.com")
```

## 注意事项

- 在非 TTY 环境（如管道或重定向输出）中，默认会禁用颜色
- 使用 `chalk::enable()` 可以强制在非 TTY 环境启用颜色
- 宽字符和合成字符的宽度计算可能在某些复杂情况下不够准确
- 嵌套样式可能会在某些终端中出现不一致的行为

## 许可证

MIT License

## 贡献

欢迎提交问题和拉取请求！

## 功能特性

- **链式样式 API**：支持 `chalk.red.bold("text")`、`chalk.bgHex("#005cc5").white("text")` 等链式调用
- **模板字符串**：支持 `chalk.tag` 模板标签语法
- **颜色能力检测**：自动检测终端的颜色支持级别（0/16/256/16m 四级）
- **环境变量支持**：遵循 NO_COLOR、FORCE_COLOR、TERM、COLORTERM 等标准环境变量
- **样式覆盖与重置**：正确处理嵌套、交错样式，避免"色彩泄漏"
- **跨平台兼容**：支持 Linux/macOS/Windows 终端（含 PowerShell/Windows Terminal）
- **辅助工具函数**：提供 `stripAnsi`、`visibleWidth`、`supportsColor` 等实用工具
- **主题支持**：通过 `theme` 函数定义和使用自定义主题

## 安装

在 MoonBit 项目中，通过 Mooncakes 包管理器添加依赖：

```bash
mooncakes add chalk.mbt
```

## 基本使用

```moonbit
import "chalk.mbt"

// 基本颜色
println(chalk::chalk.red("红色文本"))
println(chalk::chalk.green("绿色文本"))
println(chalk::chalk.blue("蓝色文本"))

// 链式样式
println(chalk::chalk.red.bold.underline("红色粗体下划线文本"))
println(chalk::chalk.bg_blue.white.bold("蓝色背景白色粗体文本"))

// RGB 颜色
println(chalk::chalk.rgb(255, 165, 0)("橙色文本"))
println(chalk::chalk.bg_rgb(128, 0, 128).white("紫色背景白色文本"))

// HEX 颜色
println(chalk::chalk.hex("#ff6b6b")("粉红色文本"))
println(chalk::chalk.bg_hex("#4ecdc4").black("青绿色背景黑色文本"))
```

## API 参考

### 文本样式
- `bold`: 粗体
- `dim`: 暗淡
- `italic`: 斜体
- `underline`: 下划线
- `strikethrough`: 删除线
- `inverse`: 反转
- `hidden`: 隐藏
- `reset`: 重置所有样式

### 基础颜色（前景色）
- `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `gray`

### 亮色调颜色（前景色）
- `bright_black`, `bright_red`, `bright_green`, `bright_yellow`, `bright_blue`, `bright_magenta`, `bright_cyan`, `bright_white`

### 背景色
- `bg_black`, `bg_red`, `bg_green`, `bg_yellow`, `bg_blue`, `bg_magenta`, `bg_cyan`, `bg_white`

### 亮色调背景色
- `bg_bright_black`, `bg_bright_red`, `bg_bright_green`, `bg_bright_yellow`, `bg_bright_blue`, `bg_bright_magenta`, `bg_bright_cyan`, `bg_bright_white`

### 颜色函数
- `rgb(r: Int, g: Int, b: Int)`: 设置 RGB 颜色
- `hex(hex: String)`: 设置十六进制颜色
- `hsl(h: Int, s: Int, l: Int)`: 设置 HSL 颜色
- `bg_rgb(r: Int, g: Int, b: Int)`: 设置 RGB 背景色
- `bg_hex(hex: String)`: 设置十六进制背景色
- `bg_hsl(h: Int, s: Int, l: Int)`: 设置 HSL 背景色

### 辅助函数
- `stripAnsi(s: String) -> String`: 移除字符串中的所有 ANSI 转义序列
- `visibleWidth(s: String) -> Int`: 计算字符串的可见宽度（忽略 ANSI 转义序列）
- `supportsColor() -> { level: Int, has256: Bool, has16m: Bool }`: 获取终端的颜色支持信息
- `enable() -> Unit`: 启用颜色
- `disable() -> Unit`: 禁用颜色
- `theme(theme_obj: Dict[String, Chalk]) -> Dict[String, (String) -> String]`: 创建主题

## 模板字符串

支持模板标签语法：

```moonbit
// 注意：MoonBit 的模板字符串语法可能与 JavaScript 不同，具体使用请参考 MoonBit 文档
```

## 环境变量

- **NO_COLOR**: 设置此变量（任意值）将完全禁用颜色输出
- **FORCE_COLOR**: 设置颜色强制级别（0=禁用，1=16色，2=256色，3=真彩色）
- **TERM**: 终端类型，影响颜色检测
- **COLORTERM**: 终端颜色类型，如设置为 `truecolor` 或 `24bit` 表示支持真彩色

## 运行演示

运行示例程序查看所有功能：

```bash
cd chalk.mbt
moon run examples/demo
```

## 项目结构

```
chalk.mbt/
├── src/
│   ├── core/        # 核心功能实现
│   ├── api/         # API定义
│   ├── utils/       # 工具函数
│   └── main.mbt     # 入口文件
├── tests/           # 测试用例
├── examples/        # 示例代码
└── README.md        # 项目文档
```

## 注意事项

- 在非 TTY 环境（如重定向到文件）中，默认会禁用颜色输出
- 可以使用 `enable()` 函数强制启用颜色，即使在非 TTY 环境中
- 对于不支持的颜色级别，库会自动降级到终端支持的最高级别

## 参考资料

- [Chalk](https://github.com/chalk/chalk)
- [supports-color](https://github.com/chalk/supports-color)
- [ansi-styles](https://github.com/chalk/ansi-styles)
- [NO_COLOR 规范](https://no-color.org/)

## License

MIT