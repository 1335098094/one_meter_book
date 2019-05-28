/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : cauth

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 21/01/2019 22:51:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` float(255, 0) NULL DEFAULT NULL,
  `tags` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (2, '9787010009230', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '毛泽东选集 第二卷', 'https://img3.doubanio.com/view/subject/m/public/s1341342.jpg', 'https://book.douban.com/subject/1125026/', '人民出版社', '这部选集，包括了毛泽东同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《毛泽东选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。', '23.00元', 9, '毛泽东371,毛泽东选集226,政治222,哲学172,革命104,历史98,马克思主义94,政经战略80', '毛泽东', 3);
INSERT INTO `books` VALUES (3, '9787010009247', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '毛泽东选集 第三卷', 'https://img1.doubanio.com/view/subject/m/public/s1815767.jpg', 'https://book.douban.com/subject/1077621/', '人民出版社', '《毛泽东选集(第3卷)》包括了毛泽东同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《毛泽东选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。 \n下面有几点属于出版事务的声明：\n第一，现在出版的这个选集，还是不很完备的。由于国民党反动派对于革命文献的毁灭，由于在长期战争中革命文献的散失，我们现在还不能够找到毛泽东同志的全部著作，特别是毛泽东同志所写的许多书信和电报（这些在毛泽东同志著作中占很大的部分）。\n第二，有些曾经流行的著作，例如《农村调查》，遵照著者的意见，没有编入；又如《经济问题与财政问题》，也遵照著者的意见，只编进了其中的第一章（即《关于过去工作的基本总结》）。\n第三，选集中作了一些注释。其中一部分是属于题解的，附在各篇第一页的下面；其他部分，有属于政治性质的，有属于技术性质的，都附在文章的末尾。\n第四，本选集有两种装订的本子。一种是各时期的著作合订的一卷本，另一种是四卷本。四卷本的第一卷包括第一次国内革命战争时期和第二次国内革命战争时期的著作；第二卷和第三卷包括抗日战争时期的著作；第四卷包括第三次国内革命战争时期的著作。', '18.00元', 9, '毛泽东309,政治180,哲学134,毛泽东选集126,历史86,中国70,马克思主义69,革命69', '毛泽东', 1);
INSERT INTO `books` VALUES (4, '9787115352460', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', 'Node.js实战', 'https://img3.doubanio.com/view/subject/m/public/s27264241.jpg', 'https://book.douban.com/subject/25870705/', '人民邮电出版社', '服务器端JavaScript？没错。Node.js是一个JavaScript服务器，支持可伸缩的高性能Web应用。借助异步I/O，这个服务器可以同时做很多事情，能满足聊天、游戏和实时统计等应用的需求。并且既然是JavaScript，那你就可以全栈使用一种语言。\n本书向读者展示了如何构建产品级应用，对关键概念的介绍清晰明了，贴近实际的例子，涵盖从安装到部署的各个环节，是一部讲解与实践并重的优秀著作。通过学习本书，读者将深入异步编程、数据存储、输出模板、读写文件系统，掌握创建TCP/IP服务器和命令行工具等非HTTP程序的技术。本书同样非常适合熟悉Rails、Django或PHP开发的读者阅读学习。\n本书主要内容：\nNode.js及其扩展的安装配置；\n全面理解异步编程和事件循环；\n学会开发微博、聊天和游戏等热门应用。', '69.00元', 8, 'Node.js133,JavaScript71,nodejs52,node.js42,web开发40,前端开发36,编程33,node22', '[美] Mike Cantelon,[美] TJ Holowaychuk,[美] Nathan Rajlich', 0);
INSERT INTO `books` VALUES (5, '9787115437303', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '深入React技术栈', 'https://img3.doubanio.com/view/subject/m/public/s29162154.jpg', 'https://book.douban.com/subject/26918038/', '人民邮电出版社', '全面讲述React技术栈的第一本原创图书，pure render专栏主创倾力打造\n覆盖React、Flux、Redux及可视化，帮助开发者在实践中深入理解技术和源码\n前端组件化主流解决方案，一本书玩转React“全家桶”\n本书讲解了非常多的内容，不仅介绍了面向普通用户的API、应用架构和周边工具，还深入介绍了底层实现。此外，本书非常重视实战，每一节都有实际的例子，细节丰富。我从这本书里学到了很多东西，强烈推荐！\n——阮一峰，蚂蚁金服技术专家，国内技术圈知名博主，《ES 6标准入门（第2版）》作者\nReact从诞生起就颠覆了诸多传统前端开发的“铁律”，这种破旧立新开启了前端开发全新的时代。它的用法和理念，代表了现在和未来几年前端技术的潮流风向。如果不想落伍，最好进行系统学习。实践出真知，从牛人的实践中收获自己的真知，恐怕是最好的捷径。这是我看到的第一本React中文原创著作，读来倍感亲切。\n——张克军，豆瓣前端专家，国内技术圈知名博主，前端布道师\n本书内容翔实，一扫“文档说明书”之风，有大量作者的实战经验。由浅入深，无论你是 React 初学者，还是进阶人士，本书都值得一读！\n——寸志，陆金所前端架构师，《前端外刊评论》发起人\n本书从几个维度去介绍 React。一是作为 View 库，它怎么实现组件化，以及它背后的实现原理。二是扩展到 Flux 应用架构及重要的衍生品 Redux，它们怎么与 React 结合做应用开发。三是对 React 与 server 的碰撞产生的一些思考。四是讲述它在可视化方面的优势与劣势。\n本书适合有一定经验的前端开发人员阅读。\n陈屹\n前端架构师，就职于阿里巴巴。热衷开源事业，长年专注于前端架构、数据可视化、Node.js等领域，知乎专栏pure render的创办人。', 'CNY 79.00', 8, 'React152,Web前端70,JavaScript63,前端36,前端开发33,编程21,Web开发21,技术20', '陈屹', 13);
INSERT INTO `books` VALUES (6, '9787121331565', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', 'Vue移动开发实战技巧', 'https://img3.doubanio.com/view/subject/m/public/s29662615.jpg', 'https://book.douban.com/subject/27662351/', '电子工业出版社', '内容简介\nVue.js是一个渐进式的JavaScript 框架，与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。Vue 的核心库只关注视图层，它不仅易于上手，还便于与第三方库或既有项目整合。作为2016年社区最火的前端框架，越来越多的公司都在尝试用Vue来开发自己的项目。本书主要以项目维度，站在实战的角度，从项目的搭建，项目开发，到项目的优化，结合实际，多维度介绍了Vue.js。本书从实战场景出发，结合各种实用demo，结合开发环境构建，从无到有，剖析原理，全面介绍Vue2.0的实用技巧。后面几章重点讲解Vue内部实现机制，针对各种业务形态的支持以及网站调优方等等，是Vue技术体系追随者不可多得的实战宝典。', '58', 0, 'Vue8,前端6,开发4,移动3,软件开发1,互联网1,vue.js1,Vue.js1', '李利德', 8);
INSERT INTO `books` VALUES (7, '9787508051000', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '非暴力沟通', 'https://img1.doubanio.com/view/subject/m/public/s9346487.jpg', 'https://book.douban.com/subject/3533221/', '华夏出版社', '作为一个遵纪守法的好人，也许我们从来没有想过和“暴力”扯上关系。不过如果稍微留意一下现实生活中的谈话方式，并且用心体会各种谈话方式给我们的不同感受，我们一定会发现，有些话的确伤人！言语上的职责、嘲讽、否定、说教以及任意打断、拒不回应、随意出口的评价和结论给我们带来的情感和精神上的创伤，甚至比肉体的伤害更加令人痛苦。这些无心或有意的语言暴力让人与人变得冷漠、隔阂、敌视', '29.00元', 8, '心理学6312,沟通5735,人际沟通4400,非暴力沟通3693,心理2658,沟通术2119,人际关系2065,情感1762', '[美] 马歇尔·卢森堡', 6);
INSERT INTO `books` VALUES (8, '9787115275790', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', 'JavaScript高级程序设计（第3版）', 'https://img3.doubanio.com/view/subject/m/public/s8958650.jpg', 'https://book.douban.com/subject/10546125/', '人民邮电出版社', '本书是JavaScript 超级畅销书的最新版。ECMAScript 5 和HTML5 在标准之争中双双胜出，使大量专有实现和客户端扩展正式进入规范，同时也为JavaScript 增添了很多适应未来发展的新特性。本书这一版除增加5 章全新内容外，其他章节也有较大幅度的增补和修订，新内容篇幅约占三分之一。全书从JavaScript 语言实现的各个组成部分——语言核心、DOM、BOM、事件模型讲起，深入浅出地探讨了面向对象编程、Ajax 与Comet 服务器端通信，HTML5 表单、媒体、Canvas（包括WebGL）及Web Workers、地理定位、跨文档传递消息、客户端存储（包括IndexedDB）等新API，还介绍了离线应用和与维护、性能、部署相关的最佳开发实践。本书附录展望了未来的API 和ECMAScript Harmony 规范。\n本书适合有一定编程经验的Web 应用开发人员阅读，也可作为高校及社会实用技术培训相关专业课程的教材。', '99.00元', 9, 'JavaScript2282,Web前端开发1052,前端开发655,前端505,javascript493,编程447,计算机405,Web开发400', '[美] Nicholas C. Zakas', 7);
INSERT INTO `books` VALUES (9, '9787121139512', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '浪潮之巅', 'https://img3.doubanio.com/view/subject/m/public/s6807265.jpg', 'https://book.douban.com/subject/6709783/', '电子工业出版社', '近一百多年来，总有一些公司很幸运地、有意识或无意识地站在技术革命的浪尖之上。在这十几年间，它们代表着科技的浪潮，直到下一波浪潮的来临。\n从一百年前算起，AT&T 公司、IBM 公司、苹果公司、英特尔公司、微软公司、思科公司、雅虎公司和Google公司都先后被幸运地推到了浪尖。虽然，它们来自不同的领域，中间有些已经衰落或正在衰落，但是它们都极度辉煌过。本书系统地介绍了这些公司成功的本质原因及科技工业一百多年的发展。\n在极度商业化的今天，科技的进步和商机是分不开的。因此，本书也系统地介绍了影响到科技浪潮的风险投资公司，诸如 KPCB 和红杉资本，以及百年来为科技捧场的投资银行，例如高盛公司，等等。\n在这些公司兴衰的背后，有着它必然的规律。本书不仅讲述科技工业的历史，更重在揭示它的规律性。', '55.00元', 9, '互联网12651,IT9234,商业6623,计算机4769,浪潮之巅4713,历史3778,管理1903,投资1597', '吴军', 3);
INSERT INTO `books` VALUES (10, '9787508665849', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '区块链技术驱动金融', 'https://img1.doubanio.com/view/subject/m/public/s29487148.jpg', 'https://book.douban.com/subject/26860970/', '中信出版社,中信出版集团', '从数字货币及智能合约技术层面，解读了区块链技术在金融领域的运用。“如果你正在寻找一本在技术层面解释比特币是如何运作的，并且你有一定计算机科学和编程的基本知识，这本书应该很适合你。”\n《区块链：技术驱动金融》回答了一系列关于比特币如何运用区块链技术运作的问题，并且着重讲述了各种技术功能，以及未来会形成的网络。比特币是如何运作的？它因何而与众不同？你的比特币安全吗？比特币用户如何匿名？区块链如何帮助比特币实现没有身份的共识？我们可以在比特币这一平台上创建什么应用程序？加密数字货币可以被监管吗？创建一种新的数字货币将会带来什么样的变化？未来将会如何发展？\n读完这本书，你会了解到所有比特币和其他数字货币相关的知识，对区块链技术具备基础性认识，能够区别那些完全虚构的故事。你将会对于需要什么样的安全软件，如何与比特币网络进行交互有了基础概念，也可以将区块链的概念整合应用于自己的项目中。你，将会成为时代的引领者！', 'CNY 79.00', 8, '区块链1007,金融科技394,比特币366,金融324,互联网268,计算机215,技术188,新经济162', '阿尔文德·纳拉亚南,约什·贝努,爱德华·费尔顿,安德鲁·米勒,史蒂文·戈德费德', 10);
INSERT INTO `books` VALUES (11, '9787536692930', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '三体', 'https://img1.doubanio.com/view/subject/m/public/s2768378.jpg', 'https://book.douban.com/subject/2567698/', '重庆出版社', '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\n人类的末日悄然来临。', '23.00', 9, '科幻52333,刘慈欣43006,三体30882,科幻小说24745,中国18386,中国科幻18021,硬科幻16860,小说16709', '刘慈欣', 1);
INSERT INTO `books` VALUES (12, '9787115282828', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '数学之美', 'https://img3.doubanio.com/view/subject/m/public/s9114855.jpg', 'https://book.douban.com/subject/10750155/', '人民邮电出版社', '几年前，“数学之美”系列文章原刊载于谷歌黑板报，获得上百万次点击，得到读者高度评价。读者说，读了“数学之美”，才发现大学时学的数学知识，比如马尔可夫链、矩阵计算，甚至余弦函数原来都如此亲切，并且栩栩如生，才发现自然语言和信息处理这么有趣。\n今年，作者吴军博士几乎把所有文章都重写了一遍，为的是把高深的数学原理讲得更加通俗易懂，让非专业读者也能领略数学的魅力。读者通过具体的例子学到的是思考问题的方式 —— 如何化繁为简，如何用数学去解决工程问题，如何跳出固有思维不断去思考创新。', '45.00元', 9, '数学11653,计算机4907,科普4049,吴军3068,计算机科学2201,互联网1964,科学1313,Programming762', '吴军', 5);
INSERT INTO `books` VALUES (13, '9787115351531', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '图解HTTP', 'https://img3.doubanio.com/view/subject/m/public/s27283822.jpg', 'https://book.douban.com/subject/25863515/', '人民邮电出版社', '本书对互联网基盘——HTTP协议进行了全面系统的介绍。作者由HTTP协议的发展历史娓娓道来，严谨细致地剖析了HTTP协议的结构，列举诸多常见通信场景及实战案例，最后延伸到Web安全、最新技术动向等方面。本书的特色为在讲解的同时，辅以大量生动形象的通信图例，更好地帮助读者深刻理解HTTP通信过程中客户端与服务器之间的交互情况。读者可通过本书快速了解并掌握HTTP协议的基础，前端工程师分析抓包数据，后端工程师实现REST API、实现自己的HTTP服务器等过程中所需的HTTP相关知识点本书均有介绍。\n本书适合Web开发工程师，以及对HTTP协议感兴趣的各层次读者。', '49.00元', 8, 'HTTP1255,网络594,计算机541,协议364,互联网321,Web224,web210,网络编程185', '【日】上野宣', 35);
INSERT INTO `books` VALUES (14, '9787115293800', 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '算法（第4版）', 'https://img3.doubanio.com/view/subject/m/public/s28322244.jpg', 'https://book.douban.com/subject/19952400/', '人民邮电出版社', '本书全面讲述算法和数据结构的必备知识，具有以下几大特色。\n     算法领域的经典参考书\nSedgewick畅销著作的最新版，反映了经过几十年演化而成的算法核心知识体系\n 内容全面\n全面论述排序、搜索、图处理和字符串处理的算法和数据结构，涵盖每位程序员应知应会的50种算法\n 全新修订的代码\n全新的Java实现代码，采用模块化的编程风格，所有代码均可供读者使用\n 与实际应用相结合\n在重要的科学、工程和商业应用环境下探讨算法，给出了算法的实际代码，而非同类著作常用的伪代码\n 富于智力趣味性\n简明扼要的内容，用丰富的视觉元素展示的示例，精心设计的代码，详尽的历史和科学背景知识，各种难度的练习，这一切都将使读者手不释卷\n       科学的方法\n用合适的数学模型精确地讨论算法性能，这些模型是在真实环境中得到验证的\n 与网络相结合\n配套网站algs4.cs.princeton.edu提供了本书内容的摘要及相关的代码、测试数据、编程练习、教学课件等资源', '99.00元', 9, '算法2085,计算机858,编程734,计算机科学441,Algorithms406,计算机-算法392,经典272,Java264', '塞奇威克 (Robert Sedgewick),韦恩 (Kevin Wayne)', 27);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (4, 'oGwP60HD07WnRjIOtuQ3dUizRfcQ', '13', 'http是程序员必须要了解的知识', 'iPhone 6', '宁波市', '2019-01-21 21:54:42');

-- ----------------------------
-- Table structure for csessioninfo
-- ----------------------------
DROP TABLE IF EXISTS `csessioninfo`;
CREATE TABLE `csessioninfo`  (
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_visit_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`open_id`) USING BTREE,
  INDEX `openid`(`open_id`) USING BTREE,
  INDEX `skey`(`skey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会话管理用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csessioninfo
-- ----------------------------
INSERT INTO `csessioninfo` VALUES ('oGwP60HD07WnRjIOtuQ3dUizRfcQ', '60ab7823-5900-4b39-8296-067090e90022', '370c6addf80f1036258e493c807a5ada1b0a7eb1', '2019-01-08 20:50:46', '2019-01-17 22:13:06', 'kc6/Jc7V4/AI2AdpDmNWDA==', '{\"openId\":\"oGwP60HD07WnRjIOtuQ3dUizRfcQ\",\"nickName\":\"(ಡωಡ) ～～💭\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epibHQJbRMjht97BBHZyolG54hTRjbX2L5hGPZtHG7SC9leX1OewQ3spIAZkyJ7qyh4CuyLicEgsaOA/132\",\"watermark\":{\"timestamp\":1546951844,\"appid\":\"wx762b01a349d22aeb\"}}');

SET FOREIGN_KEY_CHECKS = 1;
