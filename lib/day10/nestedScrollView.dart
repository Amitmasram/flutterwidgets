import 'package:flutter/material.dart';

class MyNestedScrollView extends StatelessWidget {
  const MyNestedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('NestedScrollView Example'),
                background: Image.network(
                  'https://example.com/your_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}

class MyNestedScrollViewCool extends StatelessWidget {
  const MyNestedScrollViewCool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('NestedScrollView Playground'),
                background: _buildHeader(),
              ),
            ),
          ];
        },
        body: _buildBody(),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://example.com/your_image.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
        ),
        Center(
          child: Text(
            'Welcome to the Playground',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
