﻿# Copyright 2012 Mozilla Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Main toolbar buttons (tooltips and alt text for images)
previous.title=上一页
previous_label=上一页
next.title=下一页
next_label=下一页

# LOCALIZATION NOTE (page.title): The tooltip for the pageNumber input.
page.title=页面
# LOCALIZATION NOTE (of_pages): "{{pagesCount}}" will be replaced by a number
# representing the total number of pages in the document.
of_pages=/ {{pagesCount}}
# LOCALIZATION NOTE (page_of_pages): "{{pageNumber}}" and "{{pagesCount}}"
# will be replaced by a number representing the currently visible page,
# respectively a number representing the total number of pages in the document.
page_of_pages=({{pageNumber}} / {{pagesCount}})

zoom_out.title=缩小
zoom_out_label=缩小
zoom_in.title=放大
zoom_in_label=放大
zoom.title=缩放
presentation_mode.title=切换到演示模式
presentation_mode_label=演示模式
open_file.title=打开文件
open_file_label=打开
print.title=打印
print_label=打印
download.title=下载
download_label=下载
bookmark.title=当前在看的内容（复制或在新窗口中打开）
bookmark_label=当前在看

# Secondary toolbar and context menu
tools.title=工具
tools_label=工具
first_page.title=转到第一页
first_page.label=转到第一页
first_page_label=转到第一页
last_page.title=转到最后一页
last_page.label=转到最后一页
last_page_label=转到最后一页
page_rotate_cw.title=顺时针旋转
page_rotate_cw.label=顺时针旋转
page_rotate_cw_label=顺时针旋转
page_rotate_ccw.title=逆时针旋转
page_rotate_ccw.label=逆时针旋转
page_rotate_ccw_label=逆时针旋转

cursor_text_select_tool.title=启用文本选择工具
cursor_text_select_tool_label=文本选择工具
cursor_hand_tool.title=启用手形工具
cursor_hand_tool_label=手形工具

scroll_vertical.title=使用垂直滚动
scroll_vertical_label=垂直滚动
scroll_horizontal.title=使用水平滚动
scroll_horizontal_label=水平滚动
scroll_wrapped.title=使用平铺滚动
scroll_wrapped_label=平铺滚动

spread_none.title=不加入衔接页
spread_none_label=单页视图
spread_odd.title=加入衔接页使奇数页作为起始页
spread_odd_label=双页视图
spread_even.title=加入衔接页使偶数页作为起始页
spread_even_label=书籍视图

# Document properties dialog box
document_properties.title=文档属性…
document_properties_label=文档属性…
document_properties_file_name=文件名:
document_properties_file_size=文件大小:
# LOCALIZATION NOTE (document_properties_kb): "{{size_kb}}" and "{{size_b}}"
# will be replaced by the PDF file size in kilobytes, respectively in bytes.
document_properties_kb={{size_kb}} KB ({{size_b}} 字节)
# LOCALIZATION NOTE (document_properties_mb): "{{size_mb}}" and "{{size_b}}"
# will be replaced by the PDF file size in megabytes, respectively in bytes.
document_properties_mb={{size_mb}} MB ({{size_b}} 字节)
document_properties_title=标题:
document_properties_author=作者:
document_properties_subject=主题:
document_properties_keywords=关键词:
document_properties_creation_date=创建日期:
document_properties_modification_date=修改日期:
# LOCALIZATION NOTE (document_properties_date_string): "{{date}}" and "{{time}}"
# will be replaced by the creation/modification date, and time, of the PDF file.
document_properties_date_string={{date}}, {{time}}
document_properties_creator=创建者:
document_properties_producer=PDF 生成器：
document_properties_version=PDF 版本:
document_properties_page_count=页数:
document_properties_page_size=页面大小：
document_properties_page_size_unit_inches=英寸
document_properties_page_size_unit_millimeters=毫米
document_properties_page_size_orientation_portrait=纵向
document_properties_page_size_orientation_landscape=横向
document_properties_page_size_name_a3=A3
document_properties_page_size_name_a4=A4
document_properties_page_size_name_letter=文本
document_properties_page_size_name_legal=法律
# LOCALIZATION NOTE (document_properties_page_size_dimension_string):
# "{{width}}", "{{height}}", {{unit}}, and {{orientation}} will be replaced by
# the size, respectively their unit of measurement and orientation, of the (current) page.
document_properties_page_size_dimension_string={{width}} × {{height}} {{unit}}（{{orientation}}）
# LOCALIZATION NOTE (document_properties_page_size_dimension_name_string):
# "{{width}}", "{{height}}", {{unit}}, {{name}}, and {{orientation}} will be replaced by
# the size, respectively their unit of measurement, name, and orientation, of the (current) page.
document_properties_page_size_dimension_name_string={{width}} × {{height}} {{unit}}（{{name}}，{{orientation}}）
# LOCALIZATION NOTE (document_properties_linearized): The linearization status of
# the document; usually called "Fast Web View" in English locales of Adobe software.
document_properties_linearized=快速 Web 视图：
document_properties_linearized_yes=是
document_properties_linearized_no=否
document_properties_close=关闭

print_progress_message=正在准备打印文档…
# LOCALIZATION NOTE (print_progress_percent): "{{progress}}" will be replaced by
# a numerical per cent value.
print_progress_percent={{progress}}%
print_progress_close=取消

