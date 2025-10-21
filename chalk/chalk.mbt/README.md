# chalk.mbt

MoonBit 终端着色与样式库，功能与 Node.js 的 chalk 等价。用于在终端中打印彩色、高亮、下划线、背景色等格式化文本。

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