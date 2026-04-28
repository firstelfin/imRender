# imRender

> Github: [https://github.com/firstelfin/imRender](https://github.com/firstelfin/imRender)
> 
> PYPI: [https://pypi.org/project/imRender/](https://pypi.org/project/imRender/)

Image Display

- [x] Draw label annotations in labelme format onto the image.
- [x] Customize the display of flags attributes.

# Quick Start

渲染逻辑是调用时通过just_flags参数控制是否优先使用shape内指定的flags信息渲染, 其次使用类别名查找渲染等级, 两种方式都需要使用flags_key_map转义关键字. 若都没有指定, 则使用默认配置default_report.

## Install：

```shell
pip install imRender
```

## Usage:

step1: 快速导入并实例化

```python
from imRender import LabelmeChineseRenderer
# 自定义类别渲染
renderer = LabelmeChineseRenderer(
    font_path=Path.home() / ".config/elfin/fonts/Arial.Unicode.ttf",
    verbose=False,
    flags_key_map={
        "person": "critical",  # 指定渲染类别的等级
        "car": "high",
    }
)

# 使用标注实例中的flags自定义的渲染
renderer = LabelmeChineseRenderer(
    font_path=Path.home() / ".config/elfin/fonts/Arial.Unicode.ttf",
    verbose=False,
)

# 自定义默认渲染等级与渲染颜色
renderer = LabelmeChineseRenderer(
    font_path=Path.home() / ".config/elfin/fonts/Arial.Unicode.ttf",
    verbose=False,
    default_report=("critical", (0, 0, 255))  # 红色 - 关键/严重问题
)
```

step2: 调用渲染接口

```python
# 调用单张图片渲染
renderer.render_image(
    image_path="path/to/image",  # 可以直接传图像数据ndarray
    json_path="path/to/json",    # 可以直接传labelme格式的标注字典
    output_path="path/to/save_image",
    just_flags=True,  # 只使用标注中的flags信息渲染, 未标记的实例不渲染
    show_score=True,  # 渲染时带上置信度
    ind=0,  # 当前图像的序号
)
# 批次调用
renderer.render_batch(
    images_dir=Path("path/to/images"),
    labels_dir=Path("path/to/labels") or None,
    output_dir=Path("render_images/"),
    just_flags=False,  # 未使用flags标记的标签也要渲染
    show_score=True,
)
```
