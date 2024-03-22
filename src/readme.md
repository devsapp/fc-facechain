
> 注：当前项目为 Serverless Devs 应用，由于应用中会存在需要初始化才可运行的变量（例如应用部署地区、函数名等等），所以**不推荐**直接 Clone 本仓库到本地进行部署或直接复制 s.yaml 使用，**强烈推荐**通过 `s init ${模版名称}` 的方法或应用中心进行初始化，详情可参考[部署 & 体验](#部署--体验) 。

# fc-facechain-v3 帮助文档
<p align="center" class="flex justify-center">
    <a href="https://www.serverless-devs.com" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain-v3&type=packageType">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-facechain-v3" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain-v3&type=packageVersion">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-facechain-v3" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain-v3&type=packageDownload">
  </a>
</p>

<description>

通过 AI 打造个人数字形象，获得独属于自己的个人形象数字替身

</description>

<codeUrl>

- [:smiley_cat: 代码](https://github.com/devsapp/fc-facechain)

</codeUrl>
<preview>



</preview>


## 前期准备

使用该项目，您需要有开通以下服务并拥有对应权限：

<service>



| 服务/业务 |  权限  | 相关文档 |
| --- |  --- | --- |
| 函数计算 |  创建函数 | [帮助文档](https://help.aliyun.com/product/2508973.html) [计费文档](https://help.aliyun.com/document_detail/2512928.html) |
| 硬盘挂载 |  创建实例 | [帮助文档](https://help.aliyun.com/zh/nas) [计费文档](https://help.aliyun.com/zh/nas/product-overview/billing) |

</service>

<remark>



</remark>

<disclaimers>



</disclaimers>

## 部署 & 体验

<appcenter>
   
- :fire: 通过 [Serverless 应用中心](https://fcnext.console.aliyun.com/applications/create?template=fc-facechain-v3) ，
  [![Deploy with Severless Devs](https://img.alicdn.com/imgextra/i1/O1CN01w5RFbX1v45s8TIXPz_!!6000000006118-55-tps-95-28.svg)](https://fcnext.console.aliyun.com/applications/create?template=fc-facechain-v3) 该应用。
   
</appcenter>
<deploy>
    
- 通过 [Serverless Devs Cli](https://www.serverless-devs.com/serverless-devs/install) 进行部署：
  - [安装 Serverless Devs Cli 开发者工具](https://www.serverless-devs.com/serverless-devs/install) ，并进行[授权信息配置](https://docs.serverless-devs.com/fc/config) ；
  - 初始化项目：`s init fc-facechain-v3 -d fc-facechain-v3`
  - 进入项目，并进行项目部署：`cd fc-facechain-v3 && s deploy -y`
   
</deploy>

## 案例介绍

<appdetail id="flushContent">

本案例将 [FaceChain](https://github.com/modelscope/facechain)，这一可以用来打造个人数字形象的深度学习模型工具，快速创建并部署到阿里云函数计算 FC。

用户仅需要提供最低一张照片即可获得独属于自己的个人形象数字替身。FaceChain 支持在 gradio 的界面中使用模型训练和推理能力、支持资深开发者使用 python 脚本进行训练推理，也支持在 sd webui 中安装插件使用。 FaceChain的模型由ModelScope开源模型社区提供支持。

FaceChain 目前已经收获超过 8K star，并且相关论文已收录于 CVPR 2024，是 AI 浪潮下里程碑式的项目。

由于 FaceChain 需要通过 GPU 算力进行运算，且部署存在一定的门槛要求。因此借助于 Serverless 开发平台，用户可以简单、方便地将 FaceChain 部署至函数计算，快速感受 AIGC 的魅力。

</appdetail>

## 使用流程

<usedetail id="flushContent">

### 训练

1. 进入页面后可以阅读页面上的提示信息，避免后续操作出错
2. 请先为需要训练的人物设置名字（每一组图片名字不能重复，训练失败时也需要换用新的名称）
3. 上传图片请等待页面可以看到预览图片后再进行后续操作，否则可能会存在图片损坏影响训练
4. 确保图片全部加载完成后，点击“开始训练”。训练速度取决于图片个数，一般 1～2 张图片的耗时在 5～10 分钟，请耐心等待

![](https://img.alicdn.com/imgextra/i4/O1CN01u6zfwb25NvNEE5Y8t_!!6000000007515-0-tps-750-551.jpg)

### 出图

1. 图片训练完成后，切换至 “无限风格形象写真” 或 “固定模板形象写真”
2. 选择需要的基模型，控制大致风格  
![](https://img.alicdn.com/imgextra/i1/O1CN01mnctDI1PWQrtuA5AE_!!6000000001848-0-tps-1265-175.jpg)
3. 选择刚才训练的虚拟形象（如果找不到可以点击右侧的刷新按钮）  
![](https://img.alicdn.com/imgextra/i4/O1CN01IM3C1r1n4XWggQmD7_!!6000000005036-0-tps-1497-128.jpg)
4. 根据喜好选择期望的风格（建议选取同性别的风格）  
![](https://img.alicdn.com/imgextra/i3/O1CN018908Mq1EAU7EXsBGC_!!6000000000311-0-tps-750-589.jpg)
5. 如有特殊需求，可以展开 “高级选项”，修改提示词、通过 openpose 控制姿态等（初次使用不建议配置该内容）  
![](https://img.alicdn.com/imgextra/i2/O1CN012sGhQH1J3DupDyEDe_!!6000000000972-0-tps-750-292.jpg)
6. 点击“开始生成”。图片生成大概需要 3～5 分钟，请耐心等待  
![](https://img.alicdn.com/imgextra/i3/O1CN01EIEWE81uptn9IBBpc_!!6000000006087-0-tps-750-243.jpg)
7. 待图片生成完毕后，可以右键保存分享给朋友  
![](https://img.alicdn.com/imgextra/i2/O1CN01gmJ9721JAYFir87n9_!!6000000000988-0-tps-750-428.jpg)

</usedetail>

## 注意事项

<matters id="flushContent">

- 该案例依赖于函数计算 FC 和文件存储 NAS 两款产品
- 由于 FaceChain 使用依赖大量的模型（约 64GB），可能会产生每月几十元的费用，请注意资费情况
- FaceChain 为开源项目，可以前往 [开源社区](https://github.com/modelscope/facechain) 进行进一步讨论

</matters>


<devgroup>


## 开发者社区

您如果有关于错误的反馈或者未来的期待，您可以在 [Serverless Devs repo Issues](https://github.com/serverless-devs/serverless-devs/issues) 中进行反馈和交流。如果您想要加入我们的讨论组或者了解 FC 组件的最新动态，您可以通过以下渠道进行：

<p align="center">  

| <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407298906_20211028074819117230.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407044136_20211028074404326599.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407252200_20211028074732517533.png" width="130px" > |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| <center>微信公众号：`serverless`</center>                                                                                         | <center>微信小助手：`xiaojiangwh`</center>                                                                                        | <center>钉钉交流群：`33947367`</center>                                                                                           |
</p>
</devgroup>
