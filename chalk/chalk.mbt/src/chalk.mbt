// MoonBit Chalk 终端着色与样式库
// 主模块 - 导入并导出所有公共API

import "./api/chalk.api"
import "./utils/ansi.utils"
import "./core/color.detection"

// 重新导出API
pub let chalk = chalk_api::chalk
pub let strip_ansi = ansi_utils::strip_ansi
pub let visible_width = ansi_utils::visible_width
pub let supports_color = color_detection::supports_color
pub let enable = chalk_api::enable
pub let disable = chalk_api::disable
pub let theme = chalk_api::theme

// 为了兼容简单使用场景，也导出单个颜色函数
// 基础颜色
pub fn red(text: String) -> String {
  chalk.red(text)
}

pub fn green(text: String) -> String {
  chalk.green(text)
}

pub fn blue(text: String) -> String {
  chalk.blue(text)
}

pub fn black(text: String) -> String {
  chalk.black(text)
}

pub fn yellow(text: String) -> String {
  chalk.yellow(text)
}

pub fn magenta(text: String) -> String {
  chalk.magenta(text)
}

pub fn cyan(text: String) -> String {
  chalk.cyan(text)
}

pub fn white(text: String) -> String {
  chalk.white(text)
}

pub fn gray(text: String) -> String {
  chalk.gray(text)
}

// 亮色调颜色
pub fn bright_red(text: String) -> String {
  chalk.bright_red(text)
}

pub fn bright_green(text: String) -> String {
  chalk.bright_green(text)
}

pub fn bright_blue(text: String) -> String {
  chalk.bright_blue(text)
}

pub fn bright_yellow(text: String) -> String {
  chalk.bright_yellow(text)
}

pub fn bright_magenta(text: String) -> String {
  chalk.bright_magenta(text)
}

pub fn bright_cyan(text: String) -> String {
  chalk.bright_cyan(text)
}

pub fn bright_white(text: String) -> String {
  chalk.bright_white(text)
}

// 文本样式
pub fn bold(text: String) -> String {
  chalk.bold(text)
}

pub fn italic(text: String) -> String {
  chalk.italic(text)
}

pub fn underline(text: String) -> String {
  chalk.underline(text)
}

pub fn strikethrough(text: String) -> String {
  chalk.strikethrough(text)
}
