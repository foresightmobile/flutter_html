import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = """
<h1>This is H1</h1>
<h2>This is h2</h2>
<h3>This is h3</h3>
<h4>This is h4</h4>
<h5>This is H5</h5>
<p>This is a normal paragraph of text</p>
<p>This paragraph will have pieces <strong>such as bold</strong>&nbsp;and an <a href=\"http://google.com\">inline link to an external site</a><br /><br />A line break within the paragraph and maybe a <span style=\"color:#ff0000;\">s</span><span style=\"color:#ffff00;\">p</span><span style=\"color:#ff00ff;\">a</span><span style=\"color:#003300;\">s</span><span style=\"color:#ff6600;\">h</span><span style=\"color:#ff0000;\"> </span><span style=\"color:#990066;\">o</span><span style=\"color:#0000ff;\">f</span><span style=\"color:#ff0000;\"> c</span><span style=\"color:#ffff00;\">o</span><span style=\"color:#ff00ff;\">l</span><span style=\"color:#003300;\">o</span><span style=\"color:#ff6600;\">r</span> then a link to a <a class=\"cmspage\" href=\"cmspage-4389\">cms page</a>. Other inline styles could include <em>italic</em>, <u>underline...</u></p>
<ol>
   <li>Number list item 1</li>
   <li>Number list item 2</li>
   <li>Number list item 3</li>
</ol>
<ul>
   <li>Bullet list item 1</li>
   <li>Bullet list item 2</li>
   <li>Bullet list item 3</li>
</ul>
<p>Left aligned copy</p>
<p style=\"text-align: center;\">Centered copy</p><p style=\"text-align: right;\">Right aligned copy</p>
<p><span style=\"font-size:8px;\">Duis autem vel eum iriure dolor in</span> <span style=\"font-size:10px;\">hendrerit in vulputate </span><span style=\"font-size:12px;\">velit esse molestie consequat</span>, <span style=\"font-size:14px;\">vel illum dolore eu feugiat nulla facilisis</span> <span style=\"font-size:16px;\">at vero eros et accumsan et iusto odio </span><span style=\"font-size:18px;\">dignissim qui blandit praesent luptatum zzril</span> <span style=\"font-size:20px;\">delenit augue duis dolore te feugait nulla facilisi.</span> <span style=\"font-size:22px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, </span><span style=\"font-size:24px;\">sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</span></p>""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ),
    );
  }
}
