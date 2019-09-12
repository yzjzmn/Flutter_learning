// BLoC 业务逻辑组件（Business Logic Component）

// 在 iOS 上更新 views，只需要直接改变它们就可以了。
// 在 Flutter 中，widgets 是不可变的，而且不能被直接更新。
// 你需要去操纵 widget 的 state。

/**
 * 我们一直在找寻强大的状态管理方式。也许你并没有想过，flutter自身已经为我们提供了状态管理，而且你经常都在用到。
 * 没错，它就是 Stateful widget。
 * 当我们接触到flutter的时候，首先需要了解的就是有些小部件是有状态的，有些则是无状态的。
 * stateless widget 与 stateful widget。
 * 一旦当app的交互变得复杂，setState出现的次数便会显著增加，每次setState都会重新调用build方法，这势必对于性能以及代码的可阅读性带来一定的影响
 */

main(List<String> args) {
  // BLoC是一种利用reactive programming方式构建应用的方法，这是一个由流构成的完全异步的世界。

}