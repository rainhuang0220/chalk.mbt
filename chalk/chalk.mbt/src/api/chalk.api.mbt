// 最简单的Chalk API定义 - 仅函数版本

// 只定义必要的函数接口
pub fn enable() -> Int {
  0
}

pub fn disable() -> Int {
  0
}

pub fn supports_color() -> Int {
  2
}

// 定义一个简单的chalk函数
pub fn chalk(text: String) -> String {
  text
}

// 移除theme变量以避免类型问题
