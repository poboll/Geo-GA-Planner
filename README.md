# Geo-GA-Planner

**A hybrid optimization strategy combining a high-fidelity geometric sonar model and a Genetic Algorithm for efficient AUV coverage path planning in complex bathymetric surveys.**

## 项目简介 | Project Overview

本项目实现了一种混合优化策略，结合高保真几何声纳模型和遗传算法，用于复杂海底地形测量中的高效AUV覆盖路径规划。该方法能够根据海底地形的深度变化自适应调整测量线间距，在保证高覆盖率的同时显著减少路径长度和重叠率。

This project implements a hybrid optimization strategy that combines high-fidelity geometric sonar models with genetic algorithms for efficient AUV (Autonomous Underwater Vehicle) coverage path planning in complex bathymetric surveys. The method adaptively adjusts survey line spacing based on seafloor depth variations, achieving high coverage while significantly reducing path length and overlap.

## 主要特性 | Key Features

- 🌊 **自适应路径规划**: 根据海底地形深度自动调整测量线间距
- 📊 **高保真声纳建模**: 基于几何声纳模型的精确覆盖计算
- 🎯 **优化性能**: 相比固定间距方法减少62.5%路径长度，80.8%重叠率
- 📈 **可视化分析**: 生成详细的地形图、路径图和性能对比图
- 🔧 **模块化设计**: 清晰的代码结构，易于扩展和修改

- 🌊 **Adaptive Path Planning**: Automatically adjusts survey line spacing based on seafloor depth
- 📊 **High-Fidelity Sonar Modeling**: Precise coverage calculation based on geometric sonar models
- 🎯 **Optimized Performance**: 62.5% reduction in path length and 80.8% reduction in overlap compared to fixed-spacing methods
- 📈 **Visualization Analysis**: Generates detailed bathymetry maps, path plots, and performance comparisons
- 🔧 **Modular Design**: Clean code structure for easy extension and modification

## 项目结构 | Project Structure

```
Geo-GA-Planner/
├── 01_bathymetry_simulation.py    # 海底地形模拟和Figure 1生成
├── 02_path_optimization.py        # 路径优化算法和Figure 2生成
├── 03_performance_comparison.py   # 性能比较分析和Figure 3生成
├── requirements.txt               # Python依赖包列表
├── README.md                      # 项目说明文档
└── a.md                          # 原始数据和代码文档
```

## 安装和使用 | Installation and Usage

### 环境要求 | Requirements

- Python 3.7+
- NumPy >= 1.21.0
- Matplotlib >= 3.5.0

### 安装依赖 | Install Dependencies

```bash
pip install -r requirements.txt
```

### 运行示例 | Run Examples

#### 1. 生成海底地形和Figure 1
```bash
python 01_bathymetry_simulation.py
```
生成4×5海里研究区域的海底地形数据，包含2D等高线图和3D表面图。

#### 2. 执行路径优化和Figure 2
```bash
python 02_path_optimization.py
```
实现自适应路径优化算法，在海底地形图上叠加优化的测量路径。

#### 3. 性能比较分析和Figure 3
```bash
python 03_performance_comparison.py
```
对比混合优化方法与固定间距基准方法的性能指标。

## 算法原理 | Algorithm Principles

### 海底地形建模 | Bathymetry Modeling

项目使用数学模型生成复杂的海底地形：
- 基础线性斜坡：从西北25米到东南175米
- 多尺度正弦变化：模拟自然海底起伏
- 总深度变化范围：约150米

### 自适应路径优化 | Adaptive Path Optimization

核心优化策略包括：
1. **声纳覆盖建模**: 基于60°波束角的几何覆盖计算
2. **自适应间距**: 根据局部深度动态调整测量线间距
3. **边缘优化**: 确保区域边界的完整覆盖
4. **重叠控制**: 最小化冗余覆盖同时避免间隙

### 性能指标 | Performance Metrics

- **路径长度**: 总测量距离（海里）
- **覆盖率**: 已测量区域百分比
- **重叠率**: 重复测量区域百分比
- **间隙率**: 未覆盖区域百分比

## 实验结果 | Experimental Results

| 性能指标 | 混合优化方法 | 固定间距基准 | 改进幅度 |
|---------|-------------|-------------|----------|
| 总路径长度 (海里) | 180 | 480 | 62.5% ↓ |
| 覆盖间隙 (%) | 0.214% | 0.100% | - |
| 平均重叠 (%) | 15.0% | 78.0% | 80.8% ↓ |

## 生成的图表 | Generated Figures

- **Figure 1**: 研究区域海底地形概览（2D等高线图 + 3D表面图）
- **Figure 2**: 海底地形图上的优化测量路径
- **Figure 3**: 性能指标对比柱状图

## 贡献指南 | Contributing

欢迎提交问题报告、功能请求或代码贡献！请遵循以下步骤：

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证 | License

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

## 引用 | Citation

如果您在研究中使用了本项目，请引用：

```bibtex
@misc{geo-ga-planner,
  title={Geo-GA-Planner: A Hybrid Optimization Strategy for AUV Coverage Path Planning},
  author={[Your Name]},
  year={2024},
  url={https://github.com/poboll/Geo-GA-Planner}
}
```

## 联系方式 | Contact

- 项目链接: [https://github.com/poboll/Geo-GA-Planner](https://github.com/poboll/Geo-GA-Planner)
- 问题报告: [Issues](https://github.com/poboll/Geo-GA-Planner/issues)

## 致谢 | Acknowledgments

感谢所有为海洋测量和路径规划领域做出贡献的研究者们。

---

**关键词**: AUV, 路径规划, 海底测量, 遗传算法, 声纳建模, 覆盖优化

**Keywords**: AUV, Path Planning, Bathymetric Survey, Genetic Algorithm, Sonar Modeling, Coverage Optimization