typedef void EventCallBack(arg);
class EventUtil {
  EventUtil._internal();
  //感觉像是单例
  static EventUtil _singleton = EventUtil._internal();
  factory EventUtil() => _singleton;
  var _emap = Map<Object, List<EventCallBack>>();

  //添加订阅者
  void on(eventName, EventCallBack f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= List<EventCallBack>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallBack f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

}

var eventUtil = EventUtil();