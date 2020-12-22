学习笔记

1.grpc demo: 
仓库：https://github.com/wuyueandrew/protobuf-test.git
分支：main
有个问题，现实场景里怎么使用grpc，是在common项目里同时生成服务端客户端文件么

2.改造rpc 
仓库：https://github.com/wuyueandrew/JavaCourseCodes
分支：opt
改造的话之前没怎么写过aop，仔细学习了下mybatis，原来是通过RpcImportBeanDefinitionRegistrar导入
自定义BeanDefinition，同时把实际的class替换成ProxyFactoryBean解决的，这招实在是高，很有收获。
改造netty这块查了下异步怎么拿到结果，普遍是通过增加一个requestId，然后把结果放在map里查询。

3.hmily实现分布式事务的转账  
https://github.com/wuyueandrew/hmily-dubbo-test.git
这块简单写了下，有个问题：如果要做到非常健壮，那可以层层保障一直开发下去，那边界到底在哪呢，希望老师解答