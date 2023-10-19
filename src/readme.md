
> 注：当前项目为 Serverless Devs 应用，由于应用中会存在需要初始化才可运行的变量（例如应用部署地区、服务名、函数名等等），所以**不推荐**直接 Clone 本仓库到本地进行部署或直接复制 s.yaml 使用，**强烈推荐**通过 `s init ` 的方法或应用中心进行初始化，详情可参考[部署 & 体验](#部署--体验) 。

# fc-facechain 帮助文档
<p align="center" class="flex justify-center">
    <a href="https://www.serverless-devs.com" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain&type=packageType">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-facechain" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain&type=packageVersion">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-facechain" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-facechain&type=packageDownload">
  </a>
</p>

<description>

在阿里云函数计算（FC）部署 facechain

</description>

<codeUrl>

- [:smiley_cat: 代码](https://github.com/devsapp/fc-facechain)

</codeUrl>
<preview>



</preview>


## 前期准备

使用该项目，您需要有开通以下服务：

<service>



| 服务 |  备注  |
| --- |  --- |
| 函数计算 FC |  提供 CPU、GPU 等计算资源 |
| 文件存储 NAS |  存储所需的大模型 |

</service>

推荐您拥有以下的产品权限 / 策略：
<auth>
</auth>

<remark>

您还需要注意：   
- 部署大概需要 10min，训练大概需要 7min，出图大概需要 5 min，请耐心等待；
- NAS 内置需要存储大概需要 26G 空间，可能会产生一定的费用；
- 提供的训练图片、模型以及生成的图片均存储在您账号下的 NAS 中，请注意保护数据安全

</remark>

<disclaimers>

免责声明：   
应用来自于 Github 项目https://github.com/modelscope/facechain，仅对其在 Serverless 场景下部署进行适配

</disclaimers>

## 部署 & 体验

<appcenter>
   
- :fire: 通过 [Serverless 应用中心](https://fcnext.console.aliyun.com/applications/create?template=fc-facechain) ，
  [![Deploy with Severless Devs](https://img.alicdn.com/imgextra/i1/O1CN01w5RFbX1v45s8TIXPz_!!6000000006118-55-tps-95-28.svg)](https://fcnext.console.aliyun.com/applications/create?template=fc-facechain) 该应用。
   
</appcenter>
<deploy>
    
- 通过 [Serverless Devs Cli](https://www.serverless-devs.com/serverless-devs/install) 进行部署：
  - [安装 Serverless Devs Cli 开发者工具](https://www.serverless-devs.com/serverless-devs/install) ，并进行[授权信息配置](https://docs.serverless-devs.com/fc/config) ；
  - 初始化项目：`s init fc-facechain -d fc-facechain `
  - 进入项目，并进行项目部署：`cd fc-facechain && s deploy - y`
   
</deploy>

## 应用详情

<appdetail id="flushContent">

1. 本次实验涉及 函数计算（FC） 和 文件存储（NAS），未开通过对应云产品的用户可以前往 https://free.aliyun.com/  领取 3 个月试用资源包。
2. 进入函数计算控制台 https://fcnext.console.aliyun.com/overview，点击 “应用”
3. 在 “人工智能” 中搜索 “facechain”
4. 部署类型选择 “直接部署”，请确保所需要的权限均已获取（缺失权限请按照引导进行操作）。操作完毕后点击 “创建并部署默认环境”
5. 等待部署任务开始
6. 部署需要加载 facechain 所需要的模型（约 26G），因此大概需要花费 10 分钟，请耐心等待。页面右侧可以看到当前部署进度及部署日志
7. 部署完成后，您可以在当前页面看到您的应用地址
8. 进入页面后可以阅读页面上的提示信息，避免后续操作出错
9. 请先为需要训练的人物设置名字（每一组图片名字不能重复，训练失败时也需要换用新的名称）
10. 上传图片请等待页面可以看到预览图片后再进行后续操作，否则可能会存在图片损坏影响训练
11. 确保图片全部加载完成后，点击“开始训练”。训练速度取决于图片个数，一般 1～2 张图片的耗时在 5～10 分钟，请耐心等待
12. 图片训练完成后，切换至 “无限风格形象写真” 或 “固定模板形象写真”
13. 选择需要的基模型，控制大致风格
14. 选择刚才训练的虚拟形象（如果找不到可以点击右侧的刷新按钮）
15. 根据喜好选择期望的风格（建议选取同性别的风格）
16. 如有特殊需求，可以展开 “高级选项”，修改提示词、通过 openpose 控制姿态等（初次使用不建议配置该内容）
17. 点击“开始生成”。图片生成大概需要 3～5 分钟，请耐心等待
18. 待图片生成完毕后，可以右键保存分享给朋友 



</appdetail>

## 使用文档

<usedetail id="flushContent">
</usedetail>


<devgroup>


## 开发者社区

您如果有关于错误的反馈或者未来的期待，您可以在 [Serverless Devs repo Issues](https://github.com/serverless-devs/serverless-devs/issues) 中进行反馈和交流。如果您想要加入我们的讨论组或者了解 FC 组件的最新动态，您可以通过以下渠道进行：

<p align="center">  

| <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407298906_20211028074819117230.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407044136_20211028074404326599.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407252200_20211028074732517533.png" width="130px" > |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| <center>微信公众号：`serverless`</center>                                                                                         | <center>微信小助手：`xiaojiangwh`</center>                                                                                        | <center>钉钉交流群：`33947367`</center>                                                                                           |
</p>
</devgroup>
