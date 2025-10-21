# 安装指南

## 前提条件

在使用 `chalk.mbt` 之前，您需要安装最新稳定版的 MoonBit 编译器。

## 安装步骤

### 通过 Mooncakes 安装（推荐）

在您的 MoonBit 项目中，使用 Mooncakes 包管理器添加依赖：

```bash
mooncakes add chalk.mbt
```

### 从源码安装

1. 克隆或下载本仓库

```bash
git clone <repository-url>
cd chalk.mbt
```

2. 在您的项目中引用

将 `chalk.mbt` 目录复制到您的项目中，然后在代码中导入：

```moonbit
import "./path/to/chalk.mbt/src/main"
```

## 验证安装

创建一个简单的测试文件来验证安装是否成功：

```moonbit
// test_chalk.mbt
import "chalk.mbt"

pub fn main() {
  println(chalk::chalk.red.bold("chalk.mbt 安装成功！"))
  println(chalk::chalk.green("这是绿色文本"))
  println(chalk::chalk.blue("这是蓝色文本"))
}
```

运行测试文件：

```bash
moon run test_chalk
```

如果看到彩色输出，说明安装成功。

## 运行示例

运行项目自带的示例程序，查看所有功能：

```bash
cd chalk.mbt\moon run examples/demo
```

## 运行测试

运行测试用例，确保库的功能正常：

```bash
cd chalk.mbt
moon run tests/basic_test
```