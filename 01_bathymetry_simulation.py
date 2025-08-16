#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
海底地形模拟和Figure 1绘制
Bathymetry Simulation and Figure 1 Generation

本脚本用于模拟4×5海里研究区域的海底地形，并生成包含2D等高线图和3D表面图的Figure 1。
This script simulates the seafloor topography for a 4×5 NM study area and generates Figure 1 
with both 2D contour map and 3D surface plot.
"""

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def setup_plot_style():
    """设置科学期刊级别的绘图样式"""
    plt.rcParams['font.family'] = 'Times New Roman'          # 使用Times New Roman字体（期刊标准）
    plt.rcParams['font.size'] = 10                           # 适合期刊的字体大小
    plt.rcParams['axes.linewidth'] = 1.0                     # 坐标轴线宽
    plt.rcParams['axes.labelweight'] = 'normal'              # 坐标轴标签正常字重
    plt.rcParams['xtick.labelsize'] = 9                      # X轴刻度标签大小
    plt.rcParams['ytick.labelsize'] = 9                      # Y轴刻度标签大小
    plt.rcParams['legend.fontsize'] = 9                      # 图例字体大小
    plt.rcParams['figure.dpi'] = 600                         # 高分辨率输出
    plt.rcParams['savefig.dpi'] = 600                        # 保存时的DPI
    plt.rcParams['savefig.bbox'] = 'tight'                   # 紧凑布局
    plt.rcParams['savefig.pad_inches'] = 0.1                 # 边距

def generate_bathymetry_data():
    """生成海底地形数据"""
    # 定义区域大小（海里）并转换为米
    NM_TO_M = 1852  # 海里到米的转换因子
    region_width_nm, region_height_nm = 4, 5
    region_width_m = region_width_nm * NM_TO_M
    region_height_m = region_height_nm * NM_TO_M
    
    # 创建覆盖4×5海里区域的网格点（400×500）
    nx, ny = 400, 500
    x = np.linspace(0, region_width_nm, nx)    # X坐标（海里）
    y = np.linspace(0, region_height_nm, ny)   # Y坐标（海里）
    X, Y = np.meshgrid(x, y)                   # 用于绘图的网格
    
    # 构建海底地形数据（深度，米）：基础斜坡 + 正弦变化
    depth_shallow, depth_deep = 25.0, 175.0
    # 线性平面：深度从西北（25米）到东南（175米）平滑增加
    linear_plane = depth_shallow + 0.5 * ((X/region_width_nm) + (Y/region_height_nm)) * (depth_deep - depth_shallow)
    # 大尺度正弦起伏，模拟自然海底变化
    variation1 = 20 * np.sin(2*np.pi * X / region_width_nm)           # 沿X方向一个完整正弦波（东-西）
    variation2 = 10 * np.sin(2*np.pi * Y / region_height_nm)          # 沿Y方向一个完整正弦波（北-南）
    variation3 = 5 * np.sin(2*np.pi * X / (0.3 * region_width_nm))    # 沿X方向高频变化（约3.3个周期）
    variation4 = 8 * np.sin(2*np.pi * Y / (0.7 * region_height_nm))   # 沿Y方向中频变化（约1.43个周期）
    # 最终海底地形网格（米）
    bathymetry_data = linear_plane + (variation1 + variation2 + variation3 + variation4)
    
    return X, Y, bathymetry_data, region_width_nm, region_height_nm

def plot_figure1(X, Y, bathymetry_data):
    """绘制Figure 1：包含2D等高线图和3D表面图的双子图"""
    fig1 = plt.figure(figsize=(12, 5))
    
    # (a) 2D等高线图
    ax1 = fig1.add_subplot(1, 2, 1)
    # 使用20个平滑颜色级别的填充等高线图（coolwarm色图：蓝色=深，红色=浅）
    contours = ax1.contourf(X, Y, bathymetry_data, levels=20, cmap='coolwarm')
    # 添加半透明黑色等高线以显示细节
    contour_lines = ax1.contour(X, Y, bathymetry_data, levels=20, colors='black', linewidths=0.5, alpha=0.6)
    # 标记部分等高线的深度值（包含单位）
    ax1.clabel(contour_lines, contour_lines.levels[::4], fmt="%.0f m", inline=True, fontsize=8)
    # 深度图例的颜色条
    cbar = fig1.colorbar(contours, ax=ax1, orientation='vertical', shrink=0.8)
    cbar.set_label('Depth (m)')
    # 坐标轴标签（移除标题）
    ax1.set_xlabel('East-West Distance (NM)')
    ax1.set_ylabel('North-South Distance (NM)')
    # 反转Y轴，使(0,0)位于左上角（西北角在顶部）
    ax1.invert_yaxis()
    ax1.set_aspect('equal', adjustable='box')  # X和Y的1:1纵横比
    ax1.tick_params(axis='both', direction='in', top=True, right=True, width=0.8)  # 所有边的刻度向内
    
    # (b) 3D表面图
    ax2 = fig1.add_subplot(1, 2, 2, projection='3d')
    surf = ax2.plot_surface(X, Y, bathymetry_data, cmap='coolwarm', linewidth=0, edgecolor='none', antialiased=True)
    ax2.view_init(elev=30, azim=-135)         # 视角：30°仰角，-135°方位角
    ax2.invert_zaxis()                       # 反转Z轴（使更深的深度向下）
    # 带填充的坐标轴标签以避免重叠（移除标题）
    ax2.set_xlabel('East-West Distance (NM)', labelpad=8)
    ax2.set_ylabel('North-South Distance (NM)', labelpad=8)
    ax2.set_zlabel('Depth (m)', labelpad=8)
    
    plt.tight_layout()
    plt.savefig('pic/figure1.png', dpi=600, bbox_inches='tight', pad_inches=0.1)  # 保存到pic目录
    plt.close()
    
    return bathymetry_data

def main():
    """主函数"""
    print("正在生成海底地形数据...")
    setup_plot_style()
    X, Y, bathymetry_data, region_width_nm, region_height_nm = generate_bathymetry_data()
    
    print("正在绘制Figure 1...")
    plot_figure1(X, Y, bathymetry_data)
    
    print(f"海底地形模拟完成！")
    print(f"研究区域: {region_width_nm}×{region_height_nm} 海里")
    print(f"深度范围: {np.min(bathymetry_data):.1f} - {np.max(bathymetry_data):.1f} 米")
    print(f"深度变化: {np.max(bathymetry_data) - np.min(bathymetry_data):.1f} 米")
    print("Figure 1已保存为 'figure1.png'")
    
    return X, Y, bathymetry_data

if __name__ == "__main__":
    main()