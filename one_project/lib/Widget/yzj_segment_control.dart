import 'package:flutter/material.dart';

typedef ValueChanged<T, M> = void Function(T value, M valueM);

/**
 * segmentControl
 */
class YZJSegmentControl extends StatefulWidget {
	final double height;
	final double width;
	final List<String> tabs;
	final ValueChanged<int, String> selected;
	final Color normalTitleColor;
	final Color activeTitleColor;
	final TextStyle normalTitleStyle;
	final TextStyle activeTitleStyle;
  final Color indicatorColor;
	final double indicatorWeight;

	final double radius;
	
	final bool selectNone;
	
	YZJSegmentControl({
		@required this.tabs,
		@required this.selected,
		this.height = 44,
		this.width = double.infinity,
		this.normalTitleColor = Colors.blue,
		this.activeTitleColor = Colors.white,
		this.normalTitleStyle = const TextStyle(fontSize: 16, color: Colors.black),
		this.activeTitleStyle = const TextStyle(fontSize: 18, color: Colors.blue),
		this.radius = 0,
    this.indicatorColor,
    this.indicatorWeight = 2.0,

		this.selectNone = false,
	});
	
	_YZJSegmentControlState state;
	
	@override
	_YZJSegmentControlState createState() {
		state = _YZJSegmentControlState();
		return state;
	}
}

class _YZJSegmentControlState extends State<YZJSegmentControl> with SingleTickerProviderStateMixin {
	
  TabController _tabController;
	
	@override
	void initState() {
		super.initState();
		_tabController = TabController(length: widget.tabs.length, vsync: this);
		_tabController.addListener(() {
			if (_tabController.indexIsChanging) {
				setState(() {});
				widget.selected(_tabController.index, widget.tabs[_tabController.index]);
			}
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return SizedBox(
			height: widget.height,
			width: widget.width,
			child: TabBar(
				controller: _tabController,
				tabs: widget.tabs.map((f) {
					var idx = widget.tabs.indexOf(f);
					return Tab(
						child:new Container(
              padding: EdgeInsets.all(0.0),
              child: Text(
                f, 
                style: (idx == _tabController.index && !widget.selectNone) ? widget.activeTitleStyle : widget.normalTitleStyle)
                ) 
					);
				}).toList(),
				isScrollable: false,
				indicatorColor: widget.indicatorColor,
        indicatorWeight: widget.indicatorWeight,
        indicatorSize: TabBarIndicatorSize.label,//指示器宽度样式
				labelPadding: EdgeInsets.zero,
			),
		);
	}
}