# Tooltips and alt text for side panel toolbar buttons
# (the _label strings are alt text for the buttons, the .title strings are
# tooltips)
toggle_sidebar.title=切换侧栏
toggle_sidebar_notification.title=切换侧栏（文档所含的大纲/附件）
toggle_sidebar_notification2.title=切换侧栏（文档所含的大纲/附件/图层）
toggle_sidebar_label=切换侧栏
document_outline.title=显示文档大纲（双击展开/折叠所有项）
document_outline_label=文档大纲
attachments.title=显示附件
attachments_label=附件
layers.title=显示图层（双击即可将所有图层重置为默认状态）
layers_label=图层
thumbs.title=显示缩略图
thumbs_label=缩略图
current_outline_item.title=查找当前大纲项目
current_outline_item_label=当前大纲项目
findbar.title=在文档中查找
findbar_label=查找

additional_layers=其他图层
# LOCALIZATION NOTE (page_canvas): "{{page}}" will be replaced by the page number.
page_canvas=第 {{page}} 页
# LOCALIZATION NOTE (page_landmark): "{{page}}" will be replaced by the page number.
page_landmark=第 {{page}} 页
# Thumbnails panel item (tooltip and alt text for images)
# LOCALIZATION NOTE (thumb_page_title): "{{page}}" will be replaced by the page
# number.
thumb_page_title=第 {{page}} 页
# LOCALIZATION NOTE (thumb_page_canvas): "{{page}}" will be replaced by the page
# number.
thumb_page_canvas=页面 {{page}} 的缩略图

# Find panel button title and messages
find_input.title=查找
find_input.placeholder=在文档中查找…
find_previous.title=查找词语上一次出现的位置
find_previous_label=上一页
find_next.title=查找词语后一次出现的位置
find_next_label=下一页
find_highlight=全部高亮显示
find_match_case_label=区分大小写
find_entire_word_label=字词匹配
find_reached_top=到达文档开头，从末尾继续
find_reached_bottom=到达文档末尾，从开头继续
# LOCALIZATION NOTE (find_match_count): The supported plural forms are
# [one|two|few|many|other], with [other] as the default value.
# "{{current}}" and "{{total}}" will be replaced by a number representing the
# index of the currently active find result, respectively a number representing
# the total number of matches in the document.
find_match_count={[ plural(total) ]}
find_match_count[one]=第 {{current}} 项，共匹配 {{total}} 项
find_match_count[two]=第 {{current}} 项，共匹配 {{total}} 项
find_match_count[few]=第 {{current}} 项，共匹配 {{total}} 项
find_match_count[many]=第 {{current}} 项，共匹配 {{total}} 项
find_match_count[other]=第 {{current}} 项，共匹配 {{total}} 项
# LOCALIZATION NOTE (find_match_count_limit): The supported plural forms are
# [zero|one|two|few|many|other], with [other] as the default value.
# "{{limit}}" will be replaced by a numerical value.
find_match_count_limit={[ plural(limit) ]}
find_match_count_limit[zero]=超过 {{limit}} 项匹配
find_match_count_limit[one]=超过 {{limit}} 项匹配
find_match_count_limit[two]=超过 {{limit}} 项匹配
find_match_count_limit[few]=超过 {{limit}} 项匹配
find_match_count_limit[many]=超过 {{limit}} 项匹配
find_match_count_limit[other]=超过 {{limit}} 项匹配
find_not_found=找不到指定词语

# Error panel labels
error_more_info=更多信息
error_less_info=更少信息
error_close=关闭
# LOCALIZATION NOTE (error_version_info): "{{version}}" and "{{build}}" will be
# replaced by the PDF.JS version and build ID.
error_version_info=PDF.js v{{version}} (build: {{build}})
# LOCALIZATION NOTE (error_message): "{{message}}" will be replaced by an
# english string describing the error.
error_message=信息：{{message}}
# LOCALIZATION NOTE (error_stack): "{{stack}}" will be replaced with a stack
# trace.
error_stack=堆栈：{{stack}}
# LOCALIZATION NOTE (error_file): "{{file}}" will be replaced with a filename
error_file=文件：{{file}}
# LOCALIZATION NOTE (error_line): "{{line}}" will be replaced with a line number
error_line=行号：{{line}}
rendering_error=渲染页面时发生错误。

# Predefined zoom values
page_scale_width=适合页宽
page_scale_fit=适合页面
page_scale_auto=自动缩放
page_scale_actual=实际大小
# LOCALIZATION NOTE (page_scale_percent): "{{scale}}" will be replaced by a
# numerical scale value.
page_scale_percent={{scale}}%

# Loading indicator messages
loading_error_indicator=错误

# Loading indicator messages
loading=正在载入…
loading_error=载入 PDF 时发生错误。
invalid_file_error=无效或损坏的 PDF 文件。
missing_file_error=缺少 PDF 文件。
unexpected_response_error=意外的服务器响应。

# LOCALIZATION NOTE (annotation_date_string): "{{date}}" and "{{time}}" will be
# replaced by the modification date, and time, of the annotation.
annotation_date_string={{date}}，{{time}}

# LOCALIZATION NOTE (text_annotation_type.alt): This is used as a tooltip.
# "{{type}}" will be replaced with an annotation type from a list defined in
# the PDF spec (32000-1:2008 Table 169 – Annotation types).
# Some common types are e.g.: "Check", "Text", "Comment", "Note"
text_annotation_type.alt=[{{type}} 注释]
password_label=输入密码以打开此 PDF 文件。
password_invalid=密码无效。请重试。
password_ok=确定
password_cancel=取消

printing_not_supported=警告：此浏览器尚未完整支持打印功能。
printing_not_ready=警告：此 PDF 未完成载入，无法打印。
web_fonts_disabled=Web 字体已被禁用：无法使用嵌入的 PDF 字体。
# LOCALIZATION NOTE (unsupported_feature_signatures): Should contain the same
# exact string as in the `chrome.properties` file.
unsupported_feature_signatures=此 PDF 文档包含数字签名。尚不支持签名验证。
