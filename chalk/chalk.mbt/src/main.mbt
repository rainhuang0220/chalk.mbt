// MoonBit Chalk 终端着色与样式库
// 功能与 Node.js 的 chalk 等价

import "./core/ansi.styles"
import "./core/color.detection"
import "./api/chalk.api"
import "./utils/ansi.utils"

// 导出公共API
pub let chalk = chalk_api.chalk
pub let strip_ansi = ansi_utils.strip_ansi
pub let visible_width = ansi_utils.visible_width
pub let supports_color = color_detection.supports_color
pub let enable = chalk_api.enable
pub let disable = chalk_api.disable