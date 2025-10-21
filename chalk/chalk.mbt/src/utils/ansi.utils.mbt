// ANSI 工具函数
// 提供处理 ANSI 转义序列的实用工具

module ansi_utils

import "regex"

// 移除字符串中的所有 ANSI 转义序列
pub fn strip_ansi(s: String) -> String {
  // ANSI 转义序列的正则表达式
  let ansi_regex = regex::Regex.new("\\u001b\\[[0-9;]*m")
  ansi_regex.replace_all(s, "")
}

// 计算字符串的可见宽度（忽略 ANSI 转义序列）
// 正确处理宽字符/合成字符
pub fn visible_width(s: String) -> Int {
  let clean = strip_ansi(s)
  let chars = clean.to_array()
  var width = 0
  
  for c in chars {
    let code_point = c.code_point()
    // 宽字符（如中文、日文、韩文等）通常占两个字符宽度
    // 这里使用一个简化的判断，实际项目中可能需要更复杂的 Unicode 宽度表
    if (code_point >= 0x4e00 && code_point <= 0x9fff) ||  // CJK 统一表意文字
       (code_point >= 0x3040 && code_point <= 0x30ff) ||  // 日文平假名和片假名
       (code_point >= 0xac00 && code_point <= 0xd7af) ||  // 韩文音节
       (code_point >= 0x3400 && code_point <= 0x4dbf) ||  // 扩展 A
       (code_point >= 0x20000 && code_point <= 0x2a6df) || // 扩展 B
       code_point == 0x3000 {  // 全角空格
      width += 2
    } else if code_point < 32 ||  // 控制字符
              code_point == 127 { // DEL 字符
      width += 0
    } else {
      width += 1
    }
  }
  
  width
}

// 检查字符串是否包含 ANSI 转义序列
pub fn has_ansi(s: String) -> Bool {
  let ansi_regex = regex::Regex.new("\\u001b\\[[0-9;]*m")
  ansi_regex.find(s) !== null
}

// 转义特殊字符，使其在模板字符串中可以正确显示
pub fn escape_template(s: String) -> String {
  // 转义大括号
  s.replace("{", "{{").replace("}", "}}")
}

// unescape 模板字符串中的转义字符
pub fn unescape_template(s: String) -> String {
  // 恢复转义的大括号
  s.replace("{{", "{").replace("}}", "}")
}

// 合并相邻的相同样式 ANSI 代码，减少输出大小
pub fn optimize_ansi(s: String) -> String {
  // 简化实现：合并相同的重置代码
  let optimized = s.replace("\u001b[0m\u001b[0m", "\u001b[0m")
  optimized
}